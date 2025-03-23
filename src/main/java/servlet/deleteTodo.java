package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
@WebServlet("/deleteTodo")
public class deleteTodo extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mo=req.getParameter("mo");
		String n=req.getParameter("id");
		int no=Integer.parseInt(n);
		long mobile=Long.parseLong(mo);
		
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
		PreparedStatement pd=c.prepareStatement("delete from todo_list where mobile=('"+mobile+"') AND id=?");
		pd.setInt(1, no);
		pd.executeUpdate();
		resp.sendRedirect("todolist.jsp");
		
	}catch(Exception e)
	{
		System.out.print(e);
	}
	}
}
