
<%
String work=(String) session.getAttribute("work");
if(work!=null)
{
	out.print("<script>alert('Work Added..')</script>");
	session.removeAttribute("work");
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
<h3 class="page-title">Teacher</h3>
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
<form action="../work" method="post" enctype="multipart/form-data">
<div class="row">
<div class="col-12">
<h5 class="form-title student-info">Give Work	 <span><a href="javascript:;"><i class="feather-more-vertical"></i></a></span></h5>
</div>
<p id="s"></p>
<div class="col-12 col-sm-4">
<div class="form-group">
<label>Subject Name<span class="login-danger">*</span></label>
<select name="sname" style="width: 220px; font-size:15px;  height:  40px; background: white; border-radius: 5px; border-color: gray; "  >
<option >ASP.NET</option>
<option >Java</option>
<option >Python</option>
<option >Programming  in C</option>
<option >C++</option>
</select>

</div>
</div>

<div class="col-12 col-sm-4">
<div class="form-group">
<label>Cource <span class="login-danger">*</span></label>
<select name="cource" style="width: 220px; font-size:15px;  height:  40px; background: white; border-radius: 5px; border-color: gray; " >
<option>BCA</option>
<option>BSCIT</option>
</select>
</div>
</div>



<div class="col-12 col-sm-4">
<div class="form-group">
<label>Sem <span class="login-danger">*</span></label>
<select name="sem" style="width: 220px; font-size:15px;  height:  40px; background: white; border-radius: 5px; border-color: gray; ">
<option>1</option>
<option>2</option>
<option>3</option>
<option>4</option>
<option>5</option>
<option>6</option>
</select>
</div>
</div>

<div class="col-12 col-sm-4">
<div class="form-group">
<label>Class<span class="login-danger">*</span></label>
<select name="class" style="width: 220px; font-size:15px;  height:  40px; background: white; border-radius: 5px; border-color: gray; " >
<option>A</option>
<option>B</option>
<option>C</option>
</select>
</div>
</div>


<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>Submit Date<span class="login-danger">*</span></label>
<input class="form-control" type="date"  name="submitDate" placeholder="Enter taken Date" required>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group students-up-files">
<label>Upload Work Detail</label>
<div class="uplod">
<label class="file-upload image-upbtn mb-0">
Choose File <input type="file" name="work">
</label>
</div>
</div>
</div>
<div class="student-submit">
<button type="submit" class="btn btn-primary">Submit</button>
</div>
</div>
</form>
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

<script src="assets/plugins/simple-calendar/jquery.simple-calendar.js"></script>
<script src="assets/js/calander.js"></script>

<script src="assets/js/circle-progress.min.js"></script>

<script src="assets/js/script.js"></script>

</body>
</html>