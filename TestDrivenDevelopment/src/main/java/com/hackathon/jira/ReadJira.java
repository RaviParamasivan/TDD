
package com.hackathon.jira;

import javax.net.ssl.TrustManager;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;


public class ReadJira {

    WebResource webResource;
    static {
        //for localhost testing only
        javax.net.ssl.HttpsURLConnection.setDefaultHostnameVerifier(
        new javax.net.ssl.HostnameVerifier(){

            public boolean verify(String hostname,
                    javax.net.ssl.SSLSession sslSession) {
                if (hostname.equals("your host here")) {
                    return true;
                }
                return false;
            }
        });
    }

    public static void main(String[] args) {
        // TODO Auto-generated method stub
    	ReadJira rl = new ReadJira();

        //rl.connectToJiraViaRest();

        rl.editJiraTicket();
    }

    public void connectToJiraViaRest(){
        //System.setProperty("javax.net.ssl.trustStore", "C:/SSL/clientkeystore.jks");

        Client client = Client.create();
        client.addFilter(new HTTPBasicAuthFilter("senhan84@gmail.com", "bluemount"));

        webResource = client.resource("https://jigarthandaone.atlassian.net/rest/api/2/search?jql");

    }

    public void editJiraTicket(){
        connectToJiraViaRest();

        ClientResponse response = webResource.type("application/json").put(ClientResponse.class,"{\"fields\":{\"customfield_11420\":{\"value\" :\"No\"}}}");
        //"{\"fields\":{\"customfield_11420\":\"Yes\"}}"
        response.close();
    }
}

