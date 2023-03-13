<%@page import="com.shopyholic.dbhandler.DataFetcher" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>My Store</title>
  <link rel="stylesheet" type="text/css" href="./css/HomeStyle.css">
  <style>
       nav {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 20px;
  background-color: #333;
  color: #fff;
  font-size: 18px;
}

.logo img {
  height: 40px;
}

.right-side {
  display: flex;
  align-items: center;
}

.cart a {
  display: flex;
  align-items: center;
  text-decoration: none;
  color: #fff;
  margin-right: 20px;
}

.cart img {
  height: 30px;
  margin-right: 10px;
}

.cart span {
  background-color: #fff;
  color: #333;
  border-radius: 50%;
  width: 20px;
  height: 20px;
  display: inline-flex;
  justify-content: center;
  align-items: center;
  margin-left: 5px;
}

.user-info {
  position: relative;
  display: flex;
  align-items: center;
}

.user-info img {
  max-width: 50px;
  border-radius: 50%;
  margin-right: 10px;
 max-height: 30px;
}

.dropbtn {
  background-color: transparent;
  color: #fff;
  font-size: 18px;
  border: none;
  cursor: pointer;
}

.dropdown-content {
  display: none;
  position: absolute;
  z-index: 1;
  right: 0;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  /* adjust the position of the dropdown menu */
  transform: translateY(calc(100% - 38px));
  padding: 10px 0;
}

.dropdown-content a {
  color: #333;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {
  background-color: #f1f1f1;
}

.user-info:hover .dropdown-content {
  display: block;
}
      
  </style>
</head>
<body>
 <%
   List prodList=DataFetcher.fetchProductInfo();
   
  
  %>
 <nav>
  <div class="logo">
    <h5 style="font-family: sans-serif;">ShopyHolic</h5>
  </div>
  <div class="right-side">
    <div class="cart">
      <a href="cart.jsp">
        <img src="https://cdn.iconscout.com/icon/premium/png-128-thumb/cart-1956912-1650878.png" alt="Cart">
       
      </a>
    </div>
     
   <div>
   </div>
    <div class="user-info">
      <button class="dropbtn"><img src="https://cdn.iconscout.com/icon/premium/png-256-thumb/user-452-117441.png?f=avif&w=128"></button>
      <div class="dropdown-content">
        <a>Name:</a>
        <a>Email:</a>
        <a>Password:</a>
        <a>Gender:</a>
      </div>
    </div>
  </div>
</nav>
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
      <form action="add-to-cart" method="post">
         <input type="hidden" name="productId" value="<%=
             Integer.parseInt(prodArr[0])
         %>">
         
        <button>ADD TO CART</button>
      </form>
       
       
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