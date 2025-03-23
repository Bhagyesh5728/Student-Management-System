package servlet;
import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/editTodo")
public class editTodo extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String m=req.getParameter("mobile");
		String n=req.getParameter("no");
		Long mo=Long.parseLong(m);
		int no=Integer.parseInt(n);
		String status=req.getParameter("status");
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
			PreparedStatement pd1=c.prepareStatement("update todo_list set status='"+status+"' where mobile=? and id=?");
			pd1.setLong(1,mo);
			pd1.setInt(2, no);
			int i=pd1.executeUpdate();
			
			if(i>0)
			{
			HttpSession session=req.getSession();
			session.setAttribute("updatetodo", "ok");
			resp.sendRedirect("todolist.jsp");
			}
		
		}catch(Exception e)
		{
			System.out.print(e);
		}
		
	}
	
}
