<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Admin Operations</title>
	<link rel="stylesheet" href="admin_operations.css">
	</head>

	<body>
		
	
		<h4 style="margin-left:1300px">Welcome Admin : ${admin_name}</h4>
		
		<form style="margin-left:1400px;" action="logout_servlet" method="get">
			<input type="submit" value="Logout">
		</form>
		
		<br>
		<h1 class="center" style="margin-left:450px;">Please, Select the operation you want to perform :	</h1>
		<br>
		<br>	
	
		<div class="sidenav">
		<table>
		<tr>
		<td>
		<img alt="Logo is absent" src="logo.jpg" width=100px height=100px style="margin-left:150px;">
		</td>
		</tr>
		</table>
		  <h3 style="margin-left:30px;">Select the operation you want to perform : </h3>
		  <br>
		  <a href="add_new_medicine.jsp">Add Medicine Stock</a>
		  <br>
		  <a href="delete_medicine.jsp">Remove Medicine Stock</a>
		  <br>
		  <a href="add_remove_branch.jsp">Add/Remove New Branch</a>
		  <br>
		  <a href="sales_history.jsp">View Sales History</a>
		  <br>
		  <a href="view_stock_refill_notifications.jsp">View Stock Refill Notifications</a>
		  <br>
		  <a href="emp_registration.jsp">Register New Employee</a>
		  <br>
		  <a href="remove_emp.jsp">Remove Employee</a>
		  <br>
		  <a href="apply_remove_offers.jsp">Add or Remove Offers</a>
		</div>
		
				   
	</body>
</html>