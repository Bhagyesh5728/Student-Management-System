package servlet;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import jakarta.servlet.http.*;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@MultipartConfig
@WebServlet("/addTeacher")

public class addTeacher extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	String firstname=req.getParameter("firstname");
	String middlename=req.getParameter("middlename");
	String lastname=req.getParameter("lastname");
	String email=req.getParameter("email");
	String mo=req.getParameter("mobile");
	long mobile=Long.parseLong(mo);
	String role=req.getParameter("role");
	
	String address=req.getParameter("address");
	String name=firstname+" "+middlename+" "+lastname;

		
		
	Part image=req.getPart("photo");	
	String imagename=image.getSubmittedFileName();
	String UploadPath="D:\\eclipse\\SSSDIIT-MANAGMENT\\src\\main\\webapp\\images\\"+imagename;

	resp.setContentType("text/html");
	PrintWriter out=resp.getWriter();
		try {
			
			FileOutputStream fos=new FileOutputStream(UploadPath);
			InputStream is=image.getInputStream();
			
			byte[] data=new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
			CallableStatement cb=c.prepareCall("{call addTeacher(?,?,?,?,?,?)}");
			cb.setString(1, name);
			cb.setString(2,email);
			cb.setString(3,role);
			cb.setString(4, address);
			cb.setLong(5, mobile);
			cb.setString(6,imagename);
			
			cb.execute();
			HttpSession session =req.getSession();
			session.setAttribute("teacher", "ok");
			
			resp.sendRedirect("admin/addTeacher.jsp");
			
		}catch(Exception e)
		{

			out.print("Duplicate Mobile Entry");
		}
	}

}
