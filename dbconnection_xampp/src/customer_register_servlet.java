
import java.sql.*;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class customer_register_servlet
 */
@WebServlet("/customer_register_servlet")
public class customer_register_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public customer_register_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		
		String act = request.getParameter("action");
		System.out.println("act ="+act);
		
		
			 String url="jdbc:mysql://localhost:3306/final_dbmsmini";
			 String userName="root";
			 String password="";
			
			 try
			 {
					Class.forName("com.mysql.jdbc.Driver");
					java.sql.Connection conn=DriverManager.getConnection(url,userName,password);
					//out.println("<h1>Connection Success!</h1>");
					
					System.out.println("Connection Successfull");
					
					PrintWriter out = response.getWriter();
					response.setContentType("text/html");
					
					java.sql.Statement stmt=conn.createStatement();
					
					
						String query = "INSERT INTO cust_info VALUES (NULL,+'"+request.getParameter("name")+"','"+request.getParameter("email")+"','"+request.getParameter("mobile")+"','"+request.getParameter("username")+"','"+request.getParameter("password")+"','"+request.getParameter("cpassword")+"')";
						int i=stmt.executeUpdate(query);
						System.out.println("query executed");
						if (i<0)
						{
							out.println("Error");
							response.sendRedirect("customer_register.jsp");
						}
						else
						{
							System.out.println("Inserted successfully");
							response.sendRedirect("login.jsp");
						}
						
						
				
			 }
			 catch(Exception e)
			 {
				 System.out.println(e);
			 }
				
	
	}

}
