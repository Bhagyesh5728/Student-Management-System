package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/delIssueBook")
public class delIssueBook extends HttpServlet {
	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		String book_id=req.getParameter("id");
		String mobile=req.getParameter("mo");
		String name=req.getParameter("name");

	
		
		
		try
		{
		
		if(name.equals("admin"))
		{

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
			PreparedStatement pd=c.prepareStatement("delete from library where book_id='"+book_id+"' and mobile='"+mobile+"' ");
			int cb=pd.executeUpdate();
			if(cb>0)
			{
			PreparedStatement pd3=c.prepareStatement("select stock from books where book_id='"+book_id+"'");
			ResultSet r=pd3.executeQuery();
			int stock=0;
			
			while(r.next())
			{
			 stock=r.getInt("stock")+1;
			}
			System.out.print(stock);
			PreparedStatement pd2=c.prepareStatement("update books set stock='"+stock+"' where book_id='"+book_id+"' ");
			int b=pd2.executeUpdate();
			
			resp.sendRedirect("admin/allocateBookList.jsp");
			}
			else
			{
			System.out.print("no delete");
			}
		}
		if(name.equals("client"))
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
			PreparedStatement pd=c.prepareStatement("delete from library where book_id='"+book_id+"' and mobile='"+mobile+"' ");
			int cb=pd.executeUpdate();
			if(cb>0)
			{
			PreparedStatement pd3=c.prepareStatement("select stock from books where book_id='"+book_id+"'");
			ResultSet r=pd3.executeQuery();
			int stock=0;
			
			while(r.next())
			{
			 stock=r.getInt("stock")+1;
			}
			System.out.print(stock);
			PreparedStatement pd2=c.prepareStatement("update books set stock='"+stock+"' where book_id='"+book_id+"' ");
			int b=pd2.executeUpdate();
			
			resp.sendRedirect("allocateBookList.jsp");
			}
			else
			{
			System.out.print("no delete");
			}
		}
		}
		catch(Exception e)
		{
			System.out.print(e);
		}
		
	}

}
