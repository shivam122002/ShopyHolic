package com.shopyholic.dbhandler;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.shopyholic.product.Product;

public class DataFetcher {
   public static String fetchPassword(String user_name) {
	    String driver="com.mysql.cj.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/E_COMMERCE_WEBSITE";
		String user="root";
		String pass="root";
		String  query="SELECT PASSWORD FROM customer WHERE UNAME=?";
		String dbPass="";
		
		try {
			// driver loading 
			Class.forName(driver);
	      
			// getting conncection to the database 
			Connection con=DriverManager.getConnection(url,user,pass);
			
			// Preparing a statment to send our query to the database
			PreparedStatement ps=con.prepareStatement(query);
			// it will send our name in the place of " ? " in our query 
			ps.setString(1,user_name);
			
			ResultSet rs=ps.executeQuery();
			rs.next();
			dbPass=rs.getString(1);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Login Issue");
			e.printStackTrace();
		}
		return dbPass;
	   
   }
   
   public static List fetchUsersInfo() {
	    String driver="com.mysql.cj.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/E_COMMERCE_WEBSITE";
		String user="root";
		String pass="root";
		String  query="SELECT UNAME,EMAIL,GENDER,ADDRESS FROM customer";
		List uList=new ArrayList();
		
		try {
			// driver loading 
			Class.forName(driver);
			// getting conncection to the database 
			Connection con=DriverManager.getConnection(url,user,pass);
			// Crating  a statment to send our query to the database
			Statement s=con.createStatement();
			ResultSet rs=s.executeQuery(query);
			while(rs.next()) {
				String temp=rs.getString(1)+":"+rs.getString(2)+":"+rs.getString(3)+":"+rs.getString(4);
				uList.add(temp);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Fetching Issue");
			e.printStackTrace();
		}
		return uList;
   }
   
   public static List fetchUsersInfoForHomePage(String name) {
	    String driver="com.mysql.cj.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/E_COMMERCE_WEBSITE";
		String user="root";
		String pass="root";
		String  query="SELECT UNAME,EMAIL,PASSWORD,GENDER,ADDRESS FROM customer where UNAME=?";
		List uList=new ArrayList();
		
		try {
			// driver loading 
			Class.forName(driver);
			// getting conncection to the database 
			Connection con=DriverManager.getConnection(url,user,pass);
			// Crating  a statment to send our query to the database
			Statement s=con.createStatement();
			ResultSet rs=s.executeQuery(query);
			while(rs.next()) {
				String temp=rs.getString(1)+":"+rs.getString(2)+":"+rs.getString(3)+":"+rs.getString(4);
				uList.add(temp);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Fetching Issue");
			e.printStackTrace();
		}
		return uList;
  }
   
   public static List fetchProductInfo() {
	    String driver="com.mysql.cj.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/E_COMMERCE_WEBSITE";
		String user="root";
		String pass="root";
		String  query="SELECT PID,PNAME,PDESC,PPRICE,PIMG FROM products";
		List pList=new ArrayList();
		
		
		try {
			
			// driver loading 
			
			Class.forName(driver);
			
			// getting conncection to the database 
			
			Connection con=DriverManager.getConnection(url,user,pass);
			
			// Crating  a statment to send our query to the database
			
			Statement s=con.createStatement();
			ResultSet rs=s.executeQuery(query);
			while(rs.next()) {
				String temp=""+rs.getString(1)+":"+rs.getString(2)+":"+rs.getString(3)+":"+rs.getString(4)+":"+rs.getString(5);
				pList.add(temp);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("..............Fetching Issue..............");
			e.printStackTrace();
		}
		return pList;
   }
   public static Product getProductById(int pid) {
	    String driver="com.mysql.cj.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/E_COMMERCE_WEBSITE";
		String user="root";
		String pass="root";
		String  query="SELECT PNAME,PPRICE FROM products where pid=?";
		Product p=null;
try {
			
			// driver loading 
			
			Class.forName(driver);
			
			// getting conncection to the database 
			
			Connection con=DriverManager.getConnection(url,user,pass);
			
			// Preparing a statment to send our query to the database
			PreparedStatement ps=con.prepareStatement(query);
			// it will send our name in the place of " ? " in our query 
			ps.setInt(1,pid);
			
			// Crating  a statment to send our query to the database
			ResultSet rs=ps.executeQuery(query);
			rs.next();
			String pName=rs.getString(1);
			int pPrice=rs.getInt(2);
			p=new Product(pid,pName,pPrice);
				
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("..............Fetching Issue..............");
			e.printStackTrace();
		} finally {
			return p;
		}
   }
}
