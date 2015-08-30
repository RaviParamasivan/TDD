package com.hackathon.jira;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;

import com.atlassian.jira.rest.client.api.JiraRestClient;
import com.atlassian.jira.rest.client.api.JiraRestClientFactory;
import com.atlassian.jira.rest.client.api.domain.BasicProject;
import com.atlassian.jira.rest.client.internal.async.AsynchronousJiraRestClientFactory;

public class ReferenceClass {
    static ArrayList<String> names;
    public static ReferenceClass JInstance= null;
    public static ReferenceClass getInstance(){
        if (JInstance == null) {
            JInstance = new ReferenceClass();
        }
        return JInstance;


    }
    public String ListOfProjects() throws URISyntaxException, IOException {
        String username = "senhan84@gmail.com";
        String password = "bluemount";
        ArrayList<String> list = null ;
         URI jiraserverURI = new URI("https://jigarthandaone.atlassian.net/rest/api/2/search?jql");
         JiraRestClientFactory restClientfactory = new AsynchronousJiraRestClientFactory();
         JiraRestClient Client = restClientfactory.createWithBasicHttpAuthentication(jiraserverURI, username,
                password);

        try {
            Iterable<BasicProject> allproject = Client.getProjectClient().getAllProjects().claim();
            list = new ArrayList<String>();
            for (BasicProject project : allproject) {
                list.add(project.getName());
            }

            System.out.println( "--------" + list);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "test";

    }
}
