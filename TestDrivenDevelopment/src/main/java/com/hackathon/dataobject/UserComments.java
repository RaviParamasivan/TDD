package com.hackathon.dataobject;

public class UserComments {
	
	
	private String comments = "";
	private String title = "";
	private String categaroy = "";
	private String moduleName = "";
	private boolean isSensitive = false;
	private String userMailId = "";
	private String devGroupId = "";

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCategaroy() {
		return categaroy;
	}

	public void setCategaroy(String categaroy) {
		this.categaroy = categaroy;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public boolean isSensitive() {
		return isSensitive;
	}

	public void setSensitive(boolean isSensitive) {
		this.isSensitive = isSensitive;
	}

	public String getUserMailId() {
		return userMailId;
	}

	public void setUserMailId(String userMailId) {
		this.userMailId = userMailId;
	}

	public String getDevGroupId() {
		return devGroupId;
	}

	public void setDevGroupId(String devGroupId) {
		this.devGroupId = devGroupId;
	}

	@Override
	public String toString() {
		return "UserComments [comments=" + comments + ", title=" + title + ", categaroy=" + categaroy + ", moduleName="
				+ moduleName + ", isSensitive=" + isSensitive + ", userMailId=" + userMailId + ", devGroupId="
				+ devGroupId + "]";
	}

}
