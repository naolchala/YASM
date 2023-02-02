<%@page import="Exceptions.FormException"%>
<%@page import="Models.User"%>
<!DOCTYPE html>
<html lang="en">
    <head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Forget Password</title>
	<link rel="stylesheet" href="static/css/icons/css/boxicons.css" />
	<link rel="stylesheet" href="static/css/fonts.css" />
	<link rel="stylesheet" href="static/css/common.css" />
	<link rel="stylesheet" href="static/css/login.css" />
    </head>
    <body class="full-page flex">
	<% User user = (User) session.getAttribute("reseting-user"); %>
	<div class="form-container flex flex-col flex-1 align-center">
	    <h1 class="title mt50">YASM</h1>
	    <div class="line-n-title flex align-center">
		<div class="line"></div>
		<h2 class="page-title">Verify Its Your Account</h2>
		<div class="line"></div>
	    </div>
	    <div class="profile-chip">
		<% if (user.profileUrl == null) {%>
		<div class="profile-icon">
		    <i class="bx bxs-user-circle"></i>
		</div>
		<% } else {%>
		<img src="<%= user.getProfileUrl()%>" alt="" />
		<% }%>
		<div class="flex flex-col flex-1">
		    <span class="name"><%= user.getFullname()%></span>
		    <span class="email"><%= user.email%></span>
		</div>
	    </div>
	    <% FormException ex = (FormException) request.getAttribute("formError");%>
	    <form action="" method="post" class="mt50 login-form flex-1 flex flex-col mb40 ">
		<input type="hidden" value="<%= user.email%>" name="email" disabled style="display: none" />
		<div class="form-field">
		    <span class="form-label">Security Question</span>
		    <input
			    type="text"
			    value="<%= user.securityQuestion%>"
			    name="question"
			    class="form-input"
			    disabled
			    />
		</div>
		<div class="form-field <%= ex != null ? "error" : ""%>">
		    <span class="form-label">Security Answer</span>
		    <input
			    type="text"
			    name="answer"
			    class="form-input"
			    required
			    />
		    <%if (ex != null) {%>
		    <span class="form-error">
			<%= ex.getMessage()%>
		    </span> 
		    <% }%>
		</div>
		<button class="btn btn-primary login-btn mt30">
		    Verify Identity
		</button>
		<a class="btn create-btn" href="Login"> Cancel </a>
	    </form>
	    <div class="footer py20 align-center flex justify-center flex-wrap">
		<a href="#">About us</a>
		<i class="bx bxs-circle"></i>
		<a href="#">Terms and Services</a>
		<i class="bx bxs-circle"></i>
		<a href="#">Copyright</a>
	    </div>
	</div>
	<div class="img-container flex-1">
	    <img src="static/images/forget_page.jpg" alt="" />
	</div>
    </body>
</html>
