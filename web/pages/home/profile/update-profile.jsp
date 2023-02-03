<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>YASM</title>
	<link rel="stylesheet" href="static/css/icons/css/boxicons.css" />
	<link rel="stylesheet" href="static/css/fonts.css" />
	<link rel="stylesheet" href="static/css/common.css" />
	<link rel="stylesheet" href="static/css/home.css" />
</head>

<body class="full-page flex flex-col">
	<%@include file="../components/navbar.jsp" %>
		<div class="container flex-1">
			<%@include file="../components/side-menu.jsp" %>
				<main class="profile-container">
					<div class="profile-container-wrapper">
						<div class="img-container">
							<img src="static/images/friend_3.jpg" alt="" />
							<button type="submit" class="btn btn-primary login-btn mb50">
								Change Profile Picture
							</button>
						</div>
						<h2 class="flex mb40 justify-center align-center text-primary">
							Edit Information
						</h2>
						<div class="basic-info">
							<div class="Basic-info-label">
								<h3 class="mb20">Basic Info</h3>
							</div>
							<div class="basic-info-field">
								<div class="form-field flex-1">
									<span class="form-label">First Name</span>
									<input type="text" class="form-input" name="email" id="email" />
								</div>
								<div class="form-field flex-1">
									<span class="form-label">Last Name</span>
									<input type="text" class="form-input" name="email" id="email" />
								</div>
							</div>
						</div>
						<div class="security-container mt10">
							<div class="security-label mb20">
								<h3 class="">Security</h3>
							</div>
							<div class="security-field">
								<div class="flex flex-row flex-gap-20">
									<div class="form-field flex-1">
										<span class="form-label">Password</span>
										<input type="password" class="form-input" name="password" required />
									</div>
									<div class="form-field flex-1">
										<span class="form-label">
											Confirm Password
										</span>
										<input type="password" class="form-input" name="confirmPassword" required />
									</div>
								</div>
								<div class="flex flex-col">
									<div class="form-field">
										<span class="form-label">
											Security Question
										</span>
										<select class="form-input">
											<option value="What is your hometown?">
												What is your hometown?
											</option>

											<option value="What is your favorite color?">
												What is your favorite color?
											</option>
											<option value="What is your favorite movie?">
												What is your favorite movie?
											</option>
											<option value="What is the name of your high school?">
												What is the name of your high
												school?
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
									<div class="form-field">
										<span class="form-label">Security Answers</span>
										<input type="password" class="form-input" name="confirmPassword" required />
									</div>
								</div>
							</div>
						</div>
						<div class="flex flex-col mt40 mb20">
							<button class="btn btn-primary login-btn">
								Update Profile
							</button>
						</div>
					</div>
				</main>
				<%@include file="../components/notification.jsp" %>
		</div>
</body>
<script>
	let menuItems = [...document.querySelectorAll(".menu-item")];
	menuItems.forEach((menuItem) => {
		menuItem.addEventListener("mouseover", (e) => {
			menuItem.children[0].classList.add("bx-tada");
		});

		menuItem.addEventListener("mouseleave", (e) => {
			menuItem.children[0].classList.remove("bx-tada");
		});
	});

	let actionBtns = [...document.querySelectorAll(".action-btn")];
	actionBtns.forEach((btn) => {
		btn.addEventListener("mouseover", (e) => {
			btn.children[0].classList.add("bx-tada");
		});

		btn.addEventListener("mouseleave", (e) => {
			btn.children[0].classList.remove("bx-tada");
		});
	});
</script>

</html>