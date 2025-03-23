
<%
String bookadd=(String) session.getAttribute("bookadd");
if(bookadd!=null)
{
	out.print("<script>alert('Book Added..')</script>");
	session.removeAttribute("bookadd");
}
String bookupdate=(String) session.getAttribute("bookupdate");
if(bookupdate!=null)
{
	out.print("<script>alert('Book Updated...')</script>");
	session.removeAttribute("bookupdate");
}

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SSSDIIT MANAGMENT TOOL-Dashbord</title>
<link rel="shortcut icon" href="assets/img/icons/pngwing.com.png">

    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,400;0,500;0,700;0,900;1,400;1,500;1,700&amp;display=swap" rel="stylesheet">

<link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet" href="assets/plugins/feather/feather.css">

<!-- <link rel="stylesheet" href="assets/plugins/icons/flags/flags.css"> -->

<link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
<link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

<link rel="stylesheet" href="assets/plugins/simple-calendar/simple-calendar.css">

<link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

	<%@page import="java.sql.*" %>
    <%@include file="sidebar-header.jsp" %>
  <%
 


  try
  {
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/SSSDIIT","root","");

  PreparedStatement p=c.prepareStatement("select *  from books");
  ResultSet r=p.executeQuery();
	
  %>


<div class="page-wrapper">
<div class="content container-fluid">

<div class="page-header">
<div class="row align-items-center">
<div class="col">
<h3 class="page-title">Library</h3>
<ul class="breadcrumb">

</ul>
</div>
</div>
</div>

<div class="row">
<div class="col-sm-12">
<div class="card card-table">
<div class="card-body">

<div class="page-header">
<div class="row align-items-center">
<div class="col">
<h3 class="page-title">Library</h3>
</div>
<div class="col-auto text-end float-end ms-auto download-grp">

<a href="addbook.jsp" class="btn btn-primary"><i class="fas fa-plus"></i></a>
</div>
</div>
</div>

<div class="table-responsive">
<table class="table border-0 star-student table-hover table-center mb-0 datatable table-striped">
<thead class="student-thread">
<tr>
<th>Book_Name</th>
<th>Book_ID</th>
<th>Stock</th>
<th class="text-end">Action</th>
</tr>
</thead>
<tbody>
<%
while(r.next())
{
	
%>
<tr>
<td><%=r.getString("book_name") %></td>
<td><%=r.getString("book_id") %></td>
<%if(r.getInt("stock")==0){ %>
<td style="color:red;">0</td>
<%}else{ %>
<td style="color:green;"><%=r.getInt("stock") %></td>
<%} %>
<td class="text-end">
<div class="actions">
<a href="addbook.jsp?id=<%=r.getInt("id")%>" class="btn btn-sm bg-danger-light">
<i class="feather-edit"></i>
<a href="../deleteBook?id=<%=r.getInt("id")%>" class="btn btn-sm bg-success-light me-2">
<i class="fa fa-trash"></i>
</a>
</a>
</div>
</td>
</tr>
<%
}
}catch(Exception e)
{
  System.out.print(e);
}
%>
</tbody>
</table>
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

<script src="assets/plugins/simple-calendar/jquery.simple-calendar.js"></script>
<script src="assets/js/calander.js"></script>

<script src="assets/js/circle-progress.min.js"></script>

<script src="assets/js/script.js"></script>
</body>
</html>