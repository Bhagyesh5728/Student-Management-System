package servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/adminlog")
public class adminlog extends HttpServlet{



	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=req.getParameter("userName");
		String password=req.getParameter("password");
	
		
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
		PreparedStatement pd=c.prepareStatement("select * from admin where username=('"+username+"') and password=('"+password+"')");

		
		
		 
		ResultSet rs=pd.executeQuery();
		if(rs.first())
		{
				
				String unm=rs.getString("username");
				String pass=rs.getString("password");
				if(unm.equals(username) && pass.equals(password))
				{
					
					HttpSession session =req.getSession();
					session.setAttribute("admin","admin" );
					resp.sendRedirect("admin/main.jsp");
				}
				else
				{
					System.out.print("SQL Injection");
					resp.sendRedirect("admin/index.jsp");
					
				}
				
				
		}

		else
		{
			System.out.print("Invalid");
			resp.sendRedirect("admin/index.jsp");
		}
	}catch(Exception e)
	{
		System.out.print(e);
	}
	}

}
