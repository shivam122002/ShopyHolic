<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>login form</title>

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/LR.css">

</head>
<body>
   
<div class="form-container">

   <form action="login" method="post"> <!-- After submiting this form command will go on loginServlet , which mapped with "login" link -->
      <h3>login now</h3>
      
      <!-- in case i want to  add name instead of email in login page then i can use  -->

      <input type="text" name="user_name" required placeholder="Enter your UserName">
      <input type="password" name="user_password" required placeholder="Enter your password">
      <input type="submit" name="submit" value="login now" class="form-btn">
      <p>don't have an account? <a href="register.jsp">register now</a></p>
   </form>

</div>

</body>
</html>