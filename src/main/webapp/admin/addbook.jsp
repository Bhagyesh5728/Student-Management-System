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
    	String id=request.getParameter("id");
    	String book_name="";
    	String book_id="";
    	int stock=0;
    	Class.forName("com.mysql.cj.jdbc.Driver");
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
    	PreparedStatement pd1=c.prepareStatement("select * from books where id='"+id+"' ");
    	ResultSet r1=pd1.executeQuery();
    	while(r1.next())
    	{
    	
    		book_id=r1.getString("book_id");
    		book_name=r1.getString("book_name");
    		stock=r1.getInt("stock");
    	}
    %>
  
<div class="page-wrapper">
<div class="content container-fluid">

<div class="page-header">
<div class="row align-items-center">
<div class="col-sm-12">
<div class="page-sub-header">
<h3 class="page-title">Library</h3>
<ul class="breadcrumb">


</ul>
</div>
</div>
</div>
</div>

<div class="row">
<div class="col-sm-12">
<div class="card comman-shadow">
<div class="card-body">
<%if(id==null){ %>
<form action="../addBook" method="post" >
<div class="row">
<div class="col-12">
<input type="hidden" value="admin" name="name">
<h5 class="form-title student-info">Add Book <span><a href="javascript:;"><i class="feather-more-vertical"></i></a></span></h5>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>Book ID <span class="login-danger">*</span></label>
<input class="form-control" type="text"   name="bookid" placeholder="Enter Book Id" required>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>Book Name <span class="login-danger">*</span></label>
<input class="form-control"  type="text"  name="bookname" placeholder="Enter Book Name" required>
</div>
</div>

<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>Stock<span class="login-danger">*</span></label>
<input class="form-control" type="number"  name="stock" placeholder="Enter stock" required>
</div>
</div><div class="col-12">
<div class="student-submit">
<button type="submit" class="btn btn-primary">Submit</button>
</div>
</div>
</div>
</form>
<%}else{ %>
<form action="../addBook" method="post" >
<div class="row">
<div class="col-12">
<h5 class="form-title student-info">Add Book <span><a href="javascript:;"><i class="feather-more-vertical"></i></a></span></h5>
</div>
<input type="hidden" value="<%=id %>" name="id">
<input type="hidden" value="admin" name="name">
<div class="col-12 col-sm-4">
<div class="form-group local-forms">

<label>Book ID <span class="login-danger">*</span></label>
<input class="form-control" type="text" value="<%=book_id %>"  name="bookid" placeholder="Enter Book Id" required>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>Book Name <span class="login-danger">*</span></label>
<input class="form-control"  type="text"  value="<%=book_name %>" name="bookname" placeholder="Enter Book Name" required>
</div>
</div>

<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>Stock<span class="login-danger">*</span></label>
<input class="form-control" type="number"  value="<%=stock %>" name="stock" placeholder="Enter stock" required>
</div>
</div><div class="col-12">
<div class="student-submit">
<button type="submit" class="btn btn-primary">Submit</button>
</div>
</div>
</div>
</form>


<%} %>
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