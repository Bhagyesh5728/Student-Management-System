<%
String addTeacher=(String) session.getAttribute("teacher");
if(addTeacher!=null)
{
	out.print("<script>alert('Added..')</script>");
	session.removeAttribute("teacher");
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


    <%@include file="sidebar-header.jsp" %>
  
<div class="page-wrapper">
<div class="content container-fluid">

<div class="page-header">
<div class="row align-items-center">
<div class="col-sm-12">
<div class="page-sub-header">
<h3 class="page-title">Add</h3>
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
<form action="../addTeacher" method="post" enctype="multipart/form-data">
<div class="row">
<div class="col-12">
<h5 class="form-title student-info">Information <span><a href="javascript:;"><i class="feather-more-vertical"></i></a></span></h5>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>First Name <span class="login-danger">*</span></label>
<input class="form-control" type="text"  name="firstname" placeholder="Enter First Name" required>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>Middle Name <span class="login-danger">*</span></label>
<input class="form-control"  type="text"  name="middlename" placeholder="Enter Middle Name" required>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>Last Name <span class="login-danger">*</span></label>
<input class="form-control"  name="lastname"  type="text" placeholder="Enter Last Name" required>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>E-Mail <span class="login-danger">*</span></label>
<input class="form-control" type="Email"  name="email" placeholder="Enter Email Address" required>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>Phone <span class="login-danger">*</span></label>
<input class="form-control" type="number" name="mobile"  placeholder="Enter Phone Number" required>
</div>
</div>

<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>Address <span class="login-danger">*</span></label>
<input class="form-control" type="text" name="address" placeholder="Enter Address" required>
</div>
</div>

<div class="col-12 col-sm-4">
<div class="form-group">
<label>Role <span class="login-danger">*</span></label>
<select name="role" style="width: 220px; font-size:15px;  height:  40px; background: white; border-radius: 5px; border-color: gray; ">
<option>teacher</option>
<option>librarian</option>
</select>
</div>
</div>

<div class="col-12 col-sm-4">
<div class="form-group students-up-files">
<label>Upload Student Photo</label>
<div class="uplod">
<label class="file-upload image-upbtn mb-0">
Choose File <input type="file" name="photo">
</label>
</div>
</div>
</div>
<div class="col-12 col-sm-4">

</div>
</div>
<div class="col-12">
<div class="student-submit">
<button type="submit" class="btn btn-primary">Submit</button>
</div>
</div>
</div>
</form>
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