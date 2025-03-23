package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/deletework")
public class deletework extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name=req.getParameter("name");
		String id=req.getParameter("id");
		
		try
		{
			if(name.equals("admin"))
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
				PreparedStatement pd2=c.prepareStatement("delete from work where id='"+id+"' ");
				pd2.executeUpdate();
				resp.sendRedirect("admin/workList.jsp");
				
			}
			if(name.equals("client"))
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
				PreparedStatement pd2=c.prepareStatement("delete from work where id='"+id+"' ");
				pd2.executeUpdate();
				resp.sendRedirect("workList.jsp");
			}
		}catch(Exception e)
		{
			System.out.print(e);
		}
		
	}
	
}
