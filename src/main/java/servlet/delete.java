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
@WebServlet("/delete")
public class delete extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mo=req.getParameter("id");
		long mobile=Long.parseLong(mo);
		String name=req.getParameter("name");
		try
		{
		if(name.equals("student"))
		{
		
	
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
		PreparedStatement pd=c.prepareStatement("delete from member where mobile=('"+mobile+"')");
		pd.executeUpdate();
		resp.sendRedirect("admin/liststud.jsp");
	
		}
		if(name.equals("teacher"))
		{
		
	
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
		PreparedStatement pd=c.prepareStatement("delete from member where mobile=('"+mobile+"')");
		pd.executeUpdate();
		resp.sendRedirect("admin/teacherList.jsp");

	
		}
		if(name.equals("librarian"))
		{
		
	
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
		PreparedStatement pd=c.prepareStatement("delete from member where mobile=('"+mobile+"')");
		pd.executeUpdate();
		resp.sendRedirect("admin/listLib.jsp");
	
		}
		}catch(Exception e)
		{
			System.out.print(e);
		}
		}
	

	
}
