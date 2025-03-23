package servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/register")
public class register extends HttpServlet  {

	


	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		String mo=req.getParameter("mobile");
		Long mobile1=Long.parseLong(mo);
		String pass1=req.getParameter("pass1");
		String pass2=req.getParameter("pass2");
		Long mob;
//		long mobile=Long.parseLong("mo");
		try 
		{
			PreparedStatement pd,pd0,pd3,pd1;
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/SSSDIIT","root","");
			pd=c.prepareStatement("select * from member where mobile=?");
			pd.setLong(1, mobile1);
			ResultSet rs=pd.executeQuery();
			
			
			if(rs.next())
			{
				
					
					if(pass1.equals(pass2))
					{
						pd0=c.prepareStatement("select * from login where mobile=?");
						pd0.setLong(1, mobile1);
						ResultSet rs0=pd0.executeQuery();
							if(rs0.next())
							{
								
								HttpSession session=req.getSession();
								session.setAttribute("exist", "allread_exist");
								resp.sendRedirect("index.jsp");
								
							}
							else
							{
								CallableStatement cs=c.prepareCall("{call login(?,?)}");
								cs.setLong(1, mobile1);
								cs.setString(2, pass2);
								
								cs.execute();
								HttpSession session=req.getSession();
								session.setAttribute("register","ok");
								RequestDispatcher rd=req.getRequestDispatcher("/index.jsp");
								rd.forward(req, resp);
							}
					}
					else
					{
						
						HttpSession session=req.getSession();
						session.setAttribute("passmatch", "no");
						resp.sendRedirect("register.jsp");	
					}
				
			}
			else
			{
				
				HttpSession session=req.getSession();
				session.setAttribute("notstud", "no");
				resp.sendRedirect("register.jsp");	
				
			}
		}
		catch(Exception e) {System.out.print(e);}

	}
}

