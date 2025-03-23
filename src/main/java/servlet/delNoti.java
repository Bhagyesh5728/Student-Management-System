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
@WebServlet("/delNoti")
public class delNoti extends HttpServlet {
	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		String id=req.getParameter("id");
	
		String name=req.getParameter("name");

	
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
		
		if(name.equals("admin"))
		{
			PreparedStatement pd=c.prepareStatement("delete from notification where id='"+id+"' ");
			int cb=pd.executeUpdate();
			if(cb>0)
			{

			resp.sendRedirect("admin/listnoti.jsp");
			}
			else
			{
			System.out.print("no delete");
			}
		}
		if(name.equals("client"))
		{
			PreparedStatement pd=c.prepareStatement("delete from notification where id='"+id+"' ");
			int cb=pd.executeUpdate();
			if(cb>0)
			{

			resp.sendRedirect("listnoti.jsp");
			}
			else
			{
			System.out.print("no delete");
			}
	
		}
		if(name.equals("lib"))
		{
			PreparedStatement pd=c.prepareStatement("delete from notification where id='"+id+"' ");
			int cb=pd.executeUpdate();
			if(cb>0)
			{

			resp.sendRedirect("libNotiList.jsp");
			}
			else
			{
			System.out.print("no delete");
			}
	
		}
		
		}
		catch(Exception e)
		{
			System.out.print(e);
		}
		
	
	}
}
