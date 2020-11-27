<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.*,java.util.HashMap,java.util.Iterator,java.util.Map,java.util.Set,java.util.Random " %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Remove Employee</title>
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
				<h2>Remove Employee working at Particular Branch</h2>		
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
		  <a href="apply_remove_offers.jsp">Add or Remove Offers</a>
		</div>
		
		<div class="main" >
		  
		  		<br>
		  		<br>
		  		<form method="post"  name="remove_emp_form1" action="http://localhost:8080/dbconnection_xampp/remove_emp.jsp" method="post" >
				<label style="width:350px;margin-left:200px;">Enter Branch Name :</label><input type="text" name="ebname" style="width:200px;" placeholder="Branch location"/>
				<input style="margin-left:100px;" name="action2" type="submit" value="SHOW ALL EMPLOYEES AVAILABLE AT THIS BRANCH">
				<br>
				<br>
				<label style="width:350px;margin-left:200px;">Enter EmpID of employee you want to Delete :</label><input type="text" name="eid" style="width:350px;" placeholder="Enter EmpID"/>
				<br>
				<br>
				<br>
				<input type="submit" name="action1" value="DELETE THIS EMPLOYEE" style="margin-left:400px;width:350px;"/>
				<br>
				<br>
				
				</form>
				<br>
				<br>	
				
				<%
				try 
				{
					String act;
					System.out.println("0");
					if(request.getParameter("action1")==null)
					{
						act = request.getParameter("action2");
						System.out.println("1");
					}
					else
					{
						act = request.getParameter("action1");
						System.out.println("2");
					}
					
					
					if(act.equals("DELETE THIS EMPLOYEE"))
					{
						System.out.println("3");
						
						Class.forName("com.mysql.jdbc.Driver");
	                     Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/final_dbmsmini?serverTimezone=UTC","root",""); 
	                    //Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://remotemysql.com:3306/PKtn72VEk8","PKtn72VEk8","HeBPDnSQcl");  //for remote Mysql
	                    
	                                  
	                    String query2 = "DELETE FROM empinfo WHERE eid ='"+request.getParameter("eid")+"'";   
	                    PreparedStatement pst2 = con.prepareStatement(query2);
	                    int x = pst2.executeUpdate(); 
	                    System.out.println("Employee Deletion Successful");
	                    
	                    act="SHOW ALL EMPLOYEES AVAILABLE AT THIS BRANCH";
	                    
	                    
					}
					if(act.equals("SHOW ALL EMPLOYEES AVAILABLE AT THIS BRANCH"))
					{
						System.out.println("4");
						
						Class.forName("com.mysql.jdbc.Driver");
	                    Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/final_dbmsmini?serverTimezone=UTC","root","");
						java.sql.Statement stmt=con.createStatement();
						
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
						 	out.println("<table border='1'cellpadding='10' style='border-collapse:collapse;margin-left:300px;'>");
							
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
			catch (Exception e)
			{
	         System.out.println(e);
	        }
				
				
				
				
				%>	
			
 		</div>		   
	</body>
</html>