<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="customer_register.css">
		<title>Login JSP Page</title>
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/additional-methods.js"></script>
		<script src="login_validate.js"></script>
		
	</head>

	<body bgcolor="skyblue">
		<table>
		<tr>
		<td>
		<img alt="Logo is absent" src="logo.jpg" width=100px height=100px style="margin-left:30px;">
		</td>
		</tr>
		</table>
		
		<h1 class="center">Customer Registration</h1>
		<br>
		<br>
		
		<!-- action == name of servlet java class ie., onclick run this java class/servlet & by default method==get-->
					
		<form name="customer_register_form" action="http://localhost:8080/dbconnection_xampp/customer_register_servlet" method="post" style="margin-left:300px;margin-right:300px;">
			<fieldset>
    		  <legend> CUSTOMER REGISTER </legend>
    		  <br>
			  <br>
			  <div>
			  <label>Name				:</label> <input type="text" placeholder="Enter your name " name="name"><br>
			  </div>
			  <br>
			  <br>
			  <div>
			  <label>Email				:</label> <input type="email" placeholder="Enter email" name="email"><br>
			  </div>
			  <br>
			  <br>
			  <div>
			  <label>Mobile No.	        :</label><input type="text" placeholder="Enter mobile number" name="mobile"><br>
			  </div>
			  <br>
			  <br>
			  <div>
			  <label>UserName	        :</label> <input type="text" placeholder="Set your name" name="username"><br>
			  </div>
			  <br>
			  <br>
			  <div>
			  <label>Password	        :</label> <input type="password" placeholder="Enter password" name="password"><br>
			  </div>
			  <br>
			  <br>
			  <div>
			  <label>Confirm Password	:</label><input type="password" placeholder="Enter password again" name="cpassword"><br>
			  </div>
			  <br>
			  <br>
			  <div>
			  	<input type="submit" name="action" value="REGISTER" style="margin-left:50px;">
			  </div>
			  <br>
			  <br>
			</fieldset>
			
		</form>
	</body>
</html>