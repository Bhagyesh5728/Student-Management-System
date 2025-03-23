<%
String mo=(String) session.getAttribute("log"); %>
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
	<%@page import="java.sql.*" %>
    <%@include file="sidebar-header-teacher.jsp" %>

<%
	

	PreparedStatement pd2=c.prepareStatement("SELECT *  from notification");
	ResultSet rs2=pd2.executeQuery();

%>

<div class="page-wrapper">
<div class="content container-fluid">

<div class="page-header">
<div class="row">
<div class="col">
<h3 class="page-title">Notification</h3>
<ul class="breadcrumb">

</ul>
</div>
</div>
</div>

<div class="row">

<div class="col-md-12">
<div class="card">
<div class="card-header">
<h5 class="card-title">List Of Messages</h5>
</div>
<div class="card-body">
<div class="sticky-note" id="board">
    
<div class="table-responsive">
<table class="table border-0 star-student table-hover table-center mb-0 datatable table-striped">
<thead class="student-thread">
<tr>
<th>Message</th>
<th>Action</th>


</tr>
</thead>
<tbody>
<%while(rs2.next()){ %>
<tr>
<td><%=rs2.getString("message") %></td>
<td>
<h2>
<a href="delNoti?id=<%=rs2.getInt("id")%>&name=client"><i class="fa fa-trash"></i></a>
</h2>
</td>
</tr>
<%} %>
</tbody>
</table>
</div>
</div>
</div>
</div>
</div>








<script src="assets/js/jquery-3.6.0.min.js"></script>

<script src="assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="assets/js/feather.min.js"></script>

<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<script src="assets/js/circle-progress.min.js"></script>

<script src="assets/js/script.js"></script>

</body>
</html>