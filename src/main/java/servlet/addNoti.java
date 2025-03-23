package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



import java.io.IOException;
import java.sql.*;
@WebServlet("/addNoti")
public class addNoti extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String description=req.getParameter("description");
		String name=req.getParameter("name");

		
		try
		{
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
			if(name.equals("admin"))
			{
			PreparedStatement pd=c.prepareStatement("insert into notification(message) values('"+description+"')");
			int i=pd.executeUpdate();
			if(i>0)
			{
				HttpSession session=req.getSession();
				session.setAttribute("noti","ok");
				resp.sendRedirect("admin/notification.jsp");
			}
			else
			{
				System.out.print("Not send");
			}
			
			}
			if(name.equals("client"))
			{
				PreparedStatement pd=c.prepareStatement("insert into notification(message) values('"+description+"')");
				int i=pd.executeUpdate();
				if(i>0)
				{
					HttpSession session=req.getSession();
					session.setAttribute("noti","ok");
					resp.sendRedirect("notification.jsp");
				}
				else
				{
					System.out.print("not send");
				}
			}
			if(name.equals("lib"))
			{
				PreparedStatement pd=c.prepareStatement("insert into notification(message) values('"+description+"')");
				int i=pd.executeUpdate();
				if(i>0)
				{
					HttpSession session=req.getSession();
					session.setAttribute("noti","ok");
					resp.sendRedirect("libNoti.jsp");
				}
				else
				{
					System.out.print("not send");
				}
			}
					
			
		}catch(Exception e)
		{
			System.out.print(e);
			
		}
	}
}
