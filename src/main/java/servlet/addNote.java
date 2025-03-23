package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;
@WebServlet("/addNote")
public class addNote extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mo=req.getParameter("mobile");
		Long mobile=Long.parseLong(mo);
		String title=req.getParameter("title");
		String description=req.getParameter("description");
		String mob=req.getParameter("mo");
		String no=req.getParameter("no");
		
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
			if(no==null)
			{
			PreparedStatement pd=c.prepareStatement("insert into sticky_note(title,description,mobile) values(?,?,?)");
			pd.setString(1, title);
			pd.setString(2, description);
			pd.setLong(3, mobile);
			int i=pd.executeUpdate();
			
			if(i>0)
			{
				HttpSession session=req.getSession();
				session.setAttribute("addnote", "note");
				resp.sendRedirect("stickeynote.jsp");
			}
			}
			else
			{
				String id=req.getParameter("id");
				int ids=Integer.parseInt(id);
				PreparedStatement pd=c.prepareStatement("update sticky_note set title=?,description=? where mobile=? and id=?");
				pd.setString(1, title);
				pd.setString(2, description);
				pd.setLong(3, mobile);
				pd.setInt(4, ids);
				int i=pd.executeUpdate();
				
				if(i>0)
				{
					HttpSession session=req.getSession();
					session.setAttribute("updatenote", "note");
					resp.sendRedirect("stickeynote.jsp");
				}
			}
		
			
		}catch(Exception e)
		{
			System.out.print(e);
			
		}
	}
}
