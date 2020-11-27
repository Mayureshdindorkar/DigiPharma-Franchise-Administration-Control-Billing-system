

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class printbill_servlet
 */
@WebServlet("/printbill_servlet")
public class printbill_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public printbill_servlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
		Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/final_dbmsmini","root","");
		Statement stmt = (Statement) conn.createStatement();
		
		System.out.println("DB Connection successfull");
		
		
		HttpSession session = request.getSession(false);
		
		String query11 = "Select bname from branchinfo where bid="+session.getAttribute("bid");
        PreparedStatement statement11= conn.prepareStatement(query11);
        ResultSet rr = statement11.executeQuery(query11);
        rr.next();
        //getting branchname
        String bname = rr.getString("bname");
         
        System.out.println("1");
        //inserting into akurdidetailedtran
        //String query = "INSERT INTO "+mybname+"detailedtran VALUES(SELECT billid,custname,docname,paiddate,sum(qtyprice) FROM "+mybname+"cart GROUP BY 'billid' HAVING billid="+strbillid+")";                                        
        //String query = "INSERT INTO "+mybname+"detailedtran SELECT billid,custname,docname,sum(qtyprice),paiddate FROM "+mybname+"cart WHERE billid="+strbillid; //local xampp
        String query = "INSERT INTO "+bname+"detailedtran(billid,totalqtyprice) SELECT billid,sum(qtyprice) FROM "+bname+"cart group by billid having billid="+session.getAttribute("current_cust_billid");
        PreparedStatement statement = conn.prepareStatement(query);
        statement.executeUpdate(query);
        System.out.println("2");
        
        String query1 = "select * from "+bname+"cart WHERE billid="+session.getAttribute("current_cust_billid");
        PreparedStatement pst1 = conn.prepareStatement(query1);
        ResultSet rs1 = pst1.executeQuery(); 
        rs1.next();
        System.out.println("paiddate :");
        String query_billnames = "UPDATE "+bname+"detailedtran SET custname='"+rs1.getString("custname")+"',docname='"+rs1.getString("docname")+"',paiddate='"+rs1.getString("paiddate")+"',cust_mobile="+session.getAttribute("cmob")+" WHERE billid="+session.getAttribute("current_cust_billid"); 
        PreparedStatement statementx = conn.prepareStatement(query_billnames);
        statementx.executeUpdate(query_billnames);
        System.out.println("3");
        
        
        System.out.println("inserted into detailedtran");
        
        response.sendRedirect("printbill.jsp");
		
		
		} catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
	}

}
