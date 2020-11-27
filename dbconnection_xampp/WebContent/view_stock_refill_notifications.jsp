<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>View stock Refill Notifications</title>
	<link rel="stylesheet" href="admin_operations.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/additional-methods.js"></script>
		<script src="login_validate.js"></script>
	
	</head>

	<body>
		<table style="margin-left:400px;">
		<tr>
			<td width=600px>
				<h2>View stock Refill Notifications</h2>		
			</td>
			<td style="padding-left:600px;">
				<h4>Welcome Admin : ${admin_name}</h4>	
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
		  <h3 style="margin-left:30px;">Select operation that you want to perform : </h3>
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
		
		<div class="main" >
		  
		  		
		  		<br>
				<form style="width:350px;margin-left:400px;" action="http://localhost:8080/dbconnection_xampp/view_stock_refill_notifications.jsp" method="post">
		  				<input style="width:350px;" type="submit" value="VIEW ALL NOTIFICATIONS" name="action">	
		  		</form>
				<br>
				<br>	
		  		<br>
		  		<form  name="view_stock_refill_notifications_form" method="post" action="http://localhost:8080/dbconnection_xampp/view_stock_refill_notifications.jsp">
					
					<label style="width:350px;margin-left:300px;">Enter notification no. that you want to delete :</label><input type="text" name="nsr" style="width:350px;" placeholder="Notification Number"/>
					<br>
					<br>
					<br>
					<input type="submit" name="action" value="DELETE THIS NOTIFICATION" style="margin-left:380px;width:400px;"/>
					<br>
					<br>
					<br>
				</form>
				<% 
				 String url="jdbc:mysql://localhost:3306/final_dbmsmini";
				 String userName="root";
				 String password="";
				
				 try{
						Class.forName("com.mysql.jdbc.Driver");
						java.sql.Connection conn=DriverManager.getConnection(url,userName,password);
						//out.println("<h1>Connection Success!</h1>");
						System.out.println("Connection Successfull");
						
						java.sql.Statement stmt=conn.createStatement();
						
						String act = request.getParameter("action");
						System.out.println("action :"+act);
						 
						 if (act.equals("DELETE THIS NOTIFICATION")) 
						 {
							
							
                             //deleting entry of branch from branchinfo table
                             System.out.println("inside Delete notofication");
                             int i1=stmt.executeUpdate("DELETE FROM notifications WHERE nsr="+request.getParameter("nsr"));

                       
                             if (i1<0)
 								out.println("Table empty");
 							else
 							{
 								act="VIEW ALL NOTIFICATIONS";
 							}
                             
						  }
						 
						 if (act.equals("VIEW ALL NOTIFICATIONS")) 
						 {
							System.out.println("in select");
							 
							
							ResultSet rs=stmt.executeQuery("select * from notifications");
							
							System.out.println("fetched query");
						    
							if(rs.next()==false)
							 {
								 out.println("offers table empty");
							 }	 
							 else
							 {
								rs.beforeFirst();
						    	out.println("<table border='1'cellpadding='10' style='border-collapse:collapse;margin-left:350px;'>");
							
						    	out.println("<tr>");
						    
								out.println("<th>");
					            out.println("NSr.");
					            out.println("</th>");
					            out.println("<th>");
					            out.println("BranchId");
					            out.println("</th>");
					            out.println("<th>");
					            out.println("Medicine Name");
					            out.println("</th>");
					            out.println("<th>");
					            out.println("Qty");
					            out.println("</th>");
					            out.println("<th>");
					            out.println("Type");
					            out.println("</th>");
					            out.println("</tr>");
					            
								
								while (rs.next())
								{
									
									String nsr = rs.getString("nsr");
									String bid = rs.getString("bid");
							     	String mname = rs.getString("mname");
							     	String qty = rs.getString("qty");
							     	String type = rs.getString("type");
						            
						            out.println("<tr>");
						            
						            out.println("<td>");
						            out.println( nsr + "<br>");
						            out.println("</td>");
						            out.println("<td>");
						            out.println( bid + "<br>");
						            out.println("</td>");
						            out.println("<td>");
						            out.println( mname + "<br>");
						            out.println("</td>");
						            out.println("<td>");
						            out.println( qty + "<br>");
						            out.println("</td>");
						            out.println("<td>");
						            out.println( type + "<br>");
						            out.println("</td>");
						             
						            out.println("</tr>");
								}
							    
							    out.println("</table>");
								
							  } 
						 }
						
						 
					}
					catch (Exception e) 
				    {
						// TODO: handle exception
						//out.println(e);
						System.out.println(e);
					}
				%>
			
 		</div>		   
	</body>
</html>