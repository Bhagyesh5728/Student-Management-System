package servlet;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/update")
public class update extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email=req.getParameter("email");
		String mobile=req.getParameter("mobile");

		String stream=req.getParameter("cource");
		String sem=req.getParameter("sem");
		String classs=req.getParameter("class");
		String rollnumber=req.getParameter("rollno");
		String address=req.getParameter("address");
		String name=req.getParameter("name");
		String fee=req.getParameter("fees");
		long mo=Long.parseLong(mobile);
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
//			CallableStatement cb=c.prepareCall("{call updateStud(?,?,?,?,?,?,?,?,?,?)}");
//			cb.setString(1, name);
//
//			cb.setString(2, email);
//			cb.setString(3, stream);
//			cb.setString(4, role);
//			cb.setString(5, sem);
//			cb.setString(6, classs);
//			cb.setString(7, rollnumber);
//			cb.setString(8, address);
//			cb.setString(9, fee);
//			cb.setLong(10, mo);
//			cb.execute();
//			resp.sendRedirect("admin/liststud.jsp");
			PreparedStatement cb=c.prepareStatement("update member set name=?, email=?, cource=?, sem=?, class=?,rollno=?,address=?, fees=? where mobile=?");
			            cb.setString(1, name);
						cb.setString(2, email);
						cb.setString(3, stream);
			
						cb.setString(4, sem);
						cb.setString(5, classs);
						cb.setString(6, rollnumber);
						cb.setString(7, address);
						cb.setString(8, fee);
						cb.setLong(9, mo);
						cb.executeUpdate();
						resp.sendRedirect("admin/liststud.jsp");
		}catch(Exception e)
		{
			System.out.print(e);
		}

	}

}
