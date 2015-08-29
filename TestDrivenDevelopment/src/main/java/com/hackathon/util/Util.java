package com.hackathon.util;

public  class Util {
	public static  boolean isNull(String value) {
		if (value != null && !value.trim().equals("")) {
			return false;
		} else {
			return true;			
		}
	}
}
