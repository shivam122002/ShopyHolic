package com.shopyholic.admin;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopyholic.dbhandler.DataInjector;

@WebServlet("/addPrdct")
public class ProductServlet extends HttpServlet {
    public void doPost(HttpServletRequest request,HttpServletResponse response) {
    	int pID=Integer.parseInt(request.getParameter("product-id"));
    	String pName=request.getParameter("product-name");
    	String pDesc=request.getParameter("product-description");
    	int pPrice=Integer.parseInt(request.getParameter("product-price"));
    	String pImg=request.getParameter("product-image");
    	
    	DataInjector.addProduct(pID,pName,pDesc,pPrice,pImg);
    	
    }
}
