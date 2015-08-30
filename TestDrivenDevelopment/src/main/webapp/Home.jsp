package com.hackathon.util;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


import com.hackathon.dataobject.UserComments; 



public class DataSource {
	Connection connect = null;
	public Connection readDataBase() throws Exception {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connect = DriverManager.getConnection("jdbc:mysql://us-cdbr-iron-east-02.cleardb.net/ad_0235f762bbc6a49?user=b5e54b8d9b8c40&password=b2a198fc");
		} catch (Exception e) {
			throw e;
		}
		return connect;
	}

	public String getModuleName() throws Exception {	
		String options="";
		ResultSet resultSet = null;	
		Statement statement = null;
		try {
			connect=readDataBase();
			System.out.println("connect   "+connect);
			statement = connect.createStatement();
			resultSet = statement.executeQuery("select * FROM jira_module");			
			while (resultSet.next()) {
				options+="<option select='"+resultSet.getString("mail_id")+"' >"+resultSet.getString("module_name")+"</option>";
			}	
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}finally{
			if (resultSet != null) {
				resultSet.close();
			}
			if (statement != null) {
				statement.close();
			}
			if (connect != null) {
				connect.close();
			}
		}
		return options;
	}

	public void updateCustomeComments(UserComments userComments) throws Exception {
		Connection connect = null; 
		PreparedStatement preparedStatement = null; 
		try {
			
			connect=readDataBase();
			System.out.println("connect          >"+connect);
			System.out.println("userComments          >"+userComments);
			preparedStatement = connect.prepareStatement("INSERT INTO customer_commands(title,commands,category,module_name,issensitive,user_mail_id,dev_group_id,created_date) values (?, ?, ?, ?, ? , ?, ?, ?)"); 
			preparedStatement.setString(1, userComments.getTitle()); 
			preparedStatement.setString(2, userComments.getComments()); 
			preparedStatement.setString(3, userComments.getCategaroy()); 
			preparedStatement.setString(4, userComments.getModuleName()); 
			preparedStatement.setString(5, userComments.isSensitive()==true?"Y":"N"); 
			preparedStatement.setString(6, userComments.getUserMailId()); 
			preparedStatement.setString(7, userComments.getDevGroupId()); 
			preparedStatement.setDate(8, new Date(0)); 
			preparedStatement.executeUpdate();			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception while updating the module:  "+e);
		}finally{
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			if (connect != null) {
				connect.close();
			}			
		}
	}
}
