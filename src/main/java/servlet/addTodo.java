package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;
@WebServlet("/addTodo")
public class addTodo extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String name=req.getParameter("name");
		String date=req.getParameter("date");
		String startTime=req.getParameter("startTime");
		String endTime=req.getParameter("endTime");
		String status=req.getParameter("status");
		String mo=req.getParameter("mobile");
		Long mobile=Long.parseLong(mo);

		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
			PreparedStatement pd=c.prepareStatement("insert into todo_list(name,date,start_time,end_time,status,mobile) values(?,?,?,?,?,?)");
			pd.setString(1, name);
			pd.setString(2, date);
			pd.setString(3, startTime);
			pd.setString(4, endTime);
			pd.setString(5, status);
			pd.setLong(6, mobile);
	
			pd.executeUpdate();
			HttpSession session=req.getSession();
			session.setAttribute("todo", "todo");
			resp.sendRedirect("todolist.jsp");
			
		}catch(Exception e)
		{
			System.out.print(e);
			
		}
	}

}
