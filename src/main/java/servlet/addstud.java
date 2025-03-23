package servlet;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import jakarta.servlet.http.*;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
@MultipartConfig
@WebServlet("/addStud")

public class addstud extends HttpServlet {
	
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
	String stream=req.getParameter("stream");
	String sem=req.getParameter("sem");
	String classs=req.getParameter("class");
	String rollnumber=req.getParameter("rollnumber");
	String address=req.getParameter("address");
	String name=firstname+" "+middlename+" "+lastname;
	String fee=req.getParameter("fees");
		
		
	Part image=req.getPart("photo");	
	String imagename=image.getSubmittedFileName();
	String UploadPath="D:\\eclipse\\SSSDIIT-MANAGMENT\\src\\main\\webapp\\images\\"+imagename;

	
		try {
			FileOutputStream fos=new FileOutputStream(UploadPath);
			InputStream is=image.getInputStream();
			
			byte[] data=new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
			CallableStatement cb=c.prepareCall("{call addStud(?,?,?,?,?,?,?,?,?,?,?)}");
			cb.setString(1, name);
			cb.setString(2,email);
			cb.setString(3, stream);
			cb.setString(4,role);
			cb.setString(5, sem);
			cb.setString(6, classs);
			cb.setString(7, rollnumber);
			cb.setString(8, address);
			cb.setString(9, fee);
			cb.setLong(10, mobile);
			cb.setString(11,imagename);
			
			cb.execute();
			resp.sendRedirect("admin/addstud.jsp");
			
		}catch(Exception e)
		{
			System.out.print(e);
		}
	}

}
