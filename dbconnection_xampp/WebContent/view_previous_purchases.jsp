<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>View Previous PurchaseAt All Branches</title>
	<link rel="stylesheet" href="admin_operations.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/additional-methods.js"></script>
		<script src="login_validate.js"></script>
	</head>

	<body>
		
		<table style="margin-left:400px;">
		<tr>
			<td width=600px>
				<h2>Select operation that you want to perform :</h2>		
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
		  	<h2>Select operation that you want to perform : </h2>
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
		<br>
		<div class="main">
		  
		  		<form name="view_previous_purchases_form" method="post" action="http://localhost:8080/dbconnection_xampp/view_previous_purchases.jsp">
					<input type="text" name="cust_mobile" style="margin-left:200px;width:350px;" placeholder="Enter your mobile number">
					<input type="submit" name="action" value="View My Previous Purchases At All Branches" style="margin-left:100px;width:350px;"/>
				</form>
				<br>
				
					
				<%
				 try
				{
						String url="jdbc:mysql://localhost:3306/final_dbmsmini";
						String userName="root";
						String password="";
					 
					 	Class.forName("com.mysql.jdbc.Driver");
						java.sql.Connection conn=DriverManager.getConnection(url,userName,password);
						//out.println("<h1>Connection Success!</h1>");
						System.out.println("Connection Successfull");
						
						java.sql.Statement stmt=conn.createStatement();
						
						String act = request.getParameter("action");
						System.out.println("action :"+act);
						out.println("<br>");
						out.println("<br>");
						if (act.equals("View My Previous Purchases At All Branches")) 
						 {
							
								out.println("<table border='1'cellpadding='10' style='border-collapse:collapse;margin-left:150px;'>");
								out.println("<tr>");
								
								out.println("<th>");
								out.println("Billid");
								out.println("</th>");
								
								out.println("<th>");
								out.println("Custname");
								out.println("</th>");
								
								out.println("<th>");
								out.println("Docname");
								out.println("</th>");
								
								out.println("<th>");
								out.println("TotalQtyprice");
								out.println("</th>");
								
								out.println("<th>");
								out.println("Paiddate");
								out.println("</th>");
								
								out.println("<th>");
								out.println("Cust_mobile");
								out.println("</th>");
								
								out.println("</tr>");
							
                            //getting names of all branches from branchinfo table
                            String query2 = "select bname from branchinfo";
                            PreparedStatement pst2 = conn.prepareStatement(query2);
                            ResultSet rs2 = pst2.executeQuery(); 
                            
                            System.out.println("0");
                            
                            while(rs2.next())
                            {
                            		
                                    String temp_bname = rs2.getString("bname");
                                    System.out.println("temp_bname  : "+temp_bname); 
                                    
                                    System.out.println("1");
                                    
                                    String query1 = "select * from "+temp_bname+"detailedtran WHERE cust_mobile="+request.getParameter("cust_mobile");
                                    PreparedStatement pst1 = conn.prepareStatement(query1);
                                    ResultSet rs1 = pst1.executeQuery();
                                    
                                    //rs1.next();
                                    
                                    System.out.println("2");
                                    
                                    if(rs1.next())
                                    {	
                                    	String billid = rs1.getString("billid");
                                        String custname = rs1.getString("custname");
                                        String docname = rs1.getString("docname");
                                        String totalqtyprice = rs1.getString("totalqtyprice");
                                        String paiddate = rs1.getString("paiddate");
                                        
                                        System.out.println("3");
                                        
                                    	out.println("<tr>");
                                    	
	                                    out.println("<td>"); 
	                                    out.println(billid);
	                                    out.println("</td>");
	                                    
	                                    out.println("<td>"); 
	                                    out.println(custname);
	                                    out.println("</td>");
	                                    
	                                    out.println("<td>"); 
	                                    out.println(docname);
	                                    out.println("</td>");
	                                    
	                                    out.println("<td>"); 
	                                    out.println(totalqtyprice);
	                                    out.println("</td>");
	                                    
	                                    out.println("<td>"); 
	                                    out.println(paiddate);
	                                    out.println("</td>");
	                                    
	                                    out.println("<td>"); 
	                                    out.println(request.getParameter("cust_mobile"));
	                                    out.println("</td>");
	                            		
	                                    out.println("</tr>");
                                    }
                            }
                            
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