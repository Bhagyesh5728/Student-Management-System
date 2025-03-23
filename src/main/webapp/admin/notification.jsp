<%
String bookexist=(String) session.getAttribute("noti");
if(bookexist!=null)
{
	out.print("<script>alert('Notification Send Successfully!!')</script>");
	session.removeAttribute("noti");
}

%>
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

<%@include file="sidebar-header.jsp" %>

<div class="page-wrapper">
<div class="content container-fluid">

<div class="page-header">
<div class="row">
<div class="col">
<h3 class="page-title">Notification</h3>

</div>
</div>
</div>

<div class="row">
<div class="col-lg-12">
<div class="card">
<div class="card-header">
<h5 class="card-title">Add Notification</h5>
</div>
<div class="card-body">


<form action="../addNoti" method="post">


<div class="form-group row">
<input type="hidden" value="admin" name="name">
<label class="col-form-label col-md-2">Description</label>
<div class="col-md-10">
<textarea rows="5" cols="5" name="description" class="form-control" placeholder="Enter text here"></textarea>
</div>
</div><button name="add" class="btn btn-primary">Send</button></h5>
</form>

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