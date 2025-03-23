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

@WebServlet("/deleteNote")
public class deleteNote  extends HttpServlet{

	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String mo=req.getParameter("mo");
		String id=req.getParameter("id");
		Long mobile=Long.parseLong(mo);
		int i=Integer.parseInt(id);
		
		
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
			PreparedStatement pd=c.prepareStatement("delete from sticky_note where mobile=? and id=?");
			pd.setLong(1,mobile);
			pd.setInt(2, i);
			pd.executeUpdate();
		
			resp.sendRedirect("stickeynote.jsp");
			
		}catch(Exception e)
		{
			System.out.print(e);
		}
	}
}
