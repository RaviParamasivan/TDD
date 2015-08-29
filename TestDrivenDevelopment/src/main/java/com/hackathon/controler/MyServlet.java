package com.hackathon.controler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.hackathon.dataobject.UserComments;
import com.hackathon.util.DataSource;
import com.hackathon.util.Healper;

public class MyServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse responce) throws IOException {
		PrintWriter pw = responce.getWriter();
		responce.setContentType("text/html");
		System.out.println("userComments          "+request);
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			if (request.getParameter("jsonStr") != null) {
				String type=request.getParameter("type");
				System.out.println("type   "+type);
				if(type!= null && type.equals("module")){
					System.out.println("Test ");
					DataSource ds= new DataSource();
					String options=ds.getModuleName();
					System.out.println("options      "+options);
					pw.print(options);
				}else if(type!= null && type.equals("dashboard")){
					
				}else{
					String userComments= request.getParameter("jsonStr");
					System.out.println("userComments          "+userComments);
					UserComments comments= objectMapper.readValue(userComments, UserComments.class);
					
					Healper helper = new Healper();
					if (helper.updateUserComments(comments)) {
						pw.print("User comments update successfull");
					} else {
						pw.print("Update comments faild, Please submit again later");
					}					
				}

			}
		} catch (Exception e) {
			pw.print("There is an Exception :" + e);
			System.out.println("Exception in controler " + e);
		}
	}
}
