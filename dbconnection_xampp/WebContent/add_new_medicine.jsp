<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert New Medicine</title>
	<link rel="stylesheet" href="admin_operations.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/additional-methods.js"></script>
		<script src="login_validate.js"></script>
	
	<script>
	    $(function(){
	        var dtToday = new Date();
	        
	        var month = dtToday.getMonth() + 1;
	        var day = dtToday.getDate();
	        var year = dtToday.getFullYear();
	        if(month < 10)
	            month = '0' + month.toString();
	        if(day < 10)
	            day = '0' + day.toString();
	        
	        var today = year + '-' + month + '-' + day;
	        //alert(today);
	        $('#expdate').attr('min', today);
	    });
	
	</script>
	
	</head>

	<body>
		<table style="margin-left:400px;">
		<tr>
			<td width=600px>
				<h2>Insert New Medicine at Particular Branch</h2>		
			</td>
			<td style="padding-left:600px;">
				<h4>Welcome Admin : ${admin_name}</h4>	
				<form action="logout_servlet" method="get">
				<input type="submit" value="Logout">
				</form>
			</td>	
		</tr>
		</table>
		
		
		<form name="add_new_medicine_form1111"  action="http://localhost:8080/dbconnection_xampp/add_new_medicine.jsp" method="post">
			<label style="margin-left:800px;width:300px">Enter Branch Location :</label><input type="text" name="bname" placeholder="Branch location"/>
			<br>
			<br>
			<label style="margin-left:800px;width:300px">Enter medicine name you want to search :</label><input type="text" name="mname" placeholder="Medicine name"/>
			<br>
			<br>
			<input type="submit" name="action" value="SEARCH MEDICINE" style="margin-left:900px;width:350px;"/>
			<br>
			<br>
			<input type="submit" name="action" style="margin-left:900px;width:350px;" value="SHOW ALL MEDICINES AVAILABLE AT THIS BRANCH">
		</form>
		
		<br>
		<br>	
	
		<div class="sidenav">
		<table>
		<tr>
		<td>
		<img alt="Logo is absent" src="logo.jpg" width=100px height=100px style="margin-left:150px;">
		</td>
		</tr>
		</table>
		  <h3 style="margin-left:30px;">Select the operation you want to perform : </h3>
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
		
		<div class="main">
		  
		  <table>
		  <tr>
		  <td>
		  <form name="add_new_medicine_form" method="post" id="f1">
				<fieldset>
	    		  <legend> Admin Login </legend>
	    		  <br>
	    		  <br>
	    		  <div>
	    		  <label>Enter Branch Location :</label><input type="text" name="bname" placeholder="Branch location"/>
	    		  </div>
	    		  <br>
				  <br>
				  <div>
				  <label>Enter MedicineID	:</label> <input type="text" placeholder="Enter MedicineID " name="mid"><br>
				  </div>
				  <br>
				  <br>
				  <div>
				  <label>Enter Medicine Name:</label> <input type="text" placeholder="Enter MedicineName" name="mname"><br>
				  </div>
				  <br>
				  <br>
				  <div>
				  <label>Enter Company Name	:</label> <input type="password" placeholder="Enter Company Name" name="mcname"><br>
				  </div>
				  <br>
				  <br>
				  <div>
				  <label>Select Expiry Date :</label> <input type="date" id="expdate" name="expdate"/><br>
				  </div>
				  <br>
				  <br>
				  <div>
				  <label>Enter Medicine Price:</label> <input type="text" name="price"><br>
				  </div>
				  <br>
				  <br>
 				    <label for="mtype">Select Medicine type :</label>
					<select name="mtype">
					  <option value="Syrup">Syrup</option>
					  <option value="Tablet">Tablet</option>
					  <option value="Cream">Cream</option>
					  <option value="Powder">Powder</option>
					  <option value="Soap">Soap</option> 
					</select> 
				  <br>
				  <br>
				  <br>
				  <div>
				  <label>Enter Medicine Stock/Quantity	:</label> <input type="text"  name="qtyrem"><br>
				  </div>
				  <br>
				  <br>
				  <div>
				  	<input type="submit" name="action" value="Insert" style="margin-left:240px;">
				  </div>
				</fieldset>
			</form>
			</td>
			
			<td>
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
						
						if (act.equals("Insert"))
						{
							String bname=request.getParameter("bname");
							System.out.println("bname :"+bname);
							
							String query = "INSERT INTO "+request.getParameter("bname")+"_medicine VALUES ('"+request.getParameter("mid")+"','"+request.getParameter("mname")+"','"+request.getParameter("mcname")+"','"+request.getParameter("price")+"','"+request.getParameter("expdate")+"','"+request.getParameter("mtype")+"','"+request.getParameter("qtyrem")+"'"+")";
							int i=stmt.executeUpdate(query);
							if (i<0)
								out.println("Error");
							else
							{
								act="Select";
							}
							
						}
					//	String sel = request.getParameter("select");
						 if (act.equals("SEARCH MEDICINE")) 
						 {
							 String bname=request.getParameter("bname");
							 ResultSet rs=stmt.executeQuery("Select * from "+bname+"_medicine"+" where mname = '"+request.getParameter("mname")+"'");
							 
							 if(rs.next()==false)
							 {
								 out.println("Medicine Not Found !");
							 }	 
							 else
							 {
								rs.beforeFirst();
							 	out.println("<table border='1'cellpadding='10' style='border-collapse:collapse;margin-left:100px;'>");
								
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
						 if (act.equals("Select") || act.equals("SHOW ALL MEDICINES AVAILABLE AT THIS BRANCH")) 
						 {
							System.out.println("in select");
							 
							String bname=request.getParameter("bname");
							System.out.println("bname :"+bname);
							
							ResultSet rs=stmt.executeQuery("select * from "+bname+"_medicine");
							
							System.out.println("fetched query");
						    
						    out.println("<table border='1'cellpadding='10' style='border-collapse:collapse;margin-left:100px;'>");
							
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
					catch (Exception e) 
				    {
						// TODO: handle exception
						//out.println(e);
						System.out.println(e);
					}
				%>
				
			</td>
			
			</tr>
			</table>
 		</div>		   
	</body>
</html>