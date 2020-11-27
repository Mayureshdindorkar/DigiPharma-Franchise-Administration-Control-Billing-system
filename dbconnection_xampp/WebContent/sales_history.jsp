<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Sales History of a Branch</title>
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
				<h2>Sales History of Particular Branch</h2>		
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
		  <a href="view_stock_refill_notifications.jsp">View Stock Refill Notifications</a>
		  <br>
		  <a href="emp_registration.jsp">Register New Employee</a>
		  <br>
		  <a href="remove_emp.jsp">Remove Employee</a>
		  <br>
		  <a href="apply_remove_offers.jsp">Add or Remove Offers</a>
		</div>
		
		<div class="main">
		  
		  		<form method="post" action="http://localhost:8080/dbconnection_xampp/sales_history.jsp" name="sales_history_form">
					<label style="margin-left:330px;width:450px">Enter Branch Location whose sales history you want to see :</label><input name="bname" type="text" placeholder="Branch location"/>
					<br>
					<br>
					<input type="submit" name="action" value="SHOW ONLY TODAY'S SALES" style="margin-left:450px;width:350px;"/>
					<br>
					<br>
					<input type="submit" name="action"  value="SHOW ALL SALES" style="margin-left:450px;width:350px;"/>
				</form>
				
				<%
				try
				{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/final_dbmsmini?serverTimezone=UTC","root",""); 
                   // Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://remotemysql.com:3306/PKtn72VEk8","PKtn72VEk8","HeBPDnSQcl");  //for remote Mysql

                   	if(request.getParameter("action").equals("SHOW ONLY TODAY'S SALES"))
                   	{
		                    String query4 = "select CURDATE()";
		                    PreparedStatement pst4 = con.prepareStatement(query4);
		                    ResultSet rs4 = pst4.executeQuery(); 
		                    rs4.next();
		                    System.out.println("curdate :"+rs4.getString("CURDATE()"));
		
		                    String query3 = "select * from "+request.getParameter("bname")+"detailedtran WHERE paiddate='"+rs4.getString("CURDATE()")+"'";
		                    PreparedStatement pst3 = con.prepareStatement(query3);
		                    ResultSet rs3 = pst3.executeQuery(); 
		                    out.println("<br>");
		                    out.println("<br>");
							 if(rs3.next()==false)
							 {
								 out.println("Data Not Found for this date!");
							 }	 
							 else
							 {
								rs3.beforeFirst();
							 	out.println("<table border='1'cellpadding='10' style='border-collapse:collapse;margin-left:300px;'>");
								
							    out.println("<tr>");
							    
								out.println("<th>");
					            
								out.println("BillId");
					            out.println("</th>");
					            out.println("<th>");
					            out.println("CustName");
					            out.println("</th>");
					            out.println("<th>");
					            out.println("Doctor Name");
					            out.println("</th>");
					            out.println("<th>");
					            out.println("TotalQtyPrice");
					            out.println("</th>");
					            out.println("<th>");
					            out.println("Paiddate");
					            out.println("</th>");
					            out.println("<th>");
					            out.println("CustMobile");
					            out.println("</th>");
					            out.println("</tr>");
					            
								while (rs3.next())
								{
									String billid = rs3.getString("billid");
						            String custname = rs3.getString("custname");
						            String docname = rs3.getString("docname");
						            String totalqtyprice = rs3.getString("totalqtyprice");
						            String paiddate = rs3.getString("paiddate");
						            String custmobile = rs3.getString("cust_mobile");
						            
						            out.println("<tr>");
						            
						            out.println("<td>");
						            out.println( billid + "<br>");
						            out.println("</td>");
						            out.println("<td>");
						            out.println( custname + "<br>");
						            out.println("</td>");
						            out.println("<td>");
						            out.println( docname + "<br>");
						            out.println("</td>");
						            out.println("<td>");
						            out.println(totalqtyprice + "<br>");
						            out.println("</td>");
						            out.println("<td>");
						            out.println(paiddate + "<br>");
						            out.println("</td>");
						            out.println("<td>");
						            out.println( custmobile + "<br>");
						            out.println("</td>");
						            
						            out.println("</tr>");
								}
							  
							    out.println("</table>");
							
							 }
                   		
				        }
                   
                   	if(request.getParameter("action").equals("SHOW ALL SALES"))
                   	{
		                    System.out.println("0");
		                    
                   			String query3 = "select * from "+request.getParameter("bname")+"detailedtran";
		                    PreparedStatement pst3 = con.prepareStatement(query3);
		                    ResultSet rs3 = pst3.executeQuery(); 
		                    out.println("<br>");
		                    out.println("<br>");
		                    
		                    System.out.println("1");
		                    
							 if(rs3.next()==false)
							 {
								 out.println("Data Not Found for this date!");
							 }	 
							 else
							 {
								rs3.beforeFirst();
								System.out.println("2");
							 	out.println("<table border='1'cellpadding='10' style='border-collapse:collapse;margin-left:300px;'>");
								
							    out.println("<tr>");
							    
								out.println("<th>");
					            
								out.println("BillId");
					            out.println("</th>");
					            out.println("<th>");
					            out.println("CustName");
					            out.println("</th>");
					            out.println("<th>");
					            out.println("Doctor Name");
					            out.println("</th>");
					            out.println("<th>");
					            out.println("TotalQtyPrice");
					            out.println("</th>");
					            out.println("<th>");
					            out.println("Paiddate");
					            out.println("</th>");
					            out.println("<th>");
					            out.println("CustMobile");
					            out.println("</th>");
					            out.println("</tr>");
					            
								while (rs3.next())
								{
									String billid = rs3.getString("billid");
						            String custname = rs3.getString("custname");
						            String docname = rs3.getString("docname");
						            String totalqtyprice = rs3.getString("totalqtyprice");
						            String paiddate = rs3.getString("paiddate");
						            String custmobile = rs3.getString("cust_mobile");
						            
						            out.println("<tr>");
						            
						            out.println("<td>");
						            out.println( billid + "<br>");
						            out.println("</td>");
						            out.println("<td>");
						            out.println( custname + "<br>");
						            out.println("</td>");
						            out.println("<td>");
						            out.println( docname + "<br>");
						            out.println("</td>");
						            out.println("<td>");
						            out.println(totalqtyprice + "<br>");
						            out.println("</td>");
						            out.println("<td>");
						            out.println(paiddate + "<br>");
						            out.println("</td>");
						            out.println("<td>");
						            out.println( custmobile + "<br>");
						            out.println("</td>");
						            
						            out.println("</tr>");
								}
							  
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