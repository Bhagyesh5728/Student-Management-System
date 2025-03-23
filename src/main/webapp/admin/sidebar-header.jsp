
<%
String admin=(String) session.getAttribute("admin");
if(admin==null)
{
	response.sendRedirect("index.jsp");
}

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
<img class="rounded-circle" src="../images/gurukul.png" width="31" alt="Ryan Taylor">
<div class="user-text">
<h6>Admin</h6>
<p class="text-muted mb-0">admin</p>
</div>
</span>
</a>
<div class="dropdown-menu">
<div class="user-header">
<div class="avatar avatar-sm">
<img src="../images/gurukul.png" alt="User Image" class="avatar-img rounded-circle">
</div>
<div class="user-text">
<h6>Admin</h6>
<p class="text-muted mb-0">admin</p>
</div>
</div>

<!-- <a class="dropdown-item" href="inbox.html">Inbox</a> -->
<a class="dropdown-item" href="../adminlogout">Logout</a>
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
<a href="main.jsp"><i class="feather-grid"></i> <span>DashBoard</span></a>
</li>
<li class="submenu">
<a href="#"><i class="fas fa-graduation-cap"></i> <span> Students</span> <span class="menu-arrow"></span></a>
<ul>
<li><a href="addstud.jsp">Student Add</a></li>
<li><a href="liststud.jsp">Student List</a></li>

</ul>
</li>

<li class="submenu">
<a href="#"><i class="fas fa-book"></i> <span>Library</span> <span class="menu-arrow"></span></a>
<ul>
<li><a href="addTeacher.jsp">Add Librarian</a></li>
<li><a href="listLib.jsp">Librarian List</a></li>
<li><a href="booklist.jsp">Books List</a></li>
<li><a href="allocateBookList.jsp">Issue Book List</a></li>
<li><a href="addbook.jsp">Add Book</a></li>
<li><a href="allocatebook.jsp">Issue Book</a></li>
</ul>
</li>

<li class="submenu">
<a href="#"><i class="fas fa-calendar-day"></i> <span>Result</span> <span class="menu-arrow"></span></a>
<ul>
<li><a href="resultlist.jsp">Result List</a></li>
<li><a href="resultSettings.jsp">Result Settings</a></li>
</ul>
</li>

<li class="submenu">
<a href="#"><i class="fas fa-book"></i> <span>Teacher</span> <span class="menu-arrow"></span></a>
<ul>

<li><a href="addTeacher.jsp">Add Teacher</a></li>
<li><a href="teacherList.jsp">Teacher List</a></li>
<li><a href="attendance.jsp">Take Attendance</a></li>
<li><a href="workList.jsp">Work List</a></li>
<li><a href="giveWork.jsp">Give Work</a></li>
</ul>
</li>


<li class="submenu">
<a href="#"><i class="fa fa-bell"></i> <span>Notification</span> <span class="menu-arrow"></span></a>
<ul>
<li><a href="notification.jsp">Add Notification</a></li>
<li><a href="listnoti.jsp">List Of Notification</a></li>
</ul>
</li>

</ul>
</div>
</div>
</div>




</body>

<!-- Mirrored from preschool.dreamguystech.com/template/student-dashboard.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 05 Jul 2023 16:50:59 GMT -->
</html>