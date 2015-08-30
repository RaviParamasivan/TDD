package com.hackathon.util;

import com.hackathon.dataobject.UserComments;
import com.hackathon.mail.EmailServiceHelper;

public class Healper {

	public boolean updateUserComments(UserComments userComments) throws Exception {
		
		try{
			if (isValidInput(userComments)) {
				DataSource updateCustomeComments = new DataSource();
				EmailServiceHelper email = new EmailServiceHelper();
				userComments.setSensitive(true);

				System.out.println("userComments     1     >     "+userComments);
				email.createJiraTicket(userComments);
				updateCustomeComments.updateCustomeComments(userComments);
			}
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
		return true;
	}

	public boolean isValidInput(UserComments userComments) throws Exception {
		boolean isValid = true;
		// TODO Auto-generated method stub
		if (userComments != null) {
			if (Util.isNull(userComments.getCategaroy())) {
				isValid = false;
			}
			if (Util.isNull(userComments.getComments())) {
				isValid = false;
			}
			if (Util.isNull(userComments.getModuleName())) {
				isValid = false;
			}
			if (Util.isNull(userComments.getTitle())) {
				isValid = false;
			}
		}
		return isValid;
	}

}
