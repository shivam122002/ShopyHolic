<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>register form</title>

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/LR.css">

</head>
<body>
   
<div class="form-container">

   <form action="Register" method="post">
      <h3>Register Here</h3>
     
      <input type="text" name="user_name" required placeholder="Enter your name">
      <input type="email" name="user_email" required placeholder="Enter your email">
      <input type="password" name="user_password" required placeholder="Enter your password">
      <input type="text" name="user_gender" required placeholder="Enter your gender">
      <input type="text" name="user_address" required placeholder="Enter your address">
      <input type="submit" name="submit" value="Register now" class="form-btn">
      <input type="reset" name="reset" value="Reset Details" class="form-btn">
      <p>already have an account? <a href="login.jsp">login now</a></p>
   </form>

</div>

</body>
</html>