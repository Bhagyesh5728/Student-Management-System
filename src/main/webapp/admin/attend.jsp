<%@page import="java.sql.*" %>
<%
String rollno=request.getParameter("q");
String cource=request.getParameter("cource");
String sem=request.getParameter("sem");
String classs=request.getParameter("class");
String date=request.getParameter("date");
String s="";
String b="";


Class.forName("com.mysql.cj.jdbc.Driver");
Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
PreparedStatement p=c.prepareStatement("select * from attendance where cource='"+cource+"' and sem='"+sem+"' and class='"+classs+"' and rollno='"+rollno+"' and datee='"+date+"' ");
ResultSet r=p.executeQuery();
if(r.next())
{
	%>
	<span style="color:white; background: red; border-radius: 10px;">Attendance is allready taken for rollno <span style="background: blue; padding: 3px; border-radius: 10px;"><%=rollno %></span></span>
	
	<%
}
else
{
	PreparedStatement pd=c.prepareStatement("insert into attendance(cource,sem,class,rollno,datee,status) values(?,?,?,?,?,?)");
	pd.setString(1,cource);
	pd.setString(2,sem);
	pd.setString(3, classs);
	pd.setString(4, rollno);
	pd.setString(5,date);
	pd.setString(6, "1");
	int i=pd.executeUpdate();
	if(i>0)
	{
		%>
		<span style="color:white; background: green; border-radius: 10px;">Attendance taken successfully!! for rollno <span style="background: blue; padding: 3px; border-radius: 10px;"><%=rollno %></span></span>

		<%
	}
	
}
%>



