<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SSSDIIT MANAGMENT TOOL</title>
<link rel="shortcut icon" href="assets/img/icons/pngwing.com.png">

    
 <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,400;0,500;0,700;0,900;1,400;1,500;1,700&amp;display=swap" rel="stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,400;0,500;0,700;0,900;1,400;1,500;1,700&amp;display=swap" rel="stylesheet">

<link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet" href="assets/plugins/feather/feather.css">

<link rel="stylesheet" href="assets/plugins/icons/flags/flags.css">

<link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
<link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

<!-- <link rel="stylesheet" href="assets/plugins/stickynote/sticky.css"> -->

<link rel="stylesheet" href="assets/css/style.css">


<link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

    <%@include file="sidebar-header.jsp" %>
    <%@page import="java.sql.*" %>


<div class="page-wrapper">
<div class="content container-fluid">

<div class="page-header">
<div class="row">
<div class="col">
<h3 class="page-title">Check Result</h3>

</div>
</div>
</div>

<div class="row">
<div class="col-lg-12">
<div class="card">
<div class="card-header">
<h5 class="card-title">Your Result</h5>
</div>
<div class="card-body">

<%
String cource=request.getParameter("cource");
String sem=request.getParameter("sem");
String mobile=request.getParameter("mo");
Long mo=Long.parseLong(mobile);
if(cource.equals("BCA") && sem.equals("1"))
{
	%>
	<span id="bm"><table class="table table-bordered">
<thead>
<tr  >
<th width="150px;"> Name</th>
<th width="100px;">Mobile</th>
<th width="70px;">Cource</th>
<th width="70px;">Sem</th>
<th width="70px;">Exam</th>
<th width="140px;">Programmin In C</th>
<th width="90px;">Networking</th>
<th width="50px;">CF</th>
<th width="80px;">English</th>

<th>Actions</th>
</tr>
</thead>
<tbody>
	
	<%

Class.forName("com.mysql.cj.jdbc.Driver");
Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
PreparedStatement pd=c.prepareStatement("select result.c_language,result.networking,result.computer_fundamental,result.english,result.exam_title,result.mobile,member.cource,member.sem,member.name from result inner join member on result.mobile=member.mobile where member.cource='"+cource+"' and member.sem='"+sem+"' and result.mobile=?");
pd.setLong(1, mo);
ResultSet rs=pd.executeQuery();
while(rs.next()){

%>
<form action="../addResult" method="post">
<input type="hidden" name="mobile" value="<%=rs.getLong("mobile") %>">
<input type="hidden" name="sem" value="<%=rs.getString("sem") %>">
<input type="hidden" name="cource" value="<%=rs.getString("cource") %>">

<tr class="m">

<td><%=rs.getString("name") %></td>
<td><%=rs.getLong("mobile") %></td>
<td><%=rs.getString("cource") %></td>
<td><%=rs.getString("sem")%></td>
<td><%=rs.getString("exam_title") %></td>
<td><input value="<%=rs.getInt("c_language")%>"  name="clang" style="width:100px;" name="c_language"></td>
<td><input value="<%=rs.getInt("networking") %>" name="net" style="width:100px;" name="networking"></td>
<td><input value="<%=rs.getInt("computer_fundamental")%>" name="cf" style="width:100px;" name="cf"></td>
<td><input value="<%=rs.getInt("english") %>" name="eng" style="width:100px;" name="english" ></td>
<td><button>Update</button></td>
</tr>
</form>
</tbody>
<%
}

}


if(cource.equals("BCA") && sem.equals("2"))
{
%>
<span id="bm"><table class="table table-bordered">
<thead>
<tr  >
<th width="150px;"> Name</th>
<th width="100px;">Mobile</th>
<th width="70px;">Cource</th>
<th width="70px;">Sem</th>
<th width="70px;">Exam</th>
<th width="120px;">DSA</th>
<th width="90px;">PHP</th>
<th width="60px;">maths</th>
<th width="80px;">seo</th>

<th>Actions</th>
</tr>
</thead>
<tbody>

<%

Class.forName("com.mysql.cj.jdbc.Driver");
Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
PreparedStatement pd=c.prepareStatement("select result.data_structure,result.maths,result.php,result.coa,result.exam_title,result.mobile,member.cource,member.sem,member.name from result inner join member on result.mobile=member.mobile where member.cource='"+cource+"' and member.sem='"+sem+"' and result.mobile='"+mobile+"'");
ResultSet rs=pd.executeQuery();
while(rs.next()){

%>
<form action="../addResult" method="post">
<input type="hidden" name="mobile" value="<%=rs.getLong("mobile") %>">
<input type="hidden" name="sem" value="<%=rs.getString("sem") %>">
<input type="hidden" name="cource" value="<%=rs.getString("cource") %>">
<tr class="m">
<td><%=rs.getString("name") %></td>
<td><%=rs.getLong("mobile") %></td>
<td><%=rs.getString("cource") %></td>
<td><%=rs.getString("sem") %></td>
<td><%=rs.getString("exam_title") %></td>
<td><input value="<%=rs.getInt("data_structure")%>" name="ds" style="width:100px;" name="c_language"></td>
<td><input value="<%=rs.getInt("maths") %>" name="maths" style="width:100px;" name="networking"></td>
<td><input value="<%=rs.getInt("php")%>" name="php" style="width:100px;" name="cf"></td>
<td><input value="<%=rs.getInt("coa") %>"  name="coa" style="width:100px;" name="english" ></td>
<td><button>Update</button></td>
</tr>
</form>
</tbody>

<%
}

}

%>

</div>


<script src="assets/js/jquery-3.6.0.min.js"></script>

<script src="assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="assets/js/feather.min.js"></script>

<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>


<script src="assets/js/circle-progress.min.js"></script>

<script src="assets/js/script.js"></script>


</body>
</html>