<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@page import="java.sql.*,java.util.HashMap,java.util.Iterator,java.util.Map,java.util.Set,java.util.Random " %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>Employee Session</title>
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
				<h2>Place Customer's Order</h2>		
			</td>
			<td style="padding-left:600px;">
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
		  	<h2>Select operation that you want to perform : </h2>
		  <a href="send_stock_refill_notifications.jsp">Send Stock Refill Notifications to Admin</a>
		</div>
		
		<br>
		<table>
			<tr>
				<td>
				
						<table  style="margin-left:450px;width:100px;height:100px;">
							<tr>
								<td>
									<form method="post" action="http://localhost:8080/dbconnection_xampp/emp_place_order.jsp">
										<input type="submit" name="action" value="Accept New Customer's Order">
									</form>
								</td>
								<td>
									<form method="post" action="http://localhost:8080/dbconnection_xampp/emp_place_order.jsp"  style="margin-left:50px;">
										<input type="submit" name="action" value="Cancel Current Customer's Cart">
									</form>
								</td>
							</tr>
						</table>
		
						
						<br>
						<form action="http://localhost:8080/dbconnection_xampp/emp_place_order.jsp" method="post" style="margin-left:400px;">
						
							<input style="margin-left:70px;width:350px" type="submit" name="action" value="Display All Medicines available At This Branch">
							<br>
							<br>
							<br>
						</form>
				
				<form name="emp_place_order_form" method="post" id="f1" style="margin-left:400px;">
				<fieldset>
	    		  <legend> Customer Info </legend>
	    				
						<br>
						<label style="margin-left:2px;width:300px">Enter Customer's Name :</label><input name="cname" type="text" placeholder="Enter Customer Name"/>
						<br>
						<br>
						<label style="margin-left:2px;width:300px">Enter Doctor's Name :</label><input type="text" name="docname" placeholder="Enter Doctor's Name"/>
						<br>
						<br>
						<label style="margin-left:2px;width:300px">Enter Customer's Mobile No. :</label><input type="text" name="cmob" placeholder="Enter Customer's Mobile No."/>
						<br>
						<br>
						<br>
						<input type="submit" name="action" style="margin-left:150px;" value="Submit Customer Details">
						<br>
						
						<% 
						try
						{
							if(request.getParameter("action").equals("Submit Customer Details"))
							{
								
								String cname=request.getParameter("cname");
								String docname=request.getParameter("docname");
								String cmob=request.getParameter("cmob");
								
								session = request.getSession(false);
								session.setAttribute("cname", cname);
								session.setAttribute("docname", docname);
								session.setAttribute("cmob", cmob);
								
							}
						}
						catch(Exception e)
						{
							System.out.println(e);
						}
						%>
						
				</fieldset>
			 	</form>
				
				<br>
				<div style="margin-left:400px;">
					<h2>Orders</h2>
					
					<form name="emp_place_order_form2" action="http://localhost:8080/dbconnection_xampp/emp_place_order.jsp" method="post">
						<label style="margin-left:2px;width:300px">Enter Medicine ID :</label><input name="mid" type="text" placeholder="Enter MedicineID"/>
						<br>
						<br>
						<label style="margin-left:2px;width:300px">Enter Medicine Quantity :</label><input type="text" name="qty" placeholder="Enter Quantity"/>
						<br>
						<br>
						<input type="submit" style="margin-left:150px;" name="action" value="Add to current Customer's Cart">
						<br>
					</form>
					
					<br>
					
					<form name="emp_place_order_form3" action="http://localhost:8080/dbconnection_xampp/emp_place_order.jsp" method="post">
						<label style="margin-left:2px;width:300px">Enter Medicine Id to cancel Order:</label><input name="mid" type="text" placeholder="Enter MedicneId"/>
						<br>
						<br>
						<input type="submit" style="margin-left:100px;" name="action" value="Remove from Customer's Cart">
					</form>
				
						<form  action="http://localhost:8080/dbconnection_xampp/printbill_servlet" method="post">
						
							<input type="submit" name="action" value="PRINT BILL">
						
						</form>
				</div>
			
				</td>
				
				<td>
				<div style="margin-left:50px;">
				<%		
						try
						{
							
							
							Class.forName("com.mysql.jdbc.Driver");
							Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/final_dbmsmini","root","");
							Statement stmt = (Statement) conn.createStatement();
							
							System.out.println("DB Connection successfull");
							
							
							if(request.getParameter("action").equals("Accept New Customer's Order"))
							{
								System.out.println("Entered into accept new customer's order");
								session = request.getSession(false);
								
								Random rand = new Random(); 
								int randomnumber = rand.nextInt(1000000);
								session.setAttribute("current_cust_billid",randomnumber);
								System.out.println("current_cust_billid :"+randomnumber); 
							}
							else if(request.getParameter("action").equals("Cancel Current Customer's Cart"))
							{
								 System.out.println("Entered into cancel order");
						         
								 session = request.getSession(false);
								 
								 session.removeAttribute("cname");
								 session.removeAttribute("docname");
								 session.removeAttribute("cmob");
								 
								 
								 String current_cust_billid = ""+session.getAttribute("current_cust_billid");
								 
								 session.removeAttribute("current_cust_billid");
								 
								 String bname = ""+session.getAttribute("bname");
								 System.out.println("bname :"+bname);   
						            //getting all records from cart for particular billid i.e. customer
						          
						            String query2 = "select * from "+bname+"cart where billid="+current_cust_billid;
						            PreparedStatement pst = conn.prepareStatement(query2);
						            ResultSet rs = pst.executeQuery(); 
						           // carttable.setModel(DbUtils.resultSetToTableModel(rs));
						            System.out.println("Got all values from cart");
						            
						            
						           while(rs.next())
						            {
						                
						                //getting cart qty of medicine you want to cancel
						                String qty =rs.getString("qty");                                        
						                System.out.println("qty :"+qty);
						            
						                //updating remstock in medicine aftter deletion of an item
						                String query6 = "UPDATE "+bname+"_medicine SET qtyrem=qtyrem+"+qty+" WHERE mid='"+rs.getString("mid")+"'";
						                PreparedStatement pst6 = conn.prepareStatement(query6);
						                int rs6 = pst6.executeUpdate(); 
						                
						                System.out.println("medicine table is incremented accordinglly");
						            
						                ///
						                
						                String query3 = "DELETE FROM "+bname+"cart WHERE mid='"+rs.getString("mid")+"'";
						                PreparedStatement pst3 = conn.prepareStatement(query3);
						                int x = pst3.executeUpdate(); 
						            
						                System.out.println("Entry deleted from cart");
						                System.out.println();
						            }
						            
						           ////medicine at that branch
						            out.println("<h2 style='margin-left:120px;'> Display All Medicines available At This Branch</h2><br>"); 
						            ResultSet rsxx=stmt.executeQuery("select * from "+bname+"_medicine");
									
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
						            
									
									while (rsxx.next())
									{
										String mid = rsxx.getString("mid");
							            String mname = rsxx.getString("mname");
							            String mcname = rsxx.getString("mcname");
							            String price = rsxx.getString("price");
							            String expdate = rsxx.getString("Expdate");
							            String mtype = rsxx.getString("mtype");
							            String qtyrem = rsxx.getString("qtyrem");
							            
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
								    out.println("<br>");
								    out.println("<br>");
							}
							
						}
						catch(Exception e)
						{
							System.out.println(e);
						}
				%>
			</div>
				
				
				
				<div style="margin-left:10px;">
					<%
					
					String url="jdbc:mysql://localhost:3306/final_dbmsmini";
					 String userName="root";
					 String password="";
					
					 try
					 {
							Class.forName("com.mysql.jdbc.Driver");
							java.sql.Connection conn=DriverManager.getConnection(url,userName,password);
							//out.println("<h1>Connection Success!</h1>");
							System.out.println("Connection Successfull");
							
							java.sql.Statement stmt=conn.createStatement();
							
							String act = request.getParameter("action");
							System.out.println("action :"+act);
					
							if (act.equals("Display All Medicines available At This Branch")) 
							 {
								System.out.println("in Display All Medicines available At This Branch");
							    out.println("<h2 style='margin-left:120px;'> Display All Medicines available At This Branch</h2><br>"); 
								//String bname=request.getParameter("bname");
								
								String bname = (String)session.getAttribute("bname");
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
	///////////////////////////////////////////////////////////////////////////////////////////////////				
								 if(act.equals("Add to current Customer's Cart"))
								 {
									 	System.out.println("Add to current Customer's Cart");
									 	out.println("<h2 style='margin-left:120px;'> Displaying current customer's cart</h2><br>"); 
									 	
									 	session = request.getSession(false);
									 	
									 	System.out.println("0");
									 	
										String current_cust_billid = ""+session.getAttribute("current_cust_billid");
										String bname = (String)session.getAttribute("bname");
									 	
										System.out.println("1");
										
									 	String query22 = "Select * from "+bname+"_medicine where mid='"+request.getParameter("mid")+"'";
			                            PreparedStatement statement22= conn.prepareStatement(query22);
			                            ResultSet rmed = statement22.executeQuery(query22);
			                            rmed.next();
			
			                            //int qtyrem = Integer.parseInt(rmed.getString("qtyrem"));
			                           // System.out.println("Result :"+qtyrem);
			
										System.out.println("2");
			                           
			                            float result  = Float.parseFloat(request.getParameter("qty")) * Float.parseFloat(rmed.getString("price")); 
			                            
			                            System.out.println("3");
			                            
			                            String strresult = ""+result; //qtyprice
			
			                            System.out.println("4");
			                            
			                            System.out.println("Result :"+strresult);
			
			                            String query55 = "Select CURDATE()";                                        
			                            PreparedStatement statement55 = conn.prepareStatement(query55);
			                            ResultSet r55=statement55.executeQuery(query55);
			                            r55.next();
			                            System.out.println("Current date :"+r55.getString("CURDATE()"));
			                            String curdate=r55.getString("CURDATE()");
			
			                            //getting remaining qty
			                            String queryqty =" SELECT qtyrem FROM "+bname+"_medicine WHERE mid='"+request.getParameter("mid")+"'";                                        
			                            PreparedStatement statementqty = conn.prepareStatement(queryqty);
			                            ResultSet r = statementqty.executeQuery(queryqty);
			                            r.next();
			                            System.out.println("val :"+r.getString("qtyrem"));
			
			                            int stock_qty=Integer.parseInt(r.getString("qtyrem"));
			
			                            if(stock_qty>=Integer.parseInt(request.getParameter("qty")))
				                        {
				
				                            int diff = stock_qty - Integer.parseInt(request.getParameter("qty"));
				                            //oinserting into medicine table
				                            String query = "INSERT INTO "+bname+"cart VALUES ("+current_cust_billid+",'"+rmed.getString("mid")+"','"+rmed.getString("mname")+"','"+rmed.getString("mcname")+"','"+session.getAttribute("cname")+"',"+request.getParameter("qty")+","+rmed.getString("price")+",'"+session.getAttribute("docname")+"',"+strresult+",'"+curdate+"')";                                        
				                            PreparedStatement statement = conn.prepareStatement(query);
				                            statement.executeUpdate(query);
				                            System.out.println("Item added to cart successfully");
				                           
				                            
				                            //displaying cart
				                            String query2 = "select * from "+bname+"cart where billid="+current_cust_billid;
				                            PreparedStatement pst = conn.prepareStatement(query2);
				                            ResultSet rs2 = pst.executeQuery(); 
											
				    						System.out.println("fetched query");
				    					    
				    					    //cart
				    						out.println("<table border='1'cellpadding='10' style='border-collapse:collapse;margin-left:100px;'>");
				    						
				    					    out.println("<tr>");
				    					    
				    						out.println("<th>");
				    			            
				    						out.println("Billid");
				    			            out.println("</th>");
				    			            out.println("<th>");
				    						out.println("Mid");
				    			            out.println("</th>");
				    			            out.println("<th>");
				    			            out.println("Mname");
				    			            out.println("</th>");
				    			            out.println("<th>");
				    			            out.println("Cname");
				    			            out.println("</th>");
				    			            out.println("<th>");
				    			            out.println("Custname");
				    			            out.println("</th>");
				    			            out.println("<th>");
				    			            out.println("Qty");
				    			            out.println("</th>");
				    			            out.println("<th>");
				    			            out.println("Price");
				    			            out.println("</th>");
				    			            out.println("<th>");
				    			            out.println("Doctor Name");
				    			            out.println("</th>");
				    			            out.println("<th>");
				    			            out.println("Qty*Price");
				    			            out.println("</th>");
				    			            out.println("<th>");
				    			            out.println("Paiddate");
				    			            out.println("</th>");
				    			            
				    						
				    						while (rs2.next())
				    						{
				    							String billid = rs2.getString("billid");
				    							String mid = rs2.getString("mid");
				    				            String mname = rs2.getString("mname");
				    				            String cname = rs2.getString("cname");
				    				            String custname = rs2.getString("custname");
				    				            String qty = rs2.getString("qty");
				    				            String price = rs2.getString("price");
				    				            String docname = rs2.getString("docname");
				    				            String qtyprice = rs2.getString("qtyprice");
				    				            String paiddate = rs2.getString("paiddate");
				    				            
				    				            out.println("<tr>");
				    				            out.println("<td>");
				    				            out.println( billid + "<br>");
				    				            out.println("</td>");
				    				            out.println("<td>");
				    				            out.println( mid + "<br>");
				    				            out.println("</td>");
				    				            out.println("<td>");
				    				            out.println( mname + "<br>");
				    				            out.println("</td>");
				    				            out.println("<td>");
				    				            out.println( cname + "<br>");
				    				            out.println("</td>");
				    				            out.println("<td>");
				    				            out.println(custname + "<br>");
				    				            out.println("</td>");
				    				            out.println("<td>");
				    				            out.println(qty + "<br>");
				    				            out.println("</td>");
				    				            out.println("<td>");
				    				            out.println( price + "<br>");
				    				            out.println("</td>");
				    				            out.println("<td>");
				    				            out.println(docname + "<br>");
				    				            out.println("</td>");
				    				            out.println("<td>");
				    				            out.println(qtyprice + "<br>");
				    				            out.println("</td>");
				    				            out.println("<td>");
				    				            out.println(paiddate + "<br>");
				    				            out.println("</td>");
				    				            out.println("</tr>");
				    						}
				    					    out.println("</tr>");
				    					    out.println("</table>");
				    					    out.println("<br>");
				    					    out.println("<br>");
				                            
				                            
				                            //updating rem stock
				                             String query3 = "UPDATE "+bname+"_medicine SET qtyrem="+String.valueOf(diff)+" WHERE mid='"+request.getParameter("mid")+"'";
				                             PreparedStatement pst3 = conn.prepareStatement(query3);
				                             int rs3 = pst3.executeUpdate(); 
				
				                             
				    					    /////////////////////////////////
				                            //displaying branch' medicine table
				                            out.println("<h2 style='margin-left:120px;'> Display All Medicines available At This Branch</h2><br>"); 
				    					    String queryf = "select * from "+bname+"_medicine";
				                            PreparedStatement pstf = conn.prepareStatement(queryf);
				                            ResultSet rsf = pstf.executeQuery();
				                            
				                            //med table
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
								            
											
											while (rsf.next())
											{
												String mid = rsf.getString("mid");
									            String mname = rsf.getString("mname");
									            String mcname = rsf.getString("mcname");
									            String price = rsf.getString("price");
									            String expdate = rsf.getString("Expdate");
									            String mtype = rsf.getString("mtype");
									            String qtyrem = rsf.getString("qtyrem");
									            
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
										    out.println("<br>");
										    out.println("<br>");
									     }  
								 	
								 }
								 if(act.equals("Remove from Customer's Cart"))
								 {
									 session = request.getSession(false);
									 String current_cust_billid = ""+session.getAttribute("current_cust_billid");
									 String bname = (String)session.getAttribute("bname");
									 System.out.println("0");
									 out.println("<h2 style='margin-left:120px;'> Displaying current customer's cart</h2><br>"); 
									 
									   String queryqty =" SELECT qty FROM "+bname+"cart WHERE mid='"+request.getParameter("mid")+"'";                                        
	                                   PreparedStatement statementqty = conn.prepareStatement(queryqty);
	                                   ResultSet r = statementqty.executeQuery(queryqty);
	                                   System.out.println("1");
	                  					
	                                   r.next();
	                                   //System.out.println("val :"+r.getString("qty"));
	                                   int qty=Integer.parseInt(r.getString("qty"));
	                                   System.out.println("2");
	                                   
	                                   
	                                   //////

	                                   //updating remstock in medicine aftter deletion of an item
	                                    String query6 = "UPDATE "+bname+"_medicine SET qtyrem=qtyrem+"+String.valueOf(qty)+" WHERE mid='"+request.getParameter("mid")+"'";
	                                    PreparedStatement pst6 = conn.prepareStatement(query6);
	                                    int rs6 = pst6.executeUpdate(); 
	                                    System.out.println("3");
	                                   ///

	                                   String query3 = "DELETE FROM "+bname+"cart WHERE mid ='"+request.getParameter("mid")+"'";
	                                   PreparedStatement pst3 = conn.prepareStatement(query3);
	                                   int x = pst3.executeUpdate(); 
	                                   System.out.println("4");
	                                   //printing cart
	                                   String query4 = "select * from "+bname+"cart where billid="+current_cust_billid;
	                                   PreparedStatement pst4 = conn.prepareStatement(query4);
	                                   ResultSet rs4 = pst4.executeQuery();
	                                   System.out.println("5");
	                                 //displaying cart
			                            String query2 = "select * from "+bname+"cart where billid="+current_cust_billid;
			                            PreparedStatement pst = conn.prepareStatement(query2);
			                            ResultSet rs2 = pst.executeQuery(); 
										
			    						System.out.println("fetched query");
			    						System.out.println("6");
			    					    //cart
			    						out.println("<table border='1'cellpadding='10' style='border-collapse:collapse;margin-left:100px;'>");
			    						
			    					    out.println("<tr>");
			    					    
			    						out.println("<th>");
			    			            
			    						out.println("Billid");
			    			            out.println("</th>");
			    			            out.println("<th>");
			    						out.println("Mid");
			    			            out.println("</th>");
			    			            out.println("<th>");
			    			            out.println("Mname");
			    			            out.println("</th>");
			    			            out.println("<th>");
			    			            out.println("Cname");
			    			            out.println("</th>");
			    			            out.println("<th>");
			    			            out.println("Custname");
			    			            out.println("</th>");
			    			            out.println("<th>");
			    			            out.println("Qty");
			    			            out.println("</th>");
			    			            out.println("<th>");
			    			            out.println("Price");
			    			            out.println("</th>");
			    			            out.println("<th>");
			    			            out.println("Doctor Name");
			    			            out.println("</th>");
			    			            out.println("<th>");
			    			            out.println("Qty*Price");
			    			            out.println("</th>");
			    			            out.println("<th>");
			    			            out.println("Paiddate");
			    			            out.println("</th>");
			    			            
			    						
			    						while (rs2.next())
			    						{
			    							String billid = rs2.getString("billid");
			    							String mid = rs2.getString("mid");
			    				            String mname = rs2.getString("mname");
			    				            String cname = rs2.getString("cname");
			    				            String custname = rs2.getString("custname");
			    				            String qtyc = rs2.getString("qty");
			    				            String price = rs2.getString("price");
			    				            String docname = rs2.getString("docname");
			    				            String qtyprice = rs2.getString("qtyprice");
			    				            String paiddate = rs2.getString("paiddate");
			    				            
			    				            out.println("<tr>");
			    				            out.println("<td>");
			    				            out.println( billid + "<br>");
			    				            out.println("</td>");
			    				            out.println("<td>");
			    				            out.println( mid + "<br>");
			    				            out.println("</td>");
			    				            out.println("<td>");
			    				            out.println( mname + "<br>");
			    				            out.println("</td>");
			    				            out.println("<td>");
			    				            out.println( cname + "<br>");
			    				            out.println("</td>");
			    				            out.println("<td>");
			    				            out.println(custname + "<br>");
			    				            out.println("</td>");
			    				            out.println("<td>");
			    				            out.println(qtyc + "<br>");
			    				            out.println("</td>");
			    				            out.println("<td>");
			    				            out.println( price + "<br>");
			    				            out.println("</td>");
			    				            out.println("<td>");
			    				            out.println(docname + "<br>");
			    				            out.println("</td>");
			    				            out.println("<td>");
			    				            out.println(qtyprice + "<br>");
			    				            out.println("</td>");
			    				            out.println("<td>");
			    				            out.println(paiddate + "<br>");
			    				            out.println("</td>");
			    				            out.println("</tr>");
			    						}
			    					    out.println("</tr>");
			    					    out.println("</table>");
			    					    out.println("<br>");
			    					    out.println("<br>");
			
	                                                              

	                                    //printing medicine after update after deletion of a record
	                                   String queryf = "select * from "+bname+"_medicine";
	                                   PreparedStatement pstf = conn.prepareStatement(queryf);
	                                   ResultSet rsf = pstf.executeQuery(); 
	                                   out.println("<h2 style='margin-left:120px;'> Display All Medicines available At This Branch</h2><br>"); 
	                                 //med table
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
							            
										
										while (rsf.next())
										{
											String mid = rsf.getString("mid");
								            String mname = rsf.getString("mname");
								            String mcname = rsf.getString("mcname");
								            String price = rsf.getString("price");
								            String expdate = rsf.getString("Expdate");
								            String mtype = rsf.getString("mtype");
								            String qtyrem = rsf.getString("qtyrem");
								            
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
									    out.println("<br>");
									    out.println("<br>");
								     }  
	                            
					  }
					 catch(Exception e)
					 {
						 System.out.println(e);
					 }
					%>					
					
				</div>
				
			</td>
	</table>
		
		
	</body>
</html>