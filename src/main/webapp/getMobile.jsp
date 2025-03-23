
<%@page import="java.sql.*" %>
<%
int count=0;

String no="";
String mobile=request.getParameter("q");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/SSSDIIT","root","");

PreparedStatement p=c.prepareStatement("select name,fees,cource,sem,class,rollno  from member where mobile='"+mobile+"'");
ResultSet r=p.executeQuery();
	String name="";
	String fees="";
	String cource="";
	String sem="";
	String classs="";
	String rollno="";
	while(r.next())
	{
		cource=r.getString("cource");
		sem=r.getString("sem");
		classs=r.getString("class");
		rollno=r.getString("rollno");
		fees=r.getString("fees");
		name=r.getString("name");
		count++;
	}

	%>
	
	<span style="color:green;"><%=name %></span>&nbsp;&nbsp;<span style="color:green;"><%=cource %></span>&nbsp;&nbsp;<span style="color:green;"><%=sem %></span>
	&nbsp;&nbsp;<span style="color:green;"><%=classs %></span>
	&nbsp;&nbsp;<span style="color:green;"><%=rollno %></span>
	&nbsp;&nbsp;<span style="color:green;"><%=fees %></span>
	
	<%
	if(count==0)
{
	%>
	<span style="color:red;">Not Found!!</span>
	<%
}
	%>


