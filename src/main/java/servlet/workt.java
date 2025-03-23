package servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
@MultipartConfig
@WebServlet("/workt")
public class workt extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String sname=req.getParameter("sname");
		String cource=req.getParameter("cource");
		String sem=req.getParameter("sem");
		String classs=req.getParameter("class");
		String date=req.getParameter("submitDate");
		
		Part image=req.getPart("work");	
		String imagename=image.getSubmittedFileName();
		String UploadPath="D:\\eclipse\\SSSDIIT-MANAGMENT\\src\\main\\webapp\\documents\\"+imagename;

		
			try {
				FileOutputStream fos=new FileOutputStream(UploadPath);
				InputStream is=image.getInputStream();
				
				byte[] data=new byte[is.available()];
				is.read(data);
				fos.write(data);
				fos.close();
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
				PreparedStatement pd=c.prepareStatement("insert into work(subject_name,work_detail,submit_date,cource,sem,class) values(?,?,?,?,?,?)");
				pd.setString(1, sname);
				pd.setString(2, imagename);
				pd.setString(3,date );
				pd.setString(4, cource);
				pd.setString(5, sem);
				pd.setString(6, classs);
				pd.executeUpdate();
				HttpSession session=req.getSession();
				session.setAttribute("work", "ok");
				resp.sendRedirect("giveWork.jsp");
			}
			catch(Exception e)
			{
				System.out.print(e);
			}
	}

	
	
} 
