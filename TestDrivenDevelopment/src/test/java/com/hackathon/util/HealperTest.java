package com.hackathon.util;

import static org.junit.Assert.assertNotNull;

import org.json.JSONObject;
import org.junit.Test;

public class HealperTest {
	
	public JSONObject getObj(){
		String inputObj="{\"feedBackDesc\":\"2\",\"feedBackGroup\":\"3\",\"feedBackTitle\":\"1\"}";
		return new JSONObject(inputObj);
	}
	
	@Test
	public void isValid_Test() {
		JSONObject feedback= getObj();
		assertNotNull(feedback);
	}
	
}
