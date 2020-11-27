

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.*;


@WebServlet("/login_servlet")
public class login_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public login_servlet() 
    {
        super();
     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try
		{
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/final_dbmsmini","root","");
			Statement stm = (Statement) conn.createStatement();
			
			System.out.println("DB Connection successfull");
			
			
			
			if(request.getParameter("formname").equals("admin_login"))
			{
					String uname = request.getParameter("admin_uname");
					String pass = request.getParameter("admin_pass");
					System.out.println("uname :"+uname+" Password : "+pass);
					
					String query = "SELECT * FROM adminloginpass WHERE username=? AND password=?";
					PreparedStatement st = (PreparedStatement) conn.prepareStatement(query);
					st.setString(1, uname);
					st.setString(2, pass);
					ResultSet rs = st.executeQuery();
					
					if(rs.next())
					{
						HttpSession session = request.getSession();
						session.setAttribute("admin_name", uname);
						response.sendRedirect("admin_operations.jsp");
							
					
					}
					else
					{
						System.out.println("admin login failed");
						response.sendRedirect("login.jsp");
					}
			
			}
			else if(request.getParameter("formname").equals("emp_login"))
			{
				String empid = request.getParameter("empid");
				String bid = request.getParameter("branchid");
				
				
				String query = "SELECT eid,ebid FROM empinfo WHERE eid=? AND ebid=?";
				PreparedStatement st = (PreparedStatement) conn.prepareStatement(query);
				st.setString(1, empid);
				st.setString(2, bid);
				ResultSet rs = st.executeQuery();
				System.out.println("rs success");
				
				if(rs.next())
				{
					HttpSession session = request.getSession();
					session.setAttribute("empid", empid);
					session.setAttribute("bid", bid);
					
					
					ResultSet rsx=stm.executeQuery("SELECT bname FROM branchinfo WHERE bid="+bid);
					System.out.println("rsx success");
					rsx.next();
					String bname = rsx.getString("bname");
					session.setAttribute("bname", bname);
					
					System.out.println("reached here");
					
					response.sendRedirect("emp_opreations.jsp");
				}
				else
				{
					System.out.println("emp login failed");
					response.sendRedirect("login.jsp");
					
				}
			
			}
			else if(request.getParameter("formname").equals("cust_login"))
			{
				String uname = request.getParameter("cust_uname");
				String pass = request.getParameter("cust_pass");
				
				String query = "SELECT * FROM cust_info WHERE username=? AND password=?";
				PreparedStatement st = (PreparedStatement) conn.prepareStatement(query);
				st.setString(1, uname);
				st.setString(2, pass);
				ResultSet rs = st.executeQuery();
				
				if(rs.next())
				{
					HttpSession session = request.getSession();
					session.setAttribute("cust_name", uname);
					response.sendRedirect("customer_operations.jsp");
				}
				else
				{
					System.out.println("cust login failed");
					response.sendRedirect("login.jsp");
				}
			
			}
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}

}
