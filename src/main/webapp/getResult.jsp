

<%@page import="java.sql.*" %>
<%

String cource=request.getParameter("cource");
String sem=request.getParameter("sem");
String number=request.getParameter("number");


if(cource.equals("BCA") && sem.equals("1"))
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
	PreparedStatement p=c.prepareStatement("select result.mobile,result.c_language,result.mobile,networking,result.mobile,computer_fundamental,english,member.name,member.rollno,member.cource,member.sem,member.class from result inner join member on result.mobile=member.mobile where member.cource='"+cource+"' and member.sem='"+sem+"' and result.mobile='"+number+"'  ");
	ResultSet r=p.executeQuery();


%>

<%while(r.next())
{
	int clang=r.getInt("c_language");
	int net=r.getInt("networking");
	int e=r.getInt("networking");
	int cf=r.getInt("computer_fundamental");
	int total=clang+net+e+cf;
	float pr=(total/4);
	
			
 %>
 <table class="table border-0 star-student table-hover table-center mb-0 datatable table-striped" border="1">
<thead class="student-thread">
<tr>

<h4 style="text-decoration: underline; color: teal;"><div class="avatar">
<img class="avatar-img rounded-circle" alt="User Image" src="images/gurukul.png">
</div>SSSDIIT College Junagadh<div class="avatar">
<img class="avatar-img rounded-circle" alt="User Image" src="images/gurukul.png">
</div></h4>
<th style="width: 20px; background: white;">Name :</th><td style="width: 230px;"><%=r.getString("name") %></td>
<th style="width: 20px; background: white;">Cource:</th><td><%=r.getString("cource") %></td>
</tr>
<tr>
<th style="width: 20px; background: white;">Sem :</th><td><%=r.getString("sem") %></td>
<th style="width: 20px; background: white;">Class :</th><td ><%=r.getString("class") %></td>
<th style="width: 20px; background: white;">Rollno:</th><td><%=r.getString("rollno") %></td>
</tr>
<tr>
<th  style="width: 80px; background: white;">Programming in C</th><td><%=r.getInt("c_language") %></td>
<th  style="width: 20px; background: white;">Networking</th><td><%=r.getInt("networking") %></td>
</tr>
<tr>
<th  style="width: 20px; background: white;">Computer Fundaental</th><td><%=r.getInt("computer_fundamental") %></td>
<th  style="width: 20px; background: white;">Communication Skil</th><td><%=r.getInt("english") %></td>
</tr>
<tr>
<th style="width: 20px; background: white;">Total Marks :</th><td><%=total %></td>
<th style="width: 20px; background: white;">Perentage :</th><td><%=pr %></td>
</tr>
</thead>

</table>
<%}} 
	
if(cource.equals("BCA") && sem.equals("2"))
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
	PreparedStatement p=c.prepareStatement("select result.mobile,result.mobile,data_structure,result.mobile,maths,coa,php,member.name,member.rollno,member.cource,member.sem,member.class from result inner join member on result.mobile=member.mobile where member.cource='"+cource+"' and member.sem='"+sem+"' and result.mobile='"+number+"'  ");
	ResultSet r=p.executeQuery();


%>

<%while(r.next())
{
	int clang=r.getInt("data_structure");
	int net=r.getInt("maths");
	int e=r.getInt("coa");
	int cf=r.getInt("php");
	int total=clang+net+e+cf;
	float pr=(total/4);
	
			
 %>
 <table class="table border-0 star-student table-hover table-center mb-0 datatable table-striped" border="1">
<thead class="student-thread">
<tr>

<h4 style="text-decoration: underline; color: teal;"><div class="avatar">
<img class="avatar-img rounded-circle" alt="User Image" src="images/gurukul.png">
</div>SSSDIIT College Junagadh<div class="avatar">
<img class="avatar-img rounded-circle" alt="User Image" src="images/gurukul.png">
</div></h4>
<th style="width: 20px; background: white;">Name </th><td style="width: 230px;"><%=r.getString("name") %></td>
<th style="width: 20px; background: white;">Cource</th><td><%=r.getString("cource") %></td>
</tr>
<tr>
<th style="width: 20px; background: white;">Sem</th><td><%=r.getString("sem") %></td>
<th style="width: 20px; background: white;">Class</th><td ><%=r.getString("class") %></td>
<th style="width: 20px; background: white;">Rollno</th><td><%=r.getString("rollno") %></td>
</tr>
<tr>
<th  style="width: 80px; background: white;">Data Structure</th><td><%=r.getInt("data_structure") %></td>
<th  style="width: 20px; background: white;">COA</th><td><%=r.getInt("coa") %></td>
</tr>
<tr>
<th  style="width: 20px; background: white;">Maths</th><td><%=r.getInt("maths") %></td>
<th  style="width: 20px; background: white;">Php</th><td><%=r.getInt("php") %></td>
</tr>
<tr>
<th style="width: 20px; background: white;">Total Marks</th><td><%=total %></td>
<th style="width: 20px; background: white;">Perentage</th><td><%=pr %></td>
</tr>
</thead>

</table>
<%}} 

%>


