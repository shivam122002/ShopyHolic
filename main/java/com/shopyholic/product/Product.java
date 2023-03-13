package com.shopyholic.product;

public class Product {
       int pid;
       String pName;
       int pPrice;
       public Product(int pid,String pName,int pPrice) {
    	   super();
    	   this.pid=pid;
    	   this.pName=pName;
    	   this.pPrice=pPrice;
       }
       public int getPID() {
    	   return pid;
       }
       public void setPID(int pid) {
    	   this.pid=pid;
       }
       public String getPname() {
    	   return pName;
       }
       public void setPname(String pName) {
    	   this.pName=pName;
       }
       public int getPprice() {
    	   return pPrice;
       }
       public void setPprice(int pPrice) {
    	   this.pPrice=pPrice;
       }
}
