


<!DOCTYPE html>
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
	<%@ page import="java.sql.*" %>
    <%@include file="sidebar-header.jsp" %>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
	PreparedStatement pd2=c.prepareStatement("select library.*, member.name,member.class,member.cource,member.sem,member.rollno from library inner join member on library.mobile=member.mobile");
	ResultSet rs2=pd2.executeQuery();

%>

<div class="page-wrapper">
<div class="content container-fluid">

<div class="page-header">
<div class="row">
<div class="col">
<h3 class="page-title">Library</h3>
<ul class="breadcrumb">

</ul>
</div>
</div>
</div>

<div class="row">

<div class="col-md-12">
<div class="card">
<div class="card-header">
<h5 class="card-title">Issue Book List</h5>
</div>
<div class="card-body">
<div class="sticky-note" id="board">
    
<div class="table-responsive">
<table class="table border-0 star-student table-hover table-center mb-0 datatable table-striped">
<thead class="student-thread">
<tr>

<th>Book Name</th>
<th>Book ID</th>
<th>Taken Date</th>
<th>Return Date</th>
<th>Student Mobile</th>
<th>Student Name</th>
<th>Student Cource </th>
<th>Student Sem</th>
<th>Student Class</th>
<th>Student RollNo</th>
<th>Action</th>
</tr>
</thead>
<%while(rs2.next())
{
 %>
<tbody>
<tr>

<td>
<h2>
<a><%=rs2.getString("book_name") %></a>
</h2>
</td>
<td><%=rs2.getString("book_id") %></td>
<td><%=rs2.getDate("taken_date") %></td>
<td><%=rs2.getDate("return_date") %></td>
<td><%=rs2.getLong("mobile") %></td>
<td><%=rs2.getString("name") %></td>
<td align="center"><%=rs2.getString("cource") %></td>
<td align="center"><%=rs2.getString("sem") %></td>
<td align="center"><%=rs2.getString("class") %></td>
<td align="center"><%=rs2.getString("rollno") %></td>
<td align="center"><a href="../delIssueBook?id=<%=rs2.getString("book_id") %>&mo=<%=rs2.getLong("mobile")%>&name=admin" ><i class="fa fa-trash"></i></a></td>
</tr>
<%} %>
</tbody>
</table>
</div>
</div>
</div>
</div>

</div>

</div>
</div>
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