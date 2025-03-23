<%
String admin=(String) session.getAttribute("admin");
if(admin==null)
{
	response.sendRedirect("index.jsp");
}
%>
<%@page import="java.sql.*" %>
<%
	String id=request.getParameter("id");
	long mobile=Long.parseLong(id);
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/SSSDIIT","root","");
	PreparedStatement pd=c.prepareStatement("select * from member where mobile=('"+mobile+"')");
	ResultSet rs=pd.executeQuery();
	
	
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SSSDIIT Managment Tool</title>

<link rel="shortcut icon" href="assets/img/icons/pngwing.com.png">


<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min  .css"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<style type="text/css">
.m:hover{
  background-color: white;
}
body {
color: #404E67;
background: #F5F7FA;
font-family: 'Open Sans', sans-serif;
}
.table-wrapper {
width: 700px;
margin: 30px auto;
background: #fff;
padding: 20px;
box-shadow: 0 1px 1px rgba(0,0,0,.05);
}
.table-title {
padding-bottom: 10px;
margin: 0 0 10px;
}
.table-title h2 {
margin: 6px 0 0;
font-size: 22px;
}
.table-title .add-new {
float: right;
height: 30px;
font-weight: bold;
font-size: 12px;
text-shadow: none;
min-width: 100px;
border-radius: 50px;
line-height: 13px;
}
.table-title .add-new i {
margin-right: 4px;
}
table.table {
table-layout: fixed;
}
table.table tr th, table.table tr td {
border-color: #e9e9e9;
}
table.table th i {
font-size: 13px;
margin: 0 5px;
cursor: pointer;
}
table.table th:last-child {
width: 100px;
}
table.table td a {
cursor: pointer;
display: inline-block;
margin: 0 5px;
min-width: 24px;
}
table.table td a.add {
color: #27C46B;
}
table.table td a.edit {
color: #FFC107;
}
table.table td a.delete {
color: #E34724;
}
table.table td i {
font-size: 19px;
}
table.table td a.add i {
font-size: 24px;
margin-right: -1px;
position: relative;
top: 3px;
}
table.table .form-control {
height: 32px;
line-height: 32px;
box-shadow: none;
border-radius: 2px;
}
table.table .form-control.error {
border-color: #f50000;
}
table.table td .add {
display: none;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
$('[data-toggle="tooltip"]').tooltip();
var actions = $("table td:last-child").html();


// Delete row on delete button click
$(document).on("click", ".delete", function(){

$(".add-new").removeAttr("disabled");
});
});
</script>
</head>
<body ><br>&nbsp;&nbsp;
   <a href="liststud.jsp"> <button class="btn btn-info add-new" id="back" >Back</button></a>
<div class="container">



<div class="table-title">
<div class="row">
<div class="col-sm-8"><h2>Update <b>Student</b></h2></div>


</div>
</div>
<span id="bm"><table class="table table-bordered">
<thead>
<tr  >
<th width="190x;" style="text-align: center;"> Name</th>
<th width="110px;" style="text-align: center;">Mobile</th>
<th width="244px;" style="text-align: center;">E-Mail</th>
<th width="65px;" style="text-align: center;">Cource</th>
<th width="40px;" style="text-align: center;">Sem</th>
<th width="85px;" style="text-align: center;">Class_Name</th>
<th width="60px;" style="text-align: center;">Roll_No</th>
<th width="140px;" style="text-align: center;">Address</th>
<th width="70px;" style="text-align: center;">Fees</th>

<th style="text-align: center;" >Actions</th>
</tr>
</thead>
<tbody>
<form method="post" action="../update" method="post">
</tbody>
<%while(rs.next())
	{%>
<tr>

<td><input type="text" name="name" value="<%=rs.getString("name") %>"  style="width: 180px;"></td>
<td><input type="text" name="mobile"  readonly value="<%=rs.getLong("mobile") %>" style="width: 100px;" ></td>
<td><input type="text" name="email" value="<%=rs.getString("email") %>" style="width: 245px;" ></td>
<td><input type="text" name="cource" value="<%=rs.getString("cource") %>" style="width: 50px;" ></td>
<td><input type="text" name="sem" value="<%=rs.getString("sem") %>" style="width: 30px;" ></td>
<td><input type="text" name="class" value="<%=rs.getString("class") %>" style="width: 77px;" ></td>
<td><input type="text" name="rollno" value="<%=rs.getString("RollNo") %>" style="width: 50px;" ></td>
<td><input type="text" name="address" value="<%=rs.getString("Address") %>" style="width:136px;" ></td>
<td><input type="text" name="fees"  value="<%=rs.getString("fees") %>" style="width: 62px;" ></td>


<td><button name="btn">Update</button></td>

</tr>
<%}
}catch(Exception e)
{System.out.print(e);}%>
</tbody>
</form>
</table>
</span>
</div>
</div>
</body>
</html> 


