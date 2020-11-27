<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>Employee Session</title>
	<link rel="stylesheet" href="admin_operations.css">
	</head>

	<body>
		
		<table style="margin-left:400px;">
		<tr>
			<td width=800px>
				<h2>Please, select Operation that you want to perform!</h2>		
			</td>
			<td style="padding-left:400px;">
				<h4>Welcome Employee : ${empid}</h4>
				<h4>Branch ID : ${bid}</h4>	
				<form action="logout_servlet" method="get">
				<input type="submit" value="Logout">
				</form>
			</td>	
		</tr>
		</table>
		<br>
		<div class="sidenav">
		  <table>
		<tr>
		<td>
		<img alt="Logo is absent" src="logo.jpg" width=100px height=100px style="margin-left:30px;">
		</td>
		</tr>
		</table>
		  <br>
		  <br>
		  	<h3 style="margin-left:30px;">Select operation that you want to perform : </h3>
		  <br>
		  <a href="emp_place_order.jsp">Place Customer's Order</a>
		  <br>
		  <a href="send_stock_refill_notifications.jsp">Send Stock Refill Notifications to Admin</a>
		</div>
		
		<div class="main">
		  Enjoy Your Day !
		</div>	
				   
	</body>
</html>