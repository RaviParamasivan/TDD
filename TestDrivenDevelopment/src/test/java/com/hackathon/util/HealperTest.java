package com.hackathon.util;

import static org.junit.Assert.assertNotNull;

import java.io.IOException;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.junit.Test;

import com.hackathon.dataobject.UserComments;

public class HealperTest {
	
	public UserComments getObj() throws JsonParseException, JsonMappingException, IOException{
		ObjectMapper om=new ObjectMapper();
		String inputObj="{\"categaroy\":\"2\",\"moduleName\":\"3\",\"comments\":\"1\"}";
		return om.readValue(inputObj, UserComments.class);
	}
	
	@Test
	public void isValid_Test() throws JsonParseException, JsonMappingException, IOException {
		UserComments feedback= getObj();
		assertNotNull(feedback);
	}
	
}
