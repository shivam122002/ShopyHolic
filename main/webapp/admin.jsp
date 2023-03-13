<%@page import="com.shopyholic.dbhandler.DataFetcher"%>
<%@page import ="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Admin Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        /* CSS styles for the buttons */
       body {
			font-family: Arial, sans-serif;
			background-color: #f2f2f2;
			margin: 0;
			padding: 0;
		}
		
		.container {
			max-width: 800px;
			margin: 0 auto;
			padding: 20px;
			background-color: #fff;
			box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
			border-radius: 41px;
		}
		
		.button {
			display: inline-block;
			padding: 10px 79px;
			background-color: #4CAF50;
			color: #fff;
			font-size: 16px;
			border: none;
			border-radius: 58px;
			cursor: pointer;
			transition: background-color 0.3s ease;
		}
		
		.button:hover {
			background-color: #3e8e41;
		}

        /* CSS styles for the info containers */
        .info-container {
            display: none;
        }

        .info-container.show {
            display: block;
        }
        /*css for add product form*/
        .form-group {
			margin-bottom: 10px;
		}
		
		label {
			display: block;
			font-weight: bold;
			margin-bottom: 5px;
		}
		
		input[type="text"], input[type="number"], input[type="file"] {
			padding: 10px;
			border-radius: 5px;
			border: 1px solid #ccc;
			width: 100%;
			box-sizing: border-box;
			font-size: 16px;
		}
		
		input[type="submit"] {
			display: block;
			padding: 10px 20px;
			background-color: #4CAF50;
			color: #fff;
			font-size: 16px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
			transition: background-color 0.3s ease;
		}
		
		input[type="submit"]:hover {
			background-color: #3e8e41;
		}

        /* CSS styles for responsive design */
        @media screen and (max-width: 600px) {
            .button {
                padding: 10px;
                font-size: 12px;
            }

            .info-container {
                padding: 5px;
            }
        }
    </style>
</head>

<body>

<% 
      // calling a method fetchUserInfo from Datafetcher class
      List userList=DataFetcher.fetchUsersInfo();

      List productList=DataFetcher.fetchProductInfo();
%>
  <div class="panel">
     <div class="container">
		 <h1 style="text-align:center">Admin Block</h1>
    <button class="button" onclick="toggleInfo('user-info')">View User Info</button>
    <button class="button" onclick="toggleInfo('product-info')">View Product Info</button>
    <button class="button" onclick="toggleInfo('add-product-form')">Add Product</button>
	</div> <br><br><br>
 </div> 
 
 <div class="info-container" id="user-info">
 
        <!-- User info goes here -->
        <h3 style="text-align:center">Registered Users</h3>
         <table border align="center">
                  <thead>
                  <tr>
                     <th>User_Name</th>
                     <th>Email</th>
                     <th>Gender</th>
                     <th>Address</th>
                     
                  </tr>
                  </thead>
                  <tbody>
                  <%
                     for(int i=0;i<userList.size();i++){
                       String [] custArr=((String)userList.get(i)).split(":");
                   %>
                   <tr>
                     <td><%=custArr[0]%></td>
                     <td><%=custArr[1]%></td>
                     <td><%=custArr[2]%></td>
                     <td><%=custArr[3]%></td>
                   </tr>
                   <%
                     }
                   %>
                  </tbody>
             </table>
    </div>	
     
     <div class="info-container" id="product-info">
        <!-- Product info goes here -->
        <h3 style="text-align:center">Products Information</h3>
        <table border align="center">
                  <thead>
                  <tr>
                     <th>ID</th>
                     <th>Name</th>
                     <th>Price</th>
                     <th>Description</th>
                     <th>Image</th>
                     
                  </tr>
                  </thead>
                  <tbody>
                  <%
                     for(int i=0;i<productList.size();i++){
                       String [] productArr=((String)productList.get(i)).split(":");
                   %>
                   <tr>
                     <td><%=productArr[0]%></td>
                     <td><%=productArr[1]%></td>
                     <td><%=productArr[2]%></td>
                     <td><%=productArr[3]%></td>
                    
                   </tr>
                   <%
                     }
                   %>
                   <tr>
                   
                   </tr>
                  </tbody>
             </table>
    </div>
    
     <div class="info-container" id="add-product-form">
        <!-- Add product form goes here --> 
                <h3 style="text-align:center">Add Product</h3>
        <form action="addPrdct" method="post">
			<div class="form-group">
				<label for="product_id">Product ID:</label>
				<input type="text" id="product_id" name="product-id" required>
			</div>
			<div class="form-group">
				<label for="product_name">Product Name:</label>
				<input type="text" id="product_name" name="product-name" required>
			</div>
			<div class="form-group">
				<label for="product_description">Product Description:</label>
				<input type="text" id="product_description" name="product-description" required>
			</div>
			<div class="form-group">
				<label for="product_price">Product Price:</label>
				<input type="text" id="product_price" name="product-price" required>
			</div>
			<div class="form-group">
				<label for="product_image">Product Image:</label>
				<input type="text" id="product_image" name="product-image"  required>
			</div>
			<input type="submit" value="Add Product">
		</form>
    </div>
 
<script>
        function toggleInfo(containerId) {
            var container = document.getElementById(containerId);
            var containers = document.getElementsByClassName("info-container");
            for (var i = 0; i < containers.length; i++) {
                if (containers[i].id === containerId) {
                    container.classList.toggle("show");
                } else {
                    containers[i].classList.remove("show");
                }
            }
        }
    </script>
</body>
</html>