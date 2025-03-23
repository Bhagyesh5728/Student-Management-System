


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SSSDIIT MANAGMENT TOOL-Dashbord</title>
    <style type="text/css">
    
    .rollno
    {
    border: none; color:white; background: blue; width:30px; padding:3px; border-radius: 5px; 
    
    }
    .present
    {
    color:white; background: green;  border: none; border-radius: 5px;
    
    }
    
    .absent
    {
     color:white; background: red;  border: none; border-radius: 5px;
    }
    </style>
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



<div class="page-wrapper">
<div class="content container-fluid">

<div class="page-header">
<div class="row align-items-center">
<div class="col">
<h3 class="page-title">Teacher</h3>
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
<h3 class="page-title">Work List</h3>
</div>
<span>
<select name="sname" id="cource"  >
<option value="ASP.NET">ASP.NET</option>
<option value="Java">Java</option>
<option value="Python">Python</option>
<option value="Programming in C">Programming  in C</option>
<option value="C++">C++</option>
</select>
<button name="submit" onclick="getdata()" >Send</button>

	
	</span>
<div class="col-auto text-end float-end ms-auto download-grp">


</div>
</div>
</div>
<span id="data"></span>
</div>
</div>
</div>
</div>
</div>
</div>

<script>

function getdata()
{
	var cource=document.getElementById("cource").value;

	 var xmlhttp = new XMLHttpRequest();
     xmlhttp.onreadystatechange = function() {
         if (this.readyState == 4 && this.status == 200) {
             document.getElementById("data").innerHTML = this.responseText;
         }
     };
  
 	
     xmlhttp.open("POST", "getwork.jsp?cource=" + cource, true);
     xmlhttp.send();
	
}
</script>

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