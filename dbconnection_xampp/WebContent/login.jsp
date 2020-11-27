<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="login.css">
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/additional-methods.js"></script>
		<script src="login_validate.js"></script>
		
		<title>Sangita Medicals Login</title>
	</head>

	<body bgcolor="skyblue">
		<table>
		<tr>
		<td>
		<img alt="Logo is absent" src="logo.jpg" width=150px height=150px>
		</td>
		<td>
		<h1 class="center" style="margin-left:500px;">SANGITA MEDICALS</h1>
		</td>
		</tr>
		</table>
		
		<br>
		<br>
		<br>
		<br>
		<!-- action == name of servlet java class ie., onclick run this java class/servlet & by default method==get-->
			<table>
				<tr>
					<td>
						<form  action="http://localhost:8080/dbconnection_xampp/login_servlet" method="post" name="adminform" id="f1" style="margin-left:220px;">
							<fieldset>
				    		  <legend> Admin Login </legend>
				    		  <br>
							  <div class="imgdiv">
							    <img src="admin.jpeg" alt="admin.jpeg is absent" style="margin-left:140px;">
							  </div>
							  <br>
							  <br>
							  <div>
							  <label>Username	:</label> <input type="text" name="admin_uname" placeholder="Enter username "><br>
							  </div>
							  <br>
							  <br>
							  <div>
							  <label>Password	:</label> <input type="password" name="admin_pass" placeholder="Enter password"><br>
							  </div>
							  <br>
							  <br>
							  <div>
							  	
							  	<input type="hidden" name="formname" value="admin_login"/>
							  	
							  	<input type="submit" value="Login" style="margin-left:160px;">
							  	
							  </div>
							  <br>
							  <br>
							</fieldset>
						</form>
					</td>
					
					
					 <td>
						 <form  name="empform" method="post" id="f2" action="http://localhost:8080/dbconnection_xampp/login_servlet">	
							<fieldset>
				    		  <legend> Employee Login </legend>
				    		  <br>
							  <div class="imgdiv">
							    <img src="employee.png" alt="employee.png is absent"  style="margin-left:140px;">
							  </div>
							  <br>
							  <br>
							  <div>
							  <label>EmpId  :</label> <input type="text" name="empid" placeholder="Enter EmpId   "><br>
							  </div>
							  <br>
							  <br>
							  <div>
							  <label>BranchId :</label> <input type="text" name="branchid" placeholder="Enter BranchId"><br>
							  </div>
							  <br>
							  <br>
							  <div>
							    <input type="hidden" name="formname" value="emp_login"/>
							  	<input type="submit" value="Login" style="margin-left:160px;">
							  </div>
							  <br>
							  <br>
						 	</fieldset>
						 </form>	
	 			    </td>
	 			    
	 			    <td>
						 <form name="custform" method="post" id="f3" action="http://localhost:8080/dbconnection_xampp/login_servlet">	
							<fieldset>
				    		  <legend> Customer Login </legend>
				    		  <br>
							  <div class="imgdiv">
							    <img src="customer.jpeg" alt="customer.jpeg is absent" style="margin-left:140px;">
							  </div>
							  <br>
							  <br>
							  <div>
							  <label>Username :</label> <input type="text" name="cust_uname" placeholder="Enter username   "><br>
							  </div>
							  <br>
							  <br>
							  <div>
							  <label>Password :</label> <input type="password" name="cust_pass" placeholder="Enter password"><br>
							  </div>
							  <br>
							  <br>
							  <div>
							 
							    <input type="hidden" name="formname" value="cust_login"/>
							 
							  	<input type="submit" value="Login" style="margin-left:140px;">
							  	<button><a href="http://localhost:8080/dbconnection_xampp/customer_register.jsp">SignUp</a></button>
							  </div>
							  <br>
							  <br>
						 	</fieldset>
						 </form>	
	 			    </td>
			</tr>		
		</table>	
			
	</body>
</html>