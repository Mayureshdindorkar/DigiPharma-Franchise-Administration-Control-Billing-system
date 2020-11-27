<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.*,java.util.HashMap,java.util.Iterator,java.util.Map,java.util.Set,java.util.Random " %>
        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>Bill Receipt</title>
	<link rel="stylesheet" href="admin_operations.css">
	
		<script type="text/JavaScript">
			function genPDF()
			{
				//alert("hello");

				var divcontent = document.getElementById("billarea").innerHTML;
				var a = window.open('','','height=500,width=500');
				a.document.write('<html>');
				a.document.write('<body>');
				a.document.write('<h1>Bill</h1>');
				a.document.write(divcontent);
				a.document.write('</body>');
				a.document.write('</html>');
				a.print();
			}			

		</script>
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/additional-methods.js"></script>
		<script src="login_validate.js"></script>
	</head>

	<body>
		
		<table style="margin-left:400px;">
		<tr>
			<td width=600px>
				<h2>Print Bill Receipt</h2>		
			</td>
			<td style="padding-left:600px;">
				<h4>Welcome Employee : ${emp_id}</h4>	
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
		<img alt="Logo is absent" src="logo.jpg" width=100px height=100px style="margin-left:30px;">
		</td>
		</tr>
		</table>
		  <br>
		  <br>
		  	<a href="#">Select operation that you want to perform : </a>
		  <br>
		  <a href="emp_place_order.jsp">1) Place Customer's Order</a>
		  <br>
		  <a href="send_stock_refill_notifications.jsp">2) Send Stock Refill Notifications to Admin</a>
		</div>
		
		<div class="main">
			<table>
				<tr>
					<td>
						
						<br>
						<input type="button" value="Download Bill" onclick="genPDF()">		
					</td>
					<td>
						<div style="margin-left:100px;" id="billarea">
						
						<%
						try
				        {
				            Class.forName("com.mysql.jdbc.Driver");
				            Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/final_dbmsmini?serverTimezone=UTC","root",""); 
				            //Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://remotemysql.com:3306/PKtn72VEk8","PKtn72VEk8","HeBPDnSQcl");  //for remote Mysql
				            
				            String current_cust_billid = ""+session.getAttribute("current_cust_billid");
								 
							String bname = ""+session.getAttribute("bname");
				            
				            String query11 = "Select * from "+bname+"cart"+" where billid="+current_cust_billid;
				            PreparedStatement statement11= con.prepareStatement(query11);
				            ResultSet rr = statement11.executeQuery(query11);
				            rr.next();
				            
				            //getting branchname
				            String custname=String.format(rr.getString("custname"));
				            //billid
				            String docname =String.format(rr.getString("docname"));
				            String paiddate  =String.format(rr.getString("paiddate"));
				            
				            float totalamt=0;
				            out.append("\t ********** SANGITA MEDICALS **********\t<br><br>");
				            out.append("\t ********** RECEIPT FOR PHARMACEUTICAL PURCHAES **********\t<br>"+" Name                  : "+custname+"<br>"+" Doctor Name           : "+docname+"<br>"+" Date                  : "+paiddate+"<br>"+" Bill ID               : "+current_cust_billid+"<br>"+" Branch Name           : "+bname+"<br>");
				            do
				            {
				               out.append("<br><br> Medicine ID           : "+rr.getString("mid")+"<br>");
				               out.append(" Medicine Name         : "+rr.getString("mname")+"<br>");
				               out.append(" Quantity              : "+rr.getString("qty")+"<br>");
				               out.append(" Price                 : "+rr.getString("price")+"<br>");
				               out.append(" Qty*Price             : "+rr.getString("qtyprice")+"<br>");
				               totalamt=totalamt+Float.parseFloat(rr.getString("qtyprice"));
				            }while(rr.next());
				            
				            out.append("<br> Total Amount          : "+totalamt+"<br>");
				            out.append("************ THANK YOU !!!! VISIT AGAIN **********<br>");
				            
				            //trumcating cart
				            String query3 ="TRUNCATE TABLE "+bname+"cart ";
				            PreparedStatement statement3= con.prepareStatement(query3);
				            int x= statement3.executeUpdate(query3);
				            
				           
				         } catch (Exception e) {
				          System.out.println(e);
				        } 
						
						%>
						
						</div>
					</td>
				</tr>
			</table>
		  	
		</div>	
				   
	</body>
</html>