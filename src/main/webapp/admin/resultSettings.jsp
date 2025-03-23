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
  	 <%
	String cource=request.getParameter("cource");
	String sem=request.getParameter("sem");
	String val="";
	if(cource!=null && sem!=null)
	{
		if(cource.equals("BCA") && sem.equals("1"))
		{
	
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/SSSDIIT","root","");
			PreparedStatement pd=c.prepareStatement("select exam_title from result where cource='"+cource+"' and sem='"+sem+"' limit 1");
			ResultSet rs=pd.executeQuery();
			while(rs.next())
				{
					val=rs.getString("exam_title");

				}
		}
		if(cource.equals("BCA") && sem.equals("1"))
		{
	
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/SSSDIIT","root","");
			PreparedStatement pd=c.prepareStatement("select exam_title from result where cource='"+cource+"' and sem='"+sem+"' limit 1");
			ResultSet rs=pd.executeQuery();
			while(rs.next())
				{
					val=rs.getString("exam_title");
				}
		}
		
	}

	%>
	

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
<h5 class="card-title">Result Settings</h5>
</div>
<div class="card-body">
<h5><b>Change Exam Title:</b></h5><br>
<form action="../updateExamTitle" method="post">

<select name="cource" >
<option value="BCA">BCA</option>
<option value="BSCIT">BSCIT</option>
</select>

<select name="sem">
<option value="1">1</option>
<option value="2">2</option>
</select>

<select name="title">
<option>MidTerm</option>
<option>Preliminary</option>
</select>

<button name="submit"  >Change Exam Title</button>
</form><br>

	
	

</div>
<script src="assets/js/jquery-3.6.0.min.js"></script>

<script src="assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="assets/js/feather.min.js"></script>

<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>


<script src="assets/js/circle-progress.min.js"></script>

<script src="assets/js/script.js"></script>


</body>
</html>