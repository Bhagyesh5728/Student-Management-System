package servlet;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.sql.*;
@WebServlet("/login")
public class login extends HttpServlet{
int i;
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		 i=1;
	}
	

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mobile=req.getParameter("mobile");
		String pass=req.getParameter("pass");
		
System.out.print("Visitors:"+i++);
		
	try
	{
		
		HttpSession sessionlogin = req.getSession();
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
		PreparedStatement pd=c.prepareStatement("select login.mobile,login.pass,member.role  from login"
				+ " inner join member on login.mobile=member.mobile where login.mobile=? and login.pass=? ");
		pd.setString(1, mobile); 
		pd.setString(2, pass);
		
		String rol="";
		 
		ResultSet rs=pd.executeQuery();
		if(rs.next())
		{
	      String mo=rs.getString("mobile");
	      String pas=rs.getString("pass");
	      if(mo.equals(mobile) && pas.equals(pass))
	      {
	    	  rol=rs.getString("role");
	    	  System.out.print(rol);
	    	  
	      }
	      else
	      {
	    	  resp.sendRedirect("index.jsp");
	    	  System.out.print("no");
	      }
	      
		}
		else
		{
			HttpSession session=req.getSession();
			session.setAttribute("invalid", "invalid");
			 resp.sendRedirect("index.jsp");
			 
		}
		
        if(rol.equals("student"))
		{
			
			sessionlogin.setAttribute("log",mobile);
			resp.sendRedirect("studentdetail.jsp");
		}
        if(rol.equals("teacher"))
		{
        	sessionlogin.setAttribute("log",mobile);
			resp.sendRedirect("teacher.jsp");
			
		}
        if(rol.equals("hod"))
		{
//			RequestDispatcher r=req.getRequestDispatcher("hod.jsp");
//		r.forward(req, resp);	
			
		}
        if(rol.equals("librarian"))
		{

        	sessionlogin.setAttribute("log",mobile);
			resp.sendRedirect("librarian.jsp");
		}
		
		
		
	}catch(Exception e)
	
	{
		System.out.print(e);
	}
		
	}


		

}
