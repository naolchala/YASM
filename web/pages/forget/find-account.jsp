<%@page import="Exceptions.UserDontExistException"%>
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
	<div class="form-container flex flex-col flex-1 align-center">
	    <h1 class="title mt75">YASM</h1>
	    <div class="line-n-title flex align-center">
		<div class="line"></div>
		<h2 class="page-title">Forget Page</h2>
		<div class="line"></div>
	    </div>
	    <p
		    style="width: 60%; font-family: 'raleway'; font-size: 14px"
		    class="text-center text-primary"
		    >
		Find your account, and by answering your security question, you
		can reset your password, enter your email bellow to find your
		account
	    </p>
	    <% UserDontExistException ex = request.getAttribute("formError") != null
			    ? (UserDontExistException) request.getAttribute("formError") : null;
	    %>
	    <form action="" class="mt20 login-form flex-1 flex flex-col">
		<div class="form-field <%= ex != null ? "error" : ""  %>">
		    <span class="form-label">Email</span>
		    <input
			    type="email"
			    name="email"
			    class="form-input"
			    required
			    />
		    <% if (ex != null) {%>
		    <span class="form-error">
			<%= ex.getMessage()%>
		    </span> 
		    <% }%>
		</div>
		<button class="btn btn-primary login-btn mt30">
		    Find Your Account
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
