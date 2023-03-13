package com.shopyholic.customer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopyholic.dbhandler.DataInjector;

@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String name=request.getParameter("user_name");
		String email=request.getParameter("user_email");
		String password=request.getParameter("user_password");
		String gender=request.getParameter("user_gender");
		String address=request.getParameter("user_address");
		
		String status=DataInjector.addCustomer(name,email,password,gender,address);
		 
		response.sendRedirect("login.jsp");
	}

}
