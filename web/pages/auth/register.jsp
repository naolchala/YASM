<%@page import="Exceptions.FormException"%>
<!DOCTYPE html>
<html lang="en">
    <head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Register</title>
	<link rel="apple-touch-icon" sizes="180x180" href="static/favicon_io/apple-touch-icon.png"> 
	<link rel="icon" type="image/png" sizes="32x32" href="static/favicon_io/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="static/favicon_io/favicon-32x32.png">
	<link rel="manifest" href="static/favicon_io/site.webmanifest"> 
	<link rel="shortcut icon" href="static/favicon_io/favicon.ico" type="image/x-icon">

	<link rel="stylesheet" href="static/css/icons/css/boxicons.css" />
	<link rel="stylesheet" href="static/css/fonts.css" />
	<link rel="stylesheet" href="static/css/common.css" />
	<link rel="stylesheet" href="static/css/login.css" />
    </head>
    <body class="full-page flex">
	<div
		class="form-container flex-1 flex flex-col pb0 p50"
		style="padding-bottom: 0 !important"
		>
	    <h1 class="title" style="font-size: 48px">YASM</h1>
	    <div class="line-n-title flex align-center">
		<h2 class="page-title ml0">Create New Account</h2>
		<div class="line"></div>
	    </div>
	    <% FormException ex = (FormException) request.getAttribute("formError");
		    if (ex == null) {
			    ex = new FormException("no-error", "");
		    }
	    %>
	    <form
		    action="Register"
		    method="post"
		    class="flex flex-col login-form"
		    style="width: 100%"
		    >
		<div class="flex flex-row flex-gap-20">
		    <div class="form-field flex-1 <%= ex.getElement() == "firstName" ? "error" : ""%>">
			<span class="form-label">First Name</span>
			<input
				type="text"
				class="form-input"
				name="firstName"
				value="${param["firstName"]}"
				required
				/>
			<% if (ex.getElement() == "firstName") {%>
			<span class="form-error">
			    <%= ex.getMessage()%>
			</span> 
			<% }%>
		    </div>
		    <div class="form-field flex-1 <%= ex.getElement() == "lastName" ? "error" : ""%>">
			<span class="form-label">Last Name</span>
			<input
				type="text"
				class="form-input"
				name="lastName"
				value="${param["lastName"]}"
				/>
			<% if (ex.getElement() == "lastName") {%>
			<span class="form-error">
			    <%= ex.getMessage()%>
			</span> 
			<% }%>
		    </div>
		</div>
		<div class="form-field <%= ex.getElement() == "email" ? "error" : ""%>">
		    <span class="form-label">Email</span>
		    <input
			    type="email"
			    class="form-input"
			    name="email"
			    value="${param["email"]}"
			    required
			    />
		    <% if (ex.getElement() == "email") {%>
		    <span class="form-error">
			<%= ex.getMessage()%>
		    </span> 
		    <% }%>
		</div>
		<div class="flex flex-row flex-gap-20">
		    <div class="form-field flex-1 <%= ex.getElement() == "password" ? "error" : ""%>">
			<span class="form-label">Password</span>
			<input
				type="password"
				class="form-input"
				name="password"
				required
				/>
			<% if (ex.getElement() == "password") {%>
			<span class="form-error">
			    <%= ex.getMessage()%>
			</span> 
			<% }%>
		    </div>
		    <div class="form-field flex-1 <%= ex.getElement() == "confirmPassword" ? "error" : ""%>">
			<span class="form-label">Confirm Password</span>
			<input
				type="password"
				class="form-input"
				name="confirmPassword"
				required
				/>
		    </div>
		</div>
		<div class="flex flex-row flex-gap-20">
		    <div class="form-field flex-1">
			<span class="form-label">Security Question</span>
			<select class="form-input" name="secQuestion">
			    <option value="What is your hometown?">
				What is your hometown?
			    </option>

			    <option value="What is your favorite color?">
				What is your favorite color?
			    </option>
			    <option value="What is your favorite movie?">
				What is your favorite movie?
			    </option>
			    <option
				    value="What is the name of your high school?"
				    >
				What is the name of your high school?
			    </option>
			    <option value="What is your favorite sports team?">
				What is your favorite sports team?
			    </option>
			    <option value="What is your favorite book?">
				What is your favorite book?
			    </option>
			    <option value="What street did you grow up on?">
				What street did you grow up on?
			    </option>
			    <option value="Who was your first grade teacher?">
				Who was your first grade teacher?
			    </option>
			</select>
		    </div>
		    <div class="form-field flex-1 <%= ex.getElement() == "secAnswer" ? "error" : ""%>">
			<span class="form-label">Security Answers</span>
			<input
				type="text"
				class="form-input"
				name="secAnswer"

				/>
			<% if (ex.getElement() == "secAnswer") {%>
			<span class="form-error">
			    <%= ex.getMessage()%>
			</span> 
			<% }%>
		    </div>
		</div>
		<div class="flex flex-col mt40 mb20">
		    <button class="btn btn-primary login-btn">
			Create Account
		    </button>
		    <a
			    href="Login"
			    class="btn btn-secondary text-center mt10 bg-primary-lighter p10 text-primary br5 create-btn"
			    >
			Already have an Account?
		    </a>
		</div>
	    </form>
	    <div
		    class="footer flex align-center py10 mt40 justify-center flex-wrap"
		    >
		<a href="#">About us</a>
		<i class="bx bxs-circle"></i>
		<a href="#">Terms and Services</a>
		<i class="bx bxs-circle"></i>
		<a href="#">Copyright</a>
	    </div>
	</div>
	<div class="img-container flex-1">
	    <img src="static/images/signup_page.jpg" alt="" />
	</div>
    </body>
</html>
