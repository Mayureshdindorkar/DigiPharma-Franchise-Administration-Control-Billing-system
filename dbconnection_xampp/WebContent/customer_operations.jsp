<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>Customer Session</title>
	<link rel="stylesheet" href="admin_operations.css">
	</head>

	<body>
		
		<table style="margin-left:400px;">
		<tr>
			<td width=600px>
				<h2>Select the operation you want to perform :</h2>		
			</td>
			<td style="padding-left:600px;">
				<h4>Welcome Customer : ${cust_name}</h4>	
				<form action="logout_servlet" method="get">
				<input type="submit" value="Logout">
				</form>
			</td>	
		</tr>
		</table>
		
		<div class="sidenav">
		  <table>
		<tr>
		<td>
		<img alt="Logo is absent" src="logo.jpg" width=100px height=100px style="margin-left:150px;">
		</td>
		</tr>
		</table>
		  <br>
		  <br>
		  	<h2>Select the operation you want to perform : </h2>
		  <br>
		  <a href="cust_view_all_branches.jsp">View all Branches</a>
		  <br>
		  <a href="cust_search_medicine.jsp">Search for medicine (in all branches)</a>
		  <br>
		  <a href="cust_view_offers.jsp">View offers</a>
		  <br>
		  <a href="view_previous_purchases.jsp">View your previous purchases</a>
		  <br>
		  
		</div>
		
		<div class="main">
		  Enjoy Your Day, Customer!
		</div>	
				   
	</body>
</html>