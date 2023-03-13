package com.shopyholic.product;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopyholic.dbhandler.DataFetcher;

@WebServlet("/add-to-cart")
public class AddToCartSevlet extends HttpServlet{
   public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException {
	   int productID=Integer.parseInt(request.getParameter("productId"));
	   Product product=DataFetcher.getProductById(productID);
	   HttpSession session=request.getSession();
	   Cart cart=(Cart) session.getAttribute("cart");
	   if(cart==null) {
		   cart=new Cart();
		   session.setAttribute("cart", cart);
	   }
	   cart.addItems(product);
	   response.sendRedirect("loginHome.jsp");
   }
}
