<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>Send Stock Refill Notifications</title>
	<link rel="stylesheet" href="admin_operations.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/additional-methods.js"></script>
		<script src="login_validate.js"></script>
	</head>

	<body>
		
		<table style="margin-left:400px;">
		<tr>
			<td width=800px>
				<h2>Send Stock Refill Notifications to Admin</h2>		
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
		<img alt="Logo is absent" src="logo.jpg" width=100px height=100px style="margin-left:150px;">
		</td>
		</tr>
		</table>
		  <br>
		  <br>
		  	<h3 style="margin-left:30px;">Select operation that you want to perform :</h3>
		  <br>
		  <a href="emp_place_order.jsp">Place Customer's Order</a>
		  <br>
		</div>
		
		<div class="main" style="margin-left:800px;margin-top:50px;">
			<form name="send_stock_refill_notifications_form" ethod="post" action="http://localhost:8080/dbconnection_xampp/send_stock_refill_notifications.jsp">
			  <label>Enter the Medicine Name : </label><input type="text" name="mname" placeholder="Enter medicine name"/>
			  <br>
			  <br>
			  <label>Enter the Required Quantity : </label><input type="number" name="qty" placeholder="Enter medicine qty"/>
			  <br>
			  <br>
			  <label for="medtype">Select Medicine type :</label>
						<select name="type">
						  <option value="Syrup">Syrup</option>
						  <option value="Tablet">Tablet</option>
						  <option value="Cream">Cream</option>
						  <option value="Powder">Powder</option>
						  <option value="Soap">Soap</option> 
						</select> 
			  <br>
			  <br>
			  <br>
			  <!-- along with this send current date to admin -->
			  <input style="margin-left: 160px;" type="submit" name="action" value="Send Notification To Admin"/>	
			</form>
			<br>
			<br>
			<%
				String act = request.getParameter("action");
			
					 String url="jdbc:mysql://localhost:3306/final_dbmsmini";
					 String userName="root";
					 String password="";
					
					 try
					 {
						 	Class.forName("com.mysql.jdbc.Driver");
							java.sql.Connection conn=DriverManager.getConnection(url,userName,password);
							java.sql.Statement stmt=conn.createStatement();
						 

							if(act.equals("Send Notification To Admin"))
							{
						
								HttpSession s = request.getSession(false);
								String bid = ""+s.getAttribute("bid");
								System.out.println("branch id : "+bid);
								
								String query = "INSERT INTO notifications VALUES (NULL,"+bid+",'"+request.getParameter("mname")+"',"+request.getParameter("qty")+",'"+request.getParameter("type")+"')";
								int i=stmt.executeUpdate(query);
								if (i<0)
									out.println("Error");
								else
								{
									act="SHOW ALL NOTIFICATIONS";
								}
							}
							if(act.equals("SHOW ALL NOTIFICATIONS"))
							{
								
								 ResultSet rs=stmt.executeQuery("Select * from notifications");
								 
								 if(rs.next()==false)
								 {
									 out.println("Notification Not Found !");
								 }	 
								 else
								 {
									rs.beforeFirst();
								 	out.println("<table border='1'cellpadding='10' style='border-collapse:collapse;margin-left:100px;'>");
									
								    out.println("<tr>");
								    
									out.println("<th>");
									out.println("Nsr");
						            out.println("</th>");
						            out.println("<th>");
						            out.println("Bid");
						            out.println("</th>");
						            out.println("<th>");
						            out.println("Mname");
						            out.println("</th>");
						            out.println("<th>");
						            out.println("Qty");
						            out.println("</th>");
						            out.println("<th>");
						            out.println("Type");
						            out.println("</th>");
						            
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
							            out.println(qty + "<br>");
							            out.println("</td>");
							            out.println("<td>");
							            out.println(type + "<br>");
							            out.println("</td>");
							            
							            out.println("</tr>");
									}
								    out.println("</tr>");
								    out.println("</table>");
								
								 }
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