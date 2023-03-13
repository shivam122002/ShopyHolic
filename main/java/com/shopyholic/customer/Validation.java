package com.shopyholic.customer;

import com.shopyholic.dbhandler.DataFetcher;

public class Validation {
  public static boolean isValid(String user_name, String user_pass) {
	  // function which fetch the password from the databasae
	  
	  String dbPass=DataFetcher.fetchPassword(user_name); 
	  
	  // will return true if password match with given user name 
	  if(user_pass.equals(dbPass)) {
		  return true;
	  }
	  
	  // return false if password doesn't match 
	  else {
	      return false;
	  }
  }
}
