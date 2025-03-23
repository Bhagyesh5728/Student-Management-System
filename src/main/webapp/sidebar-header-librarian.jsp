<%
String mobile=(String) session.getAttribute("log");
if(mobile==null)
{
	response.sendRedirect("index.jsp");
	
}
%>
<%@page import="java.sql.*" %>
<%
	String img="";
	String name="";
	String noti="";
	String role="";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/SSSDIIT","root","");
	PreparedStatement pd=c.prepareStatement("select role,name,mobile,email,address,photo from member where mobile='"+mobile+"'");
	ResultSet rs=pd.executeQuery();

	while(rs.next())
	{
		name=rs.getString("name");	
		img=rs.getString("photo");
		role=rs.getString("role");
		
	}
	Statement st=c.createStatement();
	ResultSet rs5=st.executeQuery("select * from notification");

%>

<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from preschool.dreamguystech.com/template/student-dashboard.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 05 Jul 2023 16:50:57 GMT -->
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">




<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,400;0,500;0,700;0,900;1,400;1,500;1,700&amp;display=swap" rel="stylesheet">



<!-- <link rel="stylesheet" href="assets/plugins/simple-calendar/simple-calendar.css"> -->

<link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<div class="main-wrapper">

<div class="header">

<div class="header-left">
<a  href="#" class="logo">
<img src="assets/img/icons/pngwing.com.png" alt="Logo">SSSDIIT Managment Tool
</a>
<a href="#" class="logo logo-small">
<img src="assets/img/icons/pngwing.com.png" alt="Logo" width="30" height="30">
</a>
</div>

<div class="menu-toggle">
<a href="javascript:void(0);" id="toggle_btn">
<i class="fas fa-bars"></i>
</a>
</div>

<div class="top-nav-search">

</div>


<a class="mobile_btn" id="mobile_btn">
<i class="fas fa-bars"></i>
</a>


<ul class="nav user-menu">
<li class="nav-item dropdown language-drop me-2">
<!-- <a href="#" class="dropdown-toggle nav-link header-nav-list" data-bs-toggle="dropdown"> -->
<!-- <img src="assets/img/icons/header-icon-01.svg" alt> -->
</a>

</li>

<li class="nav-item dropdown noti-dropdown me-2">
<a href="#" class="dropdown-toggle nav-link header-nav-list" data-bs-toggle="dropdown">
<img src="assets/img/icons/header-icon-05.svg" alt>
</a>
<div class="dropdown-menu notifications">
<div class="topnav-dropdown-header">
<span class="notification-title" >Notifications</span>
</div>
<div class="noti-content">
<ul class="notification-list">
<li class="notification-message">
<a href="#">
<div class="media d-flex">
<!-- <span class="avatar avatar-sm flex-shrink-0"> -->
<!-- <img class="avatar-img rounded-circle" alt="User Image" src="assets/img/profiles/avatar-02.jpg"> -->
</span>
<div class="media-body flex-grow-1">
<% while(rs5.next())
{
	 %>
<p class="noti-details"><span class="noti-title"><%=rs5.getString("message") %></span></p>
<hr>
<%} %>
<!-- <p class="noti-time"><span class="notification-time">4 mins ago</span></p> -->

</div>
</div>
</a>
</li>
</ul>
</div>
<div class="topnav-dropdown-footer">

</div>
</div>
</li>

<li class="nav-item zoom-screen me-2">
<a href="#" class="nav-link header-nav-list">
<img src="assets/img/icons/header-icon-04.svg" alt>
</a>
</li>

<li class="nav-item dropdown has-arrow new-user-menus">
<a href="#" class="dropdown-toggle nav-link" data-bs-toggle="dropdown">
<span class="user-img">
<img class="rounded-circle" src="./images/<%=img %>" width="31" alt="NotFound">
<div class="user-text">
<h6><%= name %></h6>
<p class="text-muted mb-0"><%= role	 %></p>
</div>
</span>
</a>
<div class="dropdown-menu">
<div class="user-header">
<div class="avatar avatar-sm">
<img src="./images/<%=img %>" alt="User Image" class="avatar-img rounded-circle">
</div>
<div class="user-text">
<h6><%= name %></h6>
<p class="text-muted mb-0"><%= role%></p>
</div>
</div>
<a class="dropdown-item" href="libProfile.jsp">My Profile</a>
<!-- <a class="dropdown-item" href="inbox.html">Inbox</a> -->
<a class="dropdown-item" href="logout">Logout</a>
</div>
</li>

</ul>

</div>


<div class="sidebar" id="sidebar">
<div class="sidebar-inner slimscroll">
<div id="sidebar-menu" class="sidebar-menu">
<ul>
<li class="menu-title">
<span>Main Menu</span>
</li>

<li>
<a href="librarian.jsp"><i class="feather-grid"></i> <span>DashBoard</span></a>
</li>
<li>
<a href="booklist.jsp"><i class="fa fa-address-book"></i> <span>Book List</span></a>
</li>
<li>
<a href="allocateBookList.jsp"><i class="fa fa-address-book"></i> <span>Issue Book List</span></a>
</li>
<li>
<a href="addbook.jsp"><i class="fa fa-address-book"></i> <span>Add Book</span></a>
</li>
<li>
<a href="allocatebook.jsp"><i class="fa fa-address-book"></i> <span>Issue Book</span></a>
</li>
<li class="submenu">
<a href="#"><i class="fa fa-bell"></i> <span>Notification</span> <span class="menu-arrow"></span></a>
<ul>
<li><a href="libNoti.jsp">Add Notification</a></li>
<li><a href="libNotiList.jsp">List Of Notification</a></li>
</ul>
</li>


</ul>
</div>
</div>
</div>




</body>

<!-- Mirrored from preschool.dreamguystech.com/template/student-dashboard.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 05 Jul 2023 16:50:59 GMT -->
</html>