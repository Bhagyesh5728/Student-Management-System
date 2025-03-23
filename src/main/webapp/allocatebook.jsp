
<%
String bookexist=(String) session.getAttribute("bookexist");
if(bookexist!=null)
{
	out.print("<script>alert('Book Allready Allocate One Time')</script>");
	session.removeAttribute("bookexist");
}
String bookallo=(String) session.getAttribute("bookallo");
if(bookallo!=null)
{
	out.print("<script>alert('Book Allocated..')</script>");
	session.removeAttribute("bookallo");
}
String stock=(String) session.getAttribute("stock");
if(stock!=null)
{
	out.print("<script>alert('Not Avilable')</script>");
	session.removeAttribute("stock");
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
    <%@include file="sidebar-header-librarian.jsp" %>
  <%
 

  PreparedStatement p=c.prepareStatement("select book_name,book_id from books");
  ResultSet r=p.executeQuery();
	
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
<form action="allocateBook" method="post" >
<input type="hidden" value="client" name="name">
<div class="row">
<div class="col-12">
<h5 class="form-title student-info">issue Book <span><a href="javascript:;"><i class="feather-more-vertical"></i></a></span></h5>
</div>
<p id="s"></p>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>Name<span class="login-danger">*</span></label>
<input class="form-control" type="text"  name="name" placeholder="Enter Name" required>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>Mobile <span class="login-danger">*</span></label>
<input onkeyup="getMobile(this.value)" class="form-control"  type="number"  name="mobile" placeholder="Enter Mobile" required>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group">
<label>Book_Name <span class="login-danger">*</span></label>
<select name="bookName" style="width: 220px; font-size:15px;  height:  40px; background: white; border-radius: 5px; border-color: gray; " onchange="showHint(this.value)">
<%while(r.next()){ %>
<option><%=r.getString("book_name") %></option>
<%} %>
</select>
</div>
</div>

<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>Book_ID<span class="login-danger">*</span></label>
<input class="form-control" type="text"  name="bookId" readonly required id="bm">
</div>
</div>

<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>Taken Date<span class="login-danger">*</span></label>
<input class="form-control" type="date"  name="takenDate" placeholder="Enter taken Date" required>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>Return date<span class="login-danger">*</span></label>
<input class="form-control" type="date"  name="returnDate" placeholder="Enter Return date" required>
</div>
</div>
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
<script>
function showHint(str) {
    if (str.length == 0) {
        document.getElementById("txtHint").innerHTML = "";
        return;
    } else {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("bm").value = this.responseText;
            }
        };
        xmlhttp.open("GET", "getBookId.jsp?q=" + str, true);
        xmlhttp.send();
    }
}
function getMobile(str) {
    if (str.length == 0) {
        document.getElementById("txtHint").innerHTML = "";
        return;
    } else {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("s").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("GET", "getMobile.jsp?q=" + str, true);
        xmlhttp.send();
    }
}
</script>

</body>
</html>