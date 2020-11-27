<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@page import="java.sql.*,java.util.HashMap,java.util.Iterator,java.util.Map,java.util.Set" %>     
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>Search Medicine At All Branches</title>
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
		  
		  			<form method="post" name="cust_search_medicine_form" action="http://localhost:8080/dbconnection_xampp/cust_search_medicine.jsp">
					<label style="margin-left:330px;width:450px">Enter the Medicine Name that you want to search :</label><input type="text" name="med_name_search" placeholder="Medicine Name"/>
					<br>
					<br>
					<input type="submit" name="action" value="Search Medicine at all Branches" style="margin-left:450px;width:350px;"/>
				</form>
				<br>
				<%
					HashMap<String, String> hmap = new HashMap<String, String>();
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
						
						
						if (act.equals("Search Medicine at all Branches")) 
						{
							String query2 = "select bname from branchinfo";
                            PreparedStatement pst2 = conn.prepareStatement(query2);
                            ResultSet rs2 = pst2.executeQuery(); 
							System.out.println("rs2 executed");
							
			                while(rs2.next())
			                {
			                	String temp_bname = rs2.getString("bname");
                                
                                System.out.println(request.getParameter("action"));
                                String query1 = "select price from "+temp_bname+"_medicine WHERE mname='"+request.getParameter("med_name_search")+"'";
                                PreparedStatement pst1 = conn.prepareStatement(query1);
                                ResultSet rs1 = pst1.executeQuery();
    							if(rs1.next()==false)
   							 	{
   								 System.out.println("rs1 empty");
   							 	}	 
    							else
    							{
    								String price = rs1.getString("price");
                                    hmap.put(temp_bname,price); //storing in hmap (bname,price)	
    							}
                                
			                }
			                
			                Set set = hmap.entrySet();
                            Iterator iterator = set.iterator();
                            out.println("<h3>Price of the Medicine at Different Branches</h3>");
                            
                            	
                            int i=1;
                            while(iterator.hasNext())
                            {
                               out.println("<tr>");	
                             
                               Map.Entry mentry = (Map.Entry)iterator.next();
                               out.println("\t\t\t\t"+i+")  Branch : "+ mentry.getKey() + " 	& 		Price :  "+mentry.getValue()+"\n\n"+"<br><br>");
                               i++;
                               
                               out.println("</tr>");	
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