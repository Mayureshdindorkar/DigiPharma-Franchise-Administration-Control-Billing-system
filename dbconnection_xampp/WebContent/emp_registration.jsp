<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.Random" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Register New Employee</title>
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
				<h2>New Employee Registration</h2>		
			</td>
			<td style="padding-left:600px;">
				<h4>Welcome Admin : ${admin_name}</h4>	
				<form action="logout_servlet" method="get">
				<input type="submit" value="Logout">
				</form>
			</td>	
		</tr>
		</table>
		<br>
		<h2 class="center" style="margin-left:450px;">Assign New Empoyee at Particular Branch</h2>
	
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
		  <a href="remove_emp.jsp">Remove Employee</a>
		  <br>
		  <a href="apply_remove_offers.jsp">Add or Remove Offers</a>
		</div>
		
		<div class="main">
		
		<br>
		<form  name="emp_registration_form" action="http://localhost:8080/dbconnection_xampp/emp_registration.jsp" method="post">
		<label style="margin-left:300px;width:300px">Enter Branch Location :</label>
		<input type="text" name="ebname" placeholder="Branch name"/>
		<br>
		<br>
		<input type="submit" name="action" style="margin-left:450px;width:350px;" value="SHOW ALL EMPLOYEES AT THIS BRANCH">
		</form>
		<br>
		<br>	
		  
		  <table>
		  	<tr>
		  		<td>
		  		
		  <form name="emp_registration_form_2" action="http://localhost:8080/dbconnection_xampp/emp_registration.jsp" method="post" >
				<fieldset>
	    		  <legend> New Employee Registration </legend>
	    		  <br>
				  <br>
				  <div>
				  <label>Enter Employee Name:</label> <input type="text" name="ename" placeholder="Enter Name "><br>
				  </div>
				  <br>
				  <br>
				  <div>
				  <label>Enter Employee Salary:</label> <input type="text"  name="esalary" placeholder="Enter MedicineName"><br>
				  </div>
				  <br>
				  <br>
				  <div>
				  <label>Enter Employee Address	:</label> <textarea type="text"  name="eaddress" placeholder="Enter eaddres"></textarea><br>
				  </div>
				  <br>
				  <br>
				  <br>
				  <div>
				  <label>Enter Branch Name :</label><input type="text"  name="ebname" placeholder="Enter Branch name"><br>
				  </div>
				  <br>
				  <br>
				 
				  	<input type="submit" name="action" value="INSERT" style="margin-left:240px;">
				  </div>
				</fieldset>
			</form>
			</td>
			<td>
				<% 
					String act = request.getParameter("action");
					
				
						String url="jdbc:mysql://localhost:3306/final_dbmsmini";
						 String userName="root";
						 String password="";
						
						 try
						 {
								Class.forName("com.mysql.jdbc.Driver");
								java.sql.Connection conn=DriverManager.getConnection(url,userName,password);
								//out.println("<h1>Connection Success!</h1>");
								
								System.out.println("Connection Successfull");
						
								response.setContentType("text/html");
								
								java.sql.Statement stmt=conn.createStatement();
								
								if(act.equals("INSERT"))
								{
									ResultSet rsx=stmt.executeQuery("Select bid from branchinfo WHERE bname='"+request.getParameter("ebname")+"'");
									rsx.next();
									String bid = rsx.getString("bid"); 
									System.out.println("ebid : "+bid);
									
									
									String query = "INSERT INTO empinfo VALUES (NULL,+'"+request.getParameter("ename")+"','"+request.getParameter("esalary")+"','"+request.getParameter("eaddress")+"','"+bid+"')";
									int i=stmt.executeUpdate(query);
									System.out.println("query executed");
									if (i<0)
									{
										out.println("Error");
										response.sendRedirect("emp_registration.jsp");
									}
									else
									{
										System.out.println("Inserted successfully");
										act = "SHOW ALL EMPLOYEES AT THIS BRANCH";
										
									}
								}
								if(act.equals("SHOW ALL EMPLOYEES AT THIS BRANCH"))
								{
									
									ResultSet rsx=stmt.executeQuery("Select bid from branchinfo WHERE bname='"+request.getParameter("ebname")+"'");
									rsx.next();
									String bid = rsx.getString("bid"); 
									System.out.println("ebid : "+bid);
									
									ResultSet rs=stmt.executeQuery("Select * from empinfo WHERE ebid="+bid);
									
									
									if(rs.next()==false)
									 {
										 out.println(" No emp Found !");
									 }	 
									 else
									 {
										rs.beforeFirst();
									 	out.println("<table border='1'cellpadding='10' style='border-collapse:collapse;margin-left:100px;'>");
										
									    out.println("<tr>");
									    
										out.println("<th>");
							            
										out.println("Eid");
							            out.println("</th>");
							            out.println("<th>");
							            out.println("Ename");
							            out.println("</th>");
							            out.println("<th>");
							            out.println("Esalary");
							            out.println("</th>");
							            out.println("<th>");
							            out.println("Eaddress");
							            out.println("</th>");
							            out.println("<th>");
							            out.println("EmpBranchId");
							            out.println("</th>");
							         
							            
										
										while (rs.next())
										{
											String eid = rs.getString("eid");
								            String ename = rs.getString("ename");
								            String esalary = rs.getString("esalary");
								            String eaddress = rs.getString("eaddress");
								            String ebid = rs.getString("ebid");
								            
								            out.println("<tr>");
								            
								            out.println("<td>");
								            out.println( eid + "<br>");
								            out.println("</td>");
								            out.println("<td>");
								            out.println( ename + "<br>");
								            out.println("</td>");
								            out.println("<td>");
								            out.println( esalary + "<br>");
								            out.println("</td>");
								            out.println("<td>");
								            out.println(eaddress + "<br>");
								            out.println("</td>");
								            out.println("<td>");
								            out.println(ebid + "<br>");
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
				
			</td>
		  	</tr>
		  </table>
 		</div>		   
	</body>
</html>