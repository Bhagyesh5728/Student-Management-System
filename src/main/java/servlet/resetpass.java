package servlet;
import java.io.IOException;
import java.sql.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/reset")
public class resetpass extends HttpServlet{

	

	@Override
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		String oldpass=req.getParameter("oldpass");
		String newpass=req.getParameter("newpass");
		String confpass=req.getParameter("confpass");
		String mobile=req.getParameter("mobile");
		
		
		if(newpass.equals(confpass))
		{
			try 
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/SSSDIIT","root","");
				PreparedStatement pd=c.prepareStatement("select pass from login where mobile='"+mobile+"' ");
				ResultSet rs=pd.executeQuery();
				if(rs.next())
				{
					PreparedStatement pd1=c.prepareStatement("update login set pass='"+confpass+"' where pass='"+oldpass+"' and mobile='"+mobile+"'");
					pd1.executeUpdate();
					resp.sendRedirect("profile.jsp");
				
				}
				else
				{
					System.out.print("Not Update");
				
				}
			}catch(Exception e)
			{
				System.out.print(e);
			}
		}
		else
		{
			System.out.print("same nathi");
			
		}
	}

}
