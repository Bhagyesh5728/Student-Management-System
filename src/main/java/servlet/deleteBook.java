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
import jakarta.servlet.http.HttpSession;
@WebServlet("/deleteBook")
public class deleteBook extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String id=req.getParameter("id");
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
			PreparedStatement pd=c.prepareStatement("delete from  books where id='"+id+"'");
			int i=pd.executeUpdate();
		
			if(i>0)
			{
				resp.sendRedirect("admin/booklist.jsp");
	
			}
		
			
		}catch(Exception e)
		{
			System.out.print(e);
		}
	}

	
}
