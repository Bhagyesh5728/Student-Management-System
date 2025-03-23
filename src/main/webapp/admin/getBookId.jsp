
<%@page import="java.sql.*" %>
<%
String book_id="";
String book_name=request.getParameter("q");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/SSSDIIT","root","");

PreparedStatement p=c.prepareStatement("select book_id  from books where book_name='"+book_name+"'");
ResultSet r=p.executeQuery();
while(r.next())
{
	book_id=r.getString("book_id");
}
	
%>
<%=book_id %>
