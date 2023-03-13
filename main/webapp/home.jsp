<%@page import="com.shopyholic.dbhandler.DataFetcher" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <title>My Store</title>
  <link rel="stylesheet" type="text/css" href="./css/HomeStyle.css">
</head>
<body>
 <%
   List prodList=DataFetcher.fetchProductInfo();
  %>
  <section class="hero">
    <div class="hero-content">
      <h1>Welcome to ShopyHolic</h1>
      <p>Register youself for better Experience</p>
     <a href="register.jsp"><button name="button">Register Here!</button></a>
    </div>
  </section>
 
  <main>
     <%
       String [] prodArr2=null;
        for(int i=0;i<prodList.size();i++){
        	String prodArr[]=((String)prodList.get(i)).split(":");
        	prodArr2=prodArr;
     %>

  
    <div class="card">
      <img src="img/<%=prodArr[4] %>" alt="Product Image">
      <h3>Product Name:<%=prodArr[1] %></h3>
      <p><%=prodArr[2]%></p>
      <h4>Price:</h4>
      <span><%=prodArr[3]%></span>
      <form>
         <input type="hidden" name="productId" value="<%=
             Integer.parseInt(prodArr[0])
         %>">
         
      </form>
      <button class="productButton">BUY NOW</button>
      
      
    </div>

    <%
        }    
    %>
    
     <div class="payment">
            <h1 class="payTitle">Personal Information</h1>
            <label>Name and Surname</label>
            <input type="text" placeholder="John Doe" class="payInput">
            <label>Phone Number</label>
            <input type="text" placeholder="+1 234 5678" class="payInput">
            <label>Address</label>
            <input type="text" placeholder="Elton St 21 22-145" class="payInput">
            <h1 class="payTitle">Card Information</h1>
            <div class="cardIcons">
                <img src="./img/visa.png" width="40" alt="" class="cardIcon">
                <img src="./img/master.png" alt="" width="40" class="cardIcon">
            </div>
            <input type="password" class="payInput" placeholder="Card Number">
            <div class="cardInfo">
                <input type="text" placeholder="mm" class="payInput sm">
                <input type="text" placeholder="yyyy" class="payInput sm">
                <input type="text" placeholder="cvv" class="payInput sm">
            </div>
            <button class="checkoutbtn">Checkout!</button>
            <span class="close">X</span>
        </div>
 </main>
    <script type="text/javascript">
  const productButton = document.querySelector(".productButton");
  const payment = document.querySelector(".payment");
  const close = document.querySelector(".close");

  productButton.addEventListener("click", () => {
    payment.style.display = "flex";
  });

  close.addEventListener("click", () => {
    payment.style.display = "none";
  });
  </script>
   
  </body>
</html>