package com.shopyholic.customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.validation.Validator;

import com.shopyholic.dbhandler.DataFetcher;

@WebServlet("/login")   //Mapped  with the login.jsp page
public class loginServlet extends HttpServlet {
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
	  response.setContentType("text/html");  // its showing our content type will be text/html
	  PrintWriter out=response.getWriter();  // Used to print something on web
	  
	  //getting information from login page
	  
	  String user_name=request.getParameter("user_name");  
	  String user_pass=request.getParameter("user_password");
	  
	  // for the validation ,here simply we will create a boolean type variable to check given credintial are true for this user or not 
	  
	  boolean check=Validation.isValid(user_name,user_pass);
	  
	  //its check for admin user 
	  
	  if(check==true && user_name.equalsIgnoreCase("admin")) {
		  response.sendRedirect("admin.jsp");
	  }
	  // a simple user who want to do  shopping 
	  else if(check==true) {
		  response.sendRedirect("loginHome.jsp");
		  
	  }
	  // if data wrong
	  else {
		  out.println("<h1>Wrong Credential, Do check once..</h1>");
		  
		  response.sendRedirect("login.jsp");
	  }
  }
}