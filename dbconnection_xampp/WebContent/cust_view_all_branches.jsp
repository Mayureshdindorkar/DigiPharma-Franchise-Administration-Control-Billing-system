<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.HashMap,java.util.Iterator,java.util.Map,java.util.Set" %>         
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>View All Branches</title>
	<link rel="stylesheet" href="admin_operations.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/additional-methods.js"></script>
		<script src="login_validate.js"></script>
	</head>

	<body>
		
		<table style="margin-left:400px;">
		<tr>
			<td style="padding-left:1400px;">
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
		  <a href="cust_search_medicine.jsp">Search for medicine (in all branches)</a>
		  <br>
		  <a href="cust_view_offers.jsp">View offers</a>
		  <br>
		  <a href="view_previous_purchases.jsp">View your previous purchases</a>
		  <br>
		  
		</div>
		<br>
		<div class="main">
		  
		  		<form method="post" action="http://localhost:8080/dbconnection_xampp/cust_view_all_branches.jsp ">
					<input type="submit" name="action" value="View all Branches" style="margin-left:450px;width:350px;"/>
				</form>
				<br>
				
				<%
				String url="jdbc:mysql://localhost:3306/final_dbmsmini";
				String userName="root";
				String password="";
				
				try
				{
				Class.forName("com.mysql.jdbc.Driver");
				java.sql.Connection conn=DriverManager.getConnection(url,userName,password);
				java.sql.Statement stmt=conn.createStatement();
				
					String act = request.getParameter("action");
					System.out.println("action :"+act);
					
					if(act.equals("View all Branches"))
					{
						
							System.out.println("in select");
							 
							
							ResultSet rs=stmt.executeQuery("select * from branchinfo");
							
							System.out.println("fetched query");
						    
						    out.println("<table border='1'cellpadding='10' style='border-collapse:collapse;margin-left:450px;'>");
							
						    out.println("<tr>");
						    
							out.println("<th>");
							out.println("Bid");
				            out.println("</th>");
				            out.println("<th>");
				            out.println("Bname");
				            out.println("</th>");
				            
							
							while (rs.next())
							{
								String bid = rs.getString("bid");
					            String bname1 = rs.getString("bname");
					            
					            out.println("<tr>");
					            
					            out.println("<td>");
					            out.println( bid + "<br>");
					            out.println("</td>");
					            out.println("<td>");
					            out.println( bname1 + "<br>");
					            out.println("</td>");
					      		out.println("</tr>");
							}
						    out.println("</tr>");
						    out.println("</table>");
						  
					}
				}
				catch(Exception e)
				{
					System.out.println(e);
				}
				
				%>
				
			
 		</div>	
				   
	</body>
</html>