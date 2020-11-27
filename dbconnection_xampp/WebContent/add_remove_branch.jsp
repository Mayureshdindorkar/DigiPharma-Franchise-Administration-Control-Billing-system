<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Add or Remove Branch</title>
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
				<h2>Add or remove a branch</h2>		
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
		  <h3 style="margin-left:30px;">Select the operation you want to perform :</h3>
		  <br>
		  <a href="add_new_medicine.jsp">Add Medicine Stock</a>
		  <br>
		  <a href="delete_medicine.jsp">Remove Medicine Stock</a>
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
		
		<div class="main">
		  
		  		<form name="add_remove_branch_form1" action="http://localhost:8080/dbconnection_xampp/add_remove_branch.jsp" method="post">
					<label style="margin-left:350px;width:300px">Enter new Branch Name :</label><input type="text" name="bname" placeholder="Enter Branch name"/>
					<br>
					<br>
					<label style="margin-left:350px;width:300px">Enter new Branch Id :</label><input type="text" name="bid" placeholder="Enter New Branch's Ide"/>
					<br>
					<br>
					<input type="submit" name="action" value="ADD BRANCH" style="margin-left:450px;width:350px;"/>
					<br>
					<br>
					<input type="submit"  name="action" value="REMOVE BRANCH" style="margin-left:450px;width:350px;"/>
					<br>
					<br>
					<input type="submit"  name="action" value="SHOW ALL BRANCHES OF OUR SHOP" style="margin-left:450px;width:350px;">
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
						
						if (act.equals("ADD BRANCH"))
						{
							String bname=request.getParameter("bname");
							System.out.println("bname :"+bname);
							
							String query = "INSERT INTO branchinfo VALUES ('"+request.getParameter("bid")+"','"+request.getParameter("bname")+"')";
							int i=stmt.executeUpdate(query);
							
							 //creating medicine table for new branch
                            String query55 = "CREATE TABLE "+request.getParameter("bname")+"_medicine"+"(mid VARCHAR(255) PRIMARY KEY,mname VARCHAR(255),mcname VARCHAR(255),price FLOAT,expdate date,mtype VARCHAR(255),qtyrem int(11))";
                            PreparedStatement pst55 = conn.prepareStatement(query55);
                            int vv55 = pst55.executeUpdate();
                            System.out.println("medicine table created ");
                            
                            //creating 'cart' for new branch noPK
                            String query4 = "CREATE TABLE "+request.getParameter("bname")+"cart"+"(billid int,mid VARCHAR(255),mname VARCHAR(255),cname VARCHAR(255),custname VARCHAR(255),qty INT,price FLOAT,docname VARCHAR(255),qtyprice FLOAT,paiddate DATE)";
                            PreparedStatement pst4 = conn.prepareStatement(query4);
                            int vv = pst4.executeUpdate();
                            System.out.println("cart ceated");

                            //creating 'detailed transaction' table for new branch
                            String query3 = "CREATE TABLE "+request.getParameter("bname")+"detailedtran"+"(billid int ,custname VARCHAR(255) ,docname VARCHAR(255) ,totalqtyprice FLOAT,paiddate date )";
                            PreparedStatement pst3 = conn.prepareStatement(query3);
                            int v = pst3.executeUpdate();
                            System.out.println("detailedtran ceated");
							
							
							if (i<0)
								out.println("Table empty");
							else
							{
								act="SHOW ALL BRANCHES OF OUR SHOP";
							}
							
						}
					//	String sel = request.getParameter("select");
						 if (act.equals("REMOVE BRANCH")) 
						 {
							
							 int i1=stmt.executeUpdate("DROP TABLE "+request.getParameter("bname")+"_medicine");
                             
                            //deleting 'cart' for new branch
                             int i2=stmt.executeUpdate("DROP TABLE "+request.getParameter("bname")+"cart");
                             
                             //deleting 'detailed transaction' table for new branch
                             int i3=stmt.executeUpdate("DROP TABLE "+request.getParameter("bname")+"detailedtran");

                             //deleting entry of branch from branchinfo table
                             int i4=stmt.executeUpdate("DELETE FROM branchinfo WHERE bid="+request.getParameter("bid"));

                       
                             if (i1<0||i2<0||i3<0||i4<0)
 								out.println("Table empty");
 							else
 							{
 								act="SHOW ALL BRANCHES OF OUR SHOP";
 							}
                             
						  }
						 if (act.equals("SHOW ALL BRANCHES OF OUR SHOP")) 
						 {
							System.out.println("in select");
							 
							String bname=request.getParameter("bname");
							System.out.println("bname :"+bname);
							
							ResultSet rs=stmt.executeQuery("select * from branchinfo");
							
							System.out.println("fetched query");
						    
							if(rs.next()==false)
							 {
								 out.println("Branch table empty");
							 }	 
							 else
							 {
								rs.beforeFirst();
								out.println("<br>");
								out.println("<br>");
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
						            bname = rs.getString("bname");
						            
						            out.println("<tr>");
						            
						            out.println("<td>");
						            out.println( bid + "<br>");
						            out.println("</td>");
						            out.println("<td>");
						            out.println( bname + "<br>");
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
						// TODO: handle exception
						//out.println(e);
						System.out.println(e);
					}
				%>
				
				
 		</div>		   
	</body>
</html>