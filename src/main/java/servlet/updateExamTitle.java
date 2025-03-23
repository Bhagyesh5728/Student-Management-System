package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/updateExamTitle")
public class updateExamTitle extends HttpServlet {

		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			String title=req.getParameter("title");
		
			String sem=req.getParameter("sem");
			String cource=req.getParameter("cource");
			try
			{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
			
			PreparedStatement pd=c.prepareStatement("update result set exam_title=? where mobile in(select mobile from member where cource=? and sem=?)");
			pd.setString(1,title);
			pd.setString(2, cource);
			pd.setString(3, sem);
			int i=pd.executeUpdate();
			
			resp.sendRedirect("admin/resultSettings.jsp");
			
			
			}catch(Exception e)
			{
				System.out.print(e);
			}
		}
}
