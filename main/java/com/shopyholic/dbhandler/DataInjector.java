package com.shopyholic.dbhandler;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class DataInjector {

	public static String addCustomer(String name,String email,String password,String gender,String address) {
		String driver="com.mysql.cj.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/E_COMMERCE_WEBSITE";
		String user="root";
		String pass="root";
		String  query="INSERT INTO customer values(?,?,?,?,?)";
		String regStatus="";
		
		try {
			Class.forName(driver);
			
			Connection con=DriverManager.getConnection(url,user,pass);
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,name);
			ps.setString(2, email);
			ps.setString(3, password);
			ps.setString(4,gender);
			ps.setString(5, address);
			
			ps.executeUpdate();
			System.out.println("Boy You Champp... inserted successfully");
			regStatus="Success..";
 			
		} catch (Exception e) {
			System.out.println("Some Problem in customer adding");
			e.printStackTrace();
		}finally {
			return regStatus;
		}
		
	}
	
	public static boolean addProduct(int pid,String pname,String pdesc,int pprice,String pimg) {
		String driver="com.mysql.cj.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/E_COMMERCE_WEBSITE";
		String user="root";
		String pass="root";
		String  query="INSERT INTO products values(?,?,?,?,?)";
		
		
		try {
			Class.forName(driver);
			Connection con=DriverManager.getConnection(url,user,pass);
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, pid);
			ps.setString(2, pname);
			ps.setString(3, pdesc);
			ps.setInt(4, pprice);
			ps.setString(5, pimg);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Problem in  "
					+ ""
					+ "adding Product");
			e.printStackTrace();
			return false;
		}
		
		return true;
		
	}
}
