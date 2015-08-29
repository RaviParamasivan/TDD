package com.hackathon.jira;
import static org.junit.Assert.assertNotNull;

import java.io.IOException;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import org.junit.Test;

import com.hackathon.dataobject.UserComments;


public class JiraTest {
	
	public UserComments getObj() throws JsonParseException, JsonMappingException, IOException{
		ObjectMapper om=new ObjectMapper();
		String inputObj="{\"categaroy\":\"2\",\"moduleName\":\"3\",\"comments\":\"1\"}";
		return om.readValue(inputObj, UserComments.class);
	}
	
	@Test
	public void updateJira_test() throws JsonParseException, JsonMappingException, IOException {
		
		UserComments input= getObj();
		Jira jira= new Jira();
		boolean isUpdates= jira.updateJira("11");
		assertNotNull(isUpdates);
		
	}

}
