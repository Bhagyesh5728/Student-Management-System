 
<% 
String s=(String) session.getAttribute("log");
if(s!=null)
{
	response.sendRedirect("studentdetail.jsp");
}
String register=(String) session.getAttribute("register");
if(register!=null)
{
	out.print("<script>alert('Registartion Succefull!! Please Login')</script>");
	session.removeAttribute("register");
	
}
String exist=(String) session.getAttribute("exist");
if(exist!=null)
{
	out.print("<script>alert('Allready Exist Please Login')</script>");
	session.removeAttribute("exist");
	
}
String invalid=(String) session.getAttribute("invalid");
if(invalid!=null)
{
	out.print("<script>alert('Invalid Username and Password')</script>");
	session.removeAttribute("invalid");
	
}

%>


<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from preschool.dreamguystech.com/template/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 05 Jul 2023 16:50:55 GMT -->
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
<title>SSSDIIT Managment Tool</title>

<link rel="shortcut icon" href="assets/img/icons/pngwing.com.png">

<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,400;0,500;0,700;0,900;1,400;1,500;1,700&amp;display=swap" rel="stylesheet">

<link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet" href="assets/plugins/feather/feather.css">

<link rel="stylesheet" href="assets/plugins/icons/flags/flags.css">

<link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
<link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

<link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<div class="main-wrapper login-body">
<div class="login-wrapper">
<div class="container">
<div class="loginbox">
<div class="login-left">
<img class="img-fluid" src="assets/img/icons/pngwing.com_cleanup.png" alt="Logo">
</div>
<div class="login-right">
<div class="login-right-wrap">
<h1>Welcome to SSSDIIT Managment Tool</h1>
<p class="account-subtitle">Need an account? <a href="register.jsp">Sign Up</a></p>
<h2>Sign in</h2>

<form action="login" method="post">
<div class="form-group">
<label>Mobile <span class="login-danger">*</span></label>
<input class="form-control" type="number" placeholder="Enter Mobile Number" pattern="[0-9]{10}" name="mobile" required>
<span class="profile-views"><i class="fas fa-user-circle"></i></span>
</div>
<div class="form-group">
<label>Password <span class="login-danger">*</span></label>
<input class="form-control pass-input" type="text" placeholder="Enter Password" name="pass" required>
<span class="profile-views feather-eye toggle-password"></span>
</div>
<div class="forgotpass">

<a href="forgot-pass.jsp">Forgot Password?</a>
</div>
<div class="form-group">
<button class="btn btn-primary btn-block" type="submit">Login</button>
</div>
</form>

<div class="login-or">
<span class="or-line"></span>
<span class="span-or">or</span>
</div>

<div class="social-login">

<a href="#"><i class="fab fa-facebook-f"></i></a>
<a href="#"><i class="fab fa-twitter"></i></a>
<a href="#"><i class="fab fa-linkedin-in"></i></a>
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

<script src="assets/js/script.js"></script>
</body>

<!-- Mirrored from preschool.dreamguystech.com/template/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 05 Jul 2023 16:50:55 GMT -->
</html>