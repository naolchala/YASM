<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>YASM</title>
		<link rel="stylesheet" href="../../static/css/icons/css/boxicons.css" />
		<link rel="stylesheet" href="../../static/css/fonts.css" />
		<link rel="stylesheet" href="../../static/css/common.css" />
		<link rel="stylesheet" href="../../static/css/home.css" />
	</head>
	<body class="full-page flex flex-col">
		<%@include file="components/navbar.jsp" %>
		<div class="container flex-1">
			<%@include file="components/side-menu.jsp" %>
			<main class="posts-container">
				<div class="friend-requests-container">
					<h2 class="sub-title">Friend Requests</h2>
					<div class="friends-list">
						<div class="friend-item">
							<img
								class="avatar"
								src="../../static/images/friend_1.jpg"
								alt=""
							/>
							<div class="text-cont">
								<h4>Ester Horward</h4>
								<span>esterhorward@gmail.com</span>
							</div>
							<div class="actions">
								<a href="#accept" class="accept">Accept</a>
								<a href="#decline" class="decline">Decline</a>
							</div>
						</div>
						<div class="friend-item">
							<img
								class="avatar"
								src="../../static/images/friend_2.jpg"
								alt=""
							/>
							<div class="text-cont">
								<h4>Rich Harris</h4>
								<span>richharris@gmail.com</span>
							</div>
							<div class="actions">
								<a href="#accept" class="accept">Accept</a>
								<a href="#decline" class="decline">Decline</a>
							</div>
						</div>
						<div class="friend-item">
							<img
								class="avatar"
								src="../../static/images/friend_1.jpg"
								alt=""
							/>
							<div class="text-cont">
								<h4>Ester Horward</h4>
								<span>esterhorward@gmail.com</span>
							</div>
							<div class="actions">
								<a href="#accept" class="accept">Accept</a>
								<a href="#decline" class="decline">Decline</a>
							</div>
						</div>
					</div>
					<a
						href="#more"
						class="flex flex-row align-center text-center p10 text-primary mt40"
						style="align-self: center"
					>
						<span> Show all Requests </span>
						<i class="bx bx-chevron-right"></i>
					</a>
				</div>
				<div class="friend-requests-container">
					<h2 class="sub-title">Suggested Friends</h2>
					<div class="friends-list">
						<div class="friend-item">
							<img
								class="avatar"
								src="../../static/images/friend_3.jpg"
								alt=""
							/>
							<div class="text-cont">
								<h4>Mr. Alfonso Beer</h4>
								<span>alfonsobeer@gmail.com</span>
							</div>
							<div class="actions">
								<a href="#accept" class="accept">
									Send Request
								</a>
							</div>
						</div>
						<div class="friend-item">
							<img
								class="avatar"
								src="../../static/images/friend_2.jpg"
								alt=""
							/>
							<div class="text-cont">
								<h4>Rich Harris</h4>
								<span>richharris@gmail.com</span>
							</div>
							<div class="actions">
								<a href="#accept" class="accept">
									Send Request
								</a>
							</div>
						</div>
						<div class="friend-item">
							<img
								class="avatar"
								src="../../static/images/friend_1.jpg"
								alt=""
							/>
							<div class="text-cont">
								<h4>Ester Horward</h4>
								<span>esterhorward@gmail.com</span>
							</div>
							<div class="actions">
								<a href="#accept" class="accept">
									Send Request
								</a>
							</div>
						</div>
						<div class="friend-item">
							<img
								class="avatar"
								src="../../static/images/friend_1.jpg"
								alt=""
							/>
							<div class="text-cont">
								<h4>Ester Horward</h4>
								<span>esterhorward@gmail.com</span>
							</div>
							<div class="actions">
								<a href="#accept" class="accept">
									Send Request
								</a>
							</div>
						</div>
					</div>
					<a
						href="#more"
						class="flex flex-row align-center text-center p10 text-primary mt40"
						style="align-self: center"
					>
						<span> Show all Suggestions</span>
						<i class="bx bx-chevron-right"></i>
					</a>
				</div>
			</main>

			<%@include file="components/notification.jsp" %>
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
