package com.hackathon.mail;

import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import java.util.Properties;

import com.hackathon.dataobject.UserComments;

public class EmailServiceHelper {

    private static final String SMTP_HOST_NAME = "smtp.sendgrid.net";
    private static final String SMTP_AUTH_USER = "7bqGkrFzDt";
    private static final String SMTP_AUTH_PWD  = "GACREvc4E1EM0227";
   // private static final String SMTP_TO_USER = "gdmmadhan@yahoo.in";
    		
    		
    public void createJiraTicket(UserComments userComments) throws Exception{
        Properties props = new Properties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.host", SMTP_HOST_NAME);
        props.put("mail.smtp.port", 587);
        props.put("mail.smtp.auth", "true");

        Authenticator auth = new SMTPAuthenticator();
        Session mailSession = Session.getDefaultInstance(props, auth);
        // uncomment for debugging infos to stdout
        // mailSession.setDebug(true);
        Transport transport = mailSession.getTransport();

        MimeMessage message = new MimeMessage(mailSession);

        Multipart multipart = new MimeMultipart("alternative");

        BodyPart part1 = new MimeBodyPart();
        part1.setText("Title"+userComments.getTitle());

        BodyPart part2 = new MimeBodyPart();
        part2.setContent(userComments.getComments(), "text/html");

        multipart.addBodyPart(part1);
        multipart.addBodyPart(part2);

        message.setContent(multipart);
        message.setFrom(new InternetAddress(userComments.getUserMailId()));
        message.setSubject(userComments.getTitle());
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(userComments.getDevGroupId()));

        transport.connect();
        transport.sendMessage(message,message.getRecipients(Message.RecipientType.TO));
        transport.close();
    }

    private class SMTPAuthenticator extends javax.mail.Authenticator {
        public PasswordAuthentication getPasswordAuthentication() {
           String username = SMTP_AUTH_USER;
           String password = SMTP_AUTH_PWD;
           return new PasswordAuthentication(username, password);
        }
    }
}
