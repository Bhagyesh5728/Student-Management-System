package servlet;
import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@MultipartConfig
@WebServlet("/allocateBook")
public class allocateBook extends HttpServlet {

	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=req.getParameter("name");
		String mo=req.getParameter("mobile");
		Long mobile=Long.parseLong(mo);
		String book_id=req.getParameter("bookId");
		String book_name=req.getParameter("bookName");
		String takenDate=req.getParameter("takenDate");
		String returnDate=req.getParameter("returnDate");
		String namee=req.getParameter("name");
		try
		{
			if(namee.equals("client"))
			{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
			PreparedStatement pd2=c.prepareStatement("select book_id from library where mobile='"+mo+"' ");
			ResultSet r=pd2.executeQuery();
			String id="";
			while(r.next())
			{
				id=r.getString("book_id");
			}
			
			if(id.equals(book_id))
			{
				HttpSession session=req.getSession();
				session.setAttribute("bookexist", "exist");
				resp.sendRedirect("allocatebook.jsp");
				
			}
		
			else
				
			{	
				Connection c2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
				PreparedStatement pd3=c2.prepareStatement("select stock from books where book_id='"+book_id+"' ");
				ResultSet r2=pd3.executeQuery();
				int stock=0;
				while(r2.next())
				{
					stock=r2.getInt("stock");
				}
				if(stock==0)
				{
					
						HttpSession session=req.getSession();
						session.setAttribute("stock", "ok");
						resp.sendRedirect("allocatebook.jsp");
				}
				else
				{
					Connection c3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
					PreparedStatement pd=c3.prepareStatement("insert into library(mobile,book_id,book_name,taken_date,return_date) values(?,?,?,?,?)");
					pd.setLong(1,mobile);
					pd.setString(2, book_id);
					pd.setString(3, book_name);
					pd.setString(4, takenDate);
					pd.setString(5, returnDate);
			
					int i=pd.executeUpdate();
					if(i>0)
					{
					HttpSession session=req.getSession();
					session.setAttribute("bookallo", "ok");
					resp.sendRedirect("allocatebook.jsp");
					}
				}
				}
			}
			else
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
				PreparedStatement pd2=c.prepareStatement("select book_id from library where mobile='"+mo+"' ");
				ResultSet r=pd2.executeQuery();
				
				boolean flag=false;
				while(r.next())
				{
					if(book_id.equals(r.getString("book_id")))
					{
						flag=true;
					}
				}
				
				if(flag)
				{
					HttpSession session=req.getSession();
					session.setAttribute("bookexist", "exist");
					resp.sendRedirect("admin/allocatebook.jsp");
					
				}
			
				else
					
				{	
					Connection c2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
					PreparedStatement pd3=c2.prepareStatement("select stock from books where book_id='"+book_id+"' ");
					ResultSet r2=pd3.executeQuery();
					int stock=0;
					while(r2.next())
					{
						stock=r2.getInt("stock");
					}
					if(stock==0)
					{
						
							HttpSession session=req.getSession();
							session.setAttribute("stock", "ok");
							resp.sendRedirect("admin/allocatebook.jsp");
					}
					else
					{
						Connection c3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
						PreparedStatement pd=c3.prepareStatement("insert into library(mobile,book_id,book_name,taken_date,return_date) values(?,?,?,?,?)");
						pd.setLong(1,mobile);
						pd.setString(2, book_id);
						pd.setString(3, book_name);
						pd.setString(4, takenDate);
						pd.setString(5, returnDate);
				
						int i=pd.executeUpdate();
						if(i>0)
						{
						HttpSession session=req.getSession();
						session.setAttribute("bookallo", "ok");
						resp.sendRedirect("admin/allocatebook.jsp");
						}
					}
					}
			}
			
		}catch(Exception e)
		{
			System.out.print(e);
		}
		
	}
}
