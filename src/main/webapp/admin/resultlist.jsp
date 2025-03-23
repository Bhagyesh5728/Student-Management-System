<%
String updateresult=(String) session.getAttribute("updateresult");
if(updateresult!=null)
{
	out.print("<script>alert('Result Updated..')</script>");
	session.removeAttribute("updateresult");
}
%>
<!DOCTYPE html>
<%@page import="java.sql.PreparedStatement"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SSSDIIT MANAGMENT TOOL</title>
<link rel="shortcut icon" href="assets/img/icons/pngwing.com.png">



    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,400;0,500;0,700;0,900;1,400;1,500;1,700&amp;display=swap" rel="stylesheet">

<link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet" href="assets/plugins/feather/feather.css">

<link rel="stylesheet" href="assets/plugins/icons/flags/flags.css">

<link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
<link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

<!-- <link rel="stylesheet" href="assets/plugins/stickynote/sticky.css"> -->

<link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
	<%@page import="java.sql.*" %>
    <%@include file="sidebar-header.jsp" %>


<div class="page-wrapper">
<div class="content container-fluid">

<div class="page-header">
<div class="row">
<div class="col">
<h3 class="page-title">Result</h3>

</div>
</div>
</div>

<div class="row">
<div class="col-lg-12">
<div class="card">
<div class="card-header">
<h5 class="card-title">Result List</h5>
</div>
<div class="card-body">
<form action="resultlist.jsp" method="post">
<select name="cource">
<option>BCA</option>

</select>

<select name="sem">
<option>1</option>
<option>2</option>
</select>
<button name="submit" >Send</button>

</form>
<div>
<br>
<%
	String cource=request.getParameter("cource");
	String sem=request.getParameter("sem");
	
	if(cource!=null && sem!=null)
	{  
		if(cource.equals("BCA") && sem.equals("1"))
		{
			
		%>
		
<span ><table class="table table-bordered">
<thead>
<tr  >
<th width="150px;"> Name</th>
<th width="100px;">Mobile</th>
<th width="70px;">Cource</th>
<th width="70px;">Sem</th>
<th width="70px;">Exam</th>
<th width="150px;">Programmin In C</th>
<th width="90px;">Networking</th>
<th width="50px;">CF</th>
<th width="80px;">English</th>

<th>Actions</th>
</tr>
</thead>
<tbody>
		
		<%		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
		PreparedStatement pd=c.prepareStatement("select result.c_language,result.networking,result.computer_fundamental,result.english,result.exam_title,result.mobile,member.cource,member.sem,member.name from result inner join member on result.mobile=member.mobile where member.cource='"+cource+"' and member.sem='"+sem+"'");
		ResultSet rs=pd.executeQuery();
		
		while(rs.next()){
		
%>
	<tr class="m">
		<td><%=rs.getString("name") %></td>
		<td><%=rs.getLong("mobile") %></td>
		<td><%=rs.getString("cource") %></td>
		<td><%=rs.getString("sem")%></td>
		<td><%=rs.getString("exam_title") %></td>
		<td><%=rs.getInt("c_language") %></td>
		<td><%=rs.getInt("networking") %></td>
		<td><%=rs.getInt("computer_fundamental") %></td>
		<td><%=rs.getInt("english") %></td>
		<td><a href="updateResult.jsp?mo=<%=rs.getLong("mobile")%>&cource=<%=rs.getString("cource")%>&sem=<%=rs.getString("sem")%>">Update</a></td>
	</tr>
<%
		}
		
		}
		
	
	if(cource.equals("BCA") && sem.equals("2"))
	{
		%>
		<span id="bm"><table class="table table-bordered">
<thead>
<tr  >
<th width="150px;"> Name</th>
<th width="100px;">Mobile</th>
<th width="70px;">Cource</th>
<th width="70px;">Sem</th>
<th width="120px;">Exam</th>
<th width="80px;">DSA</th>
<th width="90px;">PHP</th>
<th width="60px;">maths</th>
<th width="80px;">seo</th>

<th>Actions</th>
</tr>
</thead>
<tbody>
		
		<%
	try
	{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
	PreparedStatement pd=c.prepareStatement("select result.data_structure,result.php,result.maths,result.coa,result.exam_title,result.mobile,member.cource,member.sem,member.name from result inner join member on result.mobile=member.mobile where member.cource='"+cource+"' and member.sem='"+sem+"'");
	ResultSet rs=pd.executeQuery();
	while(rs.next()){
	
%>

<tr class="m">
	<td><%=rs.getString("name") %></td>
	<td><%=rs.getLong("mobile") %></td>
	<td><%=rs.getString("cource") %></td>
	<td><%=rs.getString("sem") %></td>
	<td><%=rs.getString("exam_title") %></td>
	<td><%=rs.getInt("data_structure") %></td>
	<td><%=rs.getInt("php") %></td>
	<td><%=rs.getInt("maths") %></td>
	<td><%=rs.getInt("coa") %></td>
	<td><a href="updateResult.jsp?mo=<%=rs.getLong("mobile")%>&cource=<%=rs.getString("cource")%>&sem=<%=rs.getString("sem")%>">Update</a></td>
</tr>
<%
	}
	}catch(Exception e)
	{
		System.out.print(e);
	}
	}
	
	}

%>
</tbody>
</table>
</span>


</div>
<script src="assets/js/jquery-3.6.0.min.js"></script>

<script src="assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="assets/js/feather.min.js"></script>

<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- <script src="assets/plugins/apexchart/apexcharts.min.js"></script> -->
<!-- <script src="assets/plugins/apexchart/chart-data.js"></script> -->

<!-- <script src="assets/plugins/simple-calendar/jquery.simple-calendar.js"></script> -->
<!-- <script src="assets/js/calander.js"></script> -->
<!-- <script src="assets/plugins/stickynote/sticky.js"></script> -->

<script src="assets/js/circle-progress.min.js"></script>

<script src="assets/js/script.js"></script>

</body>
</html>