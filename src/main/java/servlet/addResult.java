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
@WebServlet("/addResult")
public class addResult  extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String mobile=req.getParameter("mobile");
		String sem=req.getParameter("sem");
		String cource=req.getParameter("cource");
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
			if(sem.equals("1") && cource.equals("BCA") )
			{
				String clag=req.getParameter("clang");
				String cf=req.getParameter("cf");
				String english=req.getParameter("eng");
				String net=req.getParameter("net");
				PreparedStatement pd=c.prepareStatement("update result set c_language='"+clag+"',computer_fundamental='"+cf+"',networking='"+net+"',english='"+english+"' where mobile='"+mobile+"' ");
				pd.executeUpdate();
				HttpSession session=req.getSession();
				session.setAttribute("updateresult", "ok");
				resp.sendRedirect("admin/resultlist.jsp");
			}
			if(sem.equals("2") && cource.equals("BCA") )
			{
				String ds=req.getParameter("ds");
				String maths=req.getParameter("maths");
				String coa=req.getParameter("coa");
				String php=req.getParameter("php");
				PreparedStatement pd=c.prepareStatement("update result set data_structure='"+ds+"', maths='"+maths+"', php='"+php+"', coa='"+coa+"' where mobile='"+mobile+"' ");
				pd.executeUpdate();
				HttpSession session=req.getSession();
				session.setAttribute("updateresult", "ok");
				resp.sendRedirect("admin/resultlist.jsp");
			}
		}
		catch(Exception e)
		{
			System.out.print(e);
		}
		
	}
}
