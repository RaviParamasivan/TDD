package com.hackathon.jira;
import static org.junit.Assert.assertNotNull;

import org.json.JSONObject;
import org.junit.Test;


public class JiraTest {
	
	public JSONObject getObj(){
		String inputObj="{\"feedBackDesc\":\"2\",\"feedBackGroup\":\"3\",\"feedBackTitle\":\"1\"}";
		return new JSONObject(inputObj);
		
	}
	
	@Test
	public void updateJira_test() {
		
		JSONObject input= getObj();
		Jira jira= new Jira();
		boolean isUpdates= jira.updateJira(input);
		assertNotNull(isUpdates);
		
	}

}
