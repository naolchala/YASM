<%@page import="Exceptions.FormException" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Login</title>

		<link
			rel="apple-touch-icon"
			sizes="180x180"
			href="static/favicon_io/apple-touch-icon.png"
		/>
		<link
			rel="icon"
			type="image/png"
			sizes="32x32"
			href="static/favicon_io/favicon-32x32.png"
		/>
		<link
			rel="icon"
			type="image/png"
			sizes="16x16"
			href="static/favicon_io/favicon-32x32.png"
		/>
		<link rel="manifest" href="static/favicon_io/site.webmanifest" />
		<link
			rel="shortcut icon"
			href="static/favicon_io/favicon.ico"
			type="image/x-icon"
		/>

		<link rel="stylesheet" href="static/css/icons/css/boxicons.css" />
		<link rel="stylesheet" href="static/css/fonts.css" />
		<link rel="stylesheet" href="static/css/common.css" />
		<link rel="stylesheet" href="static/css/login.css" />
	</head>

	<body class="full-page flex flex-row">
		<div class="img-container flex-1">
			<img src="static/images/login_page.jpg" alt="" />
		</div>
		<div
			class="form-container flex-1 flex flex-col align-center justify-center relative"
		>
			<h1 class="title mt75">YASM</h1>
			<div class="line-n-title flex flex-row align-center">
				<div class="line"></div>
				<h2 class="page-title">Login</h2>
				<div class="line"></div>
			</div>

			<% FormException ex=(FormException)
			request.getAttribute("formError"); if (ex==null) { ex=new
			FOur.Beloved.Summer.S01.E11ormException("no-error", "" ); } %>

			<form action="Login" method="post" class="login-form flex-1">
				<div
					class="form-field <%= ex.getElement() == &quot;email&quot; ? &quot;error&quot; : &quot;&quot;%>"
				>
					<span class="form-label">Email</span>
					<input type="text" class="form-input" name="email"
					id="email" value="${param[" email"]}" /> <% if
					(ex.getElement()=="email" ) {%>
					<span class="form-error"> <%= ex.getMessage()%> </span>
					<% }%>
				</div>
				<div
					class="form-field <%= ex.getElement() == &quot;password&quot; ? &quot;error&quot; : &quot;&quot;%>"
				>
					<span class="form-label">Password</span>
					<div class="relative">
						<input
							style="width: 100%"
							type="password"
							class="form-input"
							name="password"
							id="password"
						/>
						<button class="btn icon-btn" id="showBtn">
							<i class="bx bxs-show"></i>
						</button>
					</div>
					<% if (ex.getElement()=="password" ) {%>
					<span class="form-error"> <%= ex.getMessage()%> </span>
					<% }%>
				</div>
				<a href="ForgetPassword" class="forgot-link"
					>Forgot Password?</a
				>
				<div class="flex flex-col mt50 mb40">
					<button type="submit" class="btn btn-primary login-btn">
						Login
					</button>
					<a
						href="Register"
						class="btn btn-secondary text-center mt10 bg-primary-lighter p10 text-primary br5 create-btn"
					>
						Create new Account
					</a>
				</div>
			</form>
			<div class="footer flex align-center py10 justify-center flex-wrap">
				<a href="#">About us</a>
				<i class="bx bxs-circle"></i>
				<a href="#">Terms and Services</a>
				<i class="bx bxs-circle"></i>
				<a href="#">Copyright</a>
			</div>
		</div>
	</body>
	<script>
		let showBtn = document.querySelector("#showBtn");
		let icon = document.querySelector("#showBtn i");
		let passwordField = document.querySelector("#password");
		let passwordShown = false;

		showBtn.addEventListener("click", (event) => {
			event.preventDefault();
			passwordField.setAttribute(
				"type",
				passwordShown ? "password" : "text"
			);
			passwordShown = !passwordShown;
			if (passwordShown) {
				icon.classList.add("bxs-hide");
				icon.classList.remove("bxs-show");
			} else {
				icon.classList.remove("bxs-hide");
				icon.classList.add("bxs-show");
			}
		});
	</script>
</html>
