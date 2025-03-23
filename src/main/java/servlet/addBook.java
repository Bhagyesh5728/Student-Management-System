package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/addBook")
public class addBook extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String idd=req.getParameter("id");
		
		String bookid=req.getParameter("bookid");
		String bookname=req.getParameter("bookname");
		String stock=req.getParameter("stock");
		String name=req.getParameter("name");
		int st=Integer.parseInt(stock);
		System.out.print(name);
		
		try
		{
			
			if(name.equals("client"))
			{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
			if(idd==null)
			{
			PreparedStatement pd=c.prepareStatement("insert into books(book_id,book_name,stock) values(?,?,?)");
			pd.setString(1, bookid);
			pd.setString(2, bookname);
			pd.setInt(3, st);
			
			int i=pd.executeUpdate();
			if(i>0)
			{
				HttpSession session=req.getSession();
				session.setAttribute("bookadd", "ok");
				resp.sendRedirect("booklist.jsp");
	
			}
			}
			else
			{
				int id=Integer.parseInt(idd);
				PreparedStatement pd=c.prepareStatement("update books set book_id=?,book_name=?, stock=? where id=?");
				pd.setString(1, bookid);
				pd.setString(2, bookname);
				pd.setInt(3, st);
				pd.setInt(4, id);
				int i=pd.executeUpdate();
				if(i>0)
				{
					HttpSession session=req.getSession();
					session.setAttribute("bookupdate", "ok");
					resp.sendRedirect("booklist.jsp");
		
				}
			}
			}
			if(name.equals("admin"))
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
				if(idd==null)
				{
				PreparedStatement pd=c.prepareStatement("insert into books(book_id,book_name,stock) values(?,?,?)");
				pd.setString(1, bookid);
				pd.setString(2, bookname);
				pd.setInt(3, st);
				
				int i=pd.executeUpdate();
				if(i>0)
				{
					HttpSession session=req.getSession();
					session.setAttribute("bookadd", "ok");
					resp.sendRedirect("admin/booklist.jsp");
		
				}
				}
				else
				{
					int id=Integer.parseInt(idd);
					PreparedStatement pd=c.prepareStatement("update books set book_id=?,book_name=?, stock=? where id=?");
					pd.setString(1, bookid);
					pd.setString(2, bookname);
					pd.setInt(3, st);
					pd.setInt(4, id);
					int i=pd.executeUpdate();
					if(i>0)
					{
						HttpSession session=req.getSession();
						session.setAttribute("bookupdate", "ok");
						resp.sendRedirect("admin/booklist.jsp");
			
					}
				}
			}
						
		}catch(Exception e)
		{
			System.out.print(e);
		}
	}
}
