<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.HashMap,java.util.Iterator,java.util.Map,java.util.Set,java.util.Random " %>          
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Remove Medicine</title>
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
				<h2>Delete Medicine at Particular Branch</h2>		
			</td>
			<td style="padding-left:600px;">
				<h4>Welcome Admin : ${admin_name}</h4>	
				<form action="logout_servlet" method="get">
				<input type="submit" value="Logout">
				</form>
			</td>	
		</tr>
		</table>
		<h2 class="center" style="margin-left:450px;">Remove Medicine From Inventory of Particular Branch</h2>

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
		  		<br>
		  		<form method="post" name="delete_medicine_form1" action="http://localhost:8080/dbconnection_xampp/delete_medicine.jsp">
				<label style="width:350px;margin-left:300px;">Enter Branch Location :</label><input name="bname" type="text" style="width:350px;" placeholder="Branch location"/>
				<br>
				<br>
				<input type="submit" value="SHOW ALL MEDICINES AVAILABLE AT THIS BRANCH"  name="action" style="margin-left:400px;width:350px;"/>
				<br>
				<br>	
				<label style="width:350px;margin-left:300px;">Enter medicine name you want to delete :</label><input  name="med_name_search" type="text" style="width:350px;" placeholder="Medicine name"/>
				<br>
				<br>
				<br>
				<input type="submit" name="action" value="DELETE THIS MEDICINE" style="margin-left:400px;width:350px;"/>
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
					
					
					if(act.equals("DELETE THIS MEDICINE"))
					{
						int i1=stmt.executeUpdate("DELETE FROM "+request.getParameter("bname")+"_medicine WHERE mname ='"+request.getParameter("med_name_search")+"'");
                        
                       
                         if (i1<0)
								out.println("Table empty");
						else
						{
								act="SHOW ALL MEDICINES AVAILABLE AT THIS BRANCH";
						}
					}
					if(act.equals("SHOW ALL MEDICINES AVAILABLE AT THIS BRANCH"))
					{
						
							System.out.println("SHOW ALL MEDICINES AVAILABLE AT THIS BRANCH");
							 
							
							String bname=request.getParameter("bname");
							System.out.println("bname :"+bname);
							
							ResultSet rs=stmt.executeQuery("select * from "+bname+"_medicine");
							
							System.out.println("fetched query");
						    
						    out.println("<table border='1'cellpadding='10' style='border-collapse:collapse;margin-left:300px;'>");
							
						    out.println("<tr>");
						    
							out.println("<th>");
				            
							out.println("Mid");
				            out.println("</th>");
				            out.println("<th>");
				            out.println("Mname");
				            out.println("</th>");
				            out.println("<th>");
				            out.println("Mcname");
				            out.println("</th>");
				            out.println("<th>");
				            out.println("Price");
				            out.println("</th>");
				            out.println("<th>");
				            out.println("Expdate");
				            out.println("</th>");
				            out.println("<th>");
				            out.println("Mtype");
				            out.println("</th>");
				            out.println("<th>");
				            out.println("Qtyrem");
				            
				            out.println("</th>");
				            
							
							while (rs.next())
							{
								String mid = rs.getString("mid");
					            String mname = rs.getString("mname");
					            String mcname = rs.getString("mcname");
					            String price = rs.getString("price");
					            String expdate = rs.getString("Expdate");
					            String mtype = rs.getString("mtype");
					            String qtyrem = rs.getString("qtyrem");
					            
					            out.println("<tr>");
					            
					            out.println("<td>");
					            out.println( mid + "<br>");
					            out.println("</td>");
					            out.println("<td>");
					            out.println( mname + "<br>");
					            out.println("</td>");
					            out.println("<td>");
					            out.println( mcname + "<br>");
					            out.println("</td>");
					            out.println("<td>");
					            out.println(price + "<br>");
					            out.println("</td>");
					            out.println("<td>");
					            out.println(expdate + "<br>");
					            out.println("</td>");
					            out.println("<td>");
					            out.println( mtype + "<br>");
					            out.println("</td>");
					            out.println("<td>");
					            out.println(qtyrem + "<br>");
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