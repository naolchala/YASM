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
		<%@include file="components/navbar.jsp" %>
		<div class="container flex-1">
		    <%@include file="components/side-menu.jsp" %>
			<main class="posts-container">
				<div class="post story">
					<header>
						<img
							src="static/images/profile-picture.jpg"
							alt="person"
						/>
						<div class="text-cont">
							<span class="name">Kathryn Murphy</span>
							<span class="time">2 hours ago</span>
						</div>
					</header>
					<article>
						<img src="static/images/login_page.jpg" alt="" />
						<p class="caption">
							Lorem ipsum dolor sit amet consectetur adipisicing
							elit. Inventore quasi ducimus molestiae iure iste
							consequuntur architecto recusandae sequi fuga
							corrupti atque odio, vitae nulla unde eveniet. Earum
							iste doloribus voluptates.
						</p>
					</article>
					<footer>
						<a href="#" class="action-btn">
							<span class="icon">
								<i class="bx bxs-like"></i>
							</span>
							<span class="stat">
								<span class="num">1K</span>
								<span>Likes</span>
							</span>
						</a>

						<a href="#" class="action-btn">
							<span class="icon">
								<i class="bx bxs-comment"></i>
							</span>
							<span class="stat">
								<span class="num">200</span>
								<span>Comments</span>
							</span>
						</a>
					</footer>
				</div>
				<div class="post story">
					<header>
						<img
							src="static/images/profile-picture.jpg"
							alt="person"
						/>
						<div class="text-cont">
							<span class="name">Kathryn Murphy</span>
							<span class="time">2 hours ago</span>
						</div>
					</header>
					<article>
						<img src="static/images/login_page.jpg" alt="" />
						<!-- <p class="caption"></p> -->
					</article>
					<footer>
						<a href="#" class="action-btn">
							<span class="icon">
								<i class="bx bxs-like"></i>
							</span>
							<span class="stat">
								<span class="num">1K</span>
								<span>Likes</span>
							</span>
						</a>

						<a href="#" class="action-btn">
							<span class="icon">
								<i class="bx bxs-comment"></i>
							</span>
							<span class="stat">
								<span class="num">200</span>
								<span>Comments</span>
							</span>
						</a>
					</footer>
				</div>
				<div class="post blog">
					<header>
						<img
							src="static/images/profile-picture.jpg"
							alt="person"
						/>
						<div class="text-cont">
							<span class="name">Kathryn Murphy</span>
							<span class="time">2 hours ago</span>
						</div>
					</header>
					<article>
						<a>
							<h2 class="title">
								10 Things you should know before starting
								Servlet
							</h2>
						</a>
						<p class="caption">
							Lorem ipsum dolor sit amet consectetur adipisicing
							elit. Inventore quasi ducimus molestiae iure iste
							consequuntur architecto recusandae sequi fuga
							corrupti atque odio, vitae nulla unde eveniet. Earum
							iste doloribus voluptates.
						</p>
					</article>
					<footer>
						<a href="#" class="action-btn">
							<span class="icon">
								<i class="bx bxs-like"></i>
							</span>
							<span class="stat">
								<span class="num">1K</span>
								<span>Likes</span>
							</span>
						</a>

						<a href="#" class="action-btn">
							<span class="icon">
								<i class="bx bxs-comment"></i>
							</span>
							<span class="stat">
								<span class="num">200</span>
								<span>Comments</span>
							</span>
						</a>
					</footer>
				</div>
				<div class="post poll">
					<header>
						<img
							src="static/images/profile-picture.jpg"
							alt="person"
						/>
						<div class="text-cont">
							<span class="name">Kathryn Murphy</span>
							<span class="time">2 hours ago</span>
						</div>
					</header>
					<article>
						<h2>What is the best programming language?</h2>
						<div class="choices-container">
							<a href="vote?id=123">
								<div class="choice" style="--width: 20%">
									<span class="content">Java</span>
									<!-- <span class="value">20%</span> -->
								</div>
							</a>
							<a href="vote?id=123">
								<div class="choice" style="--width: 30%">
									<span class="content">Python</span>
									<!-- <span class="value">30%</span> -->
								</div>
							</a>
							<a href="vote?id=123">
								<div class="choice" style="--width: 10%">
									<span class="content">C++</span>
									<!-- <span class="value">10%</span> -->
								</div>
							</a>
							<a href="vote?id=123">
								<div class="choice voted" style="--width: 40%">
									<span class="content">Javascript</span>
									<!-- <span class="value">40%</span> -->
								</div>
							</a>
						</div>
					</article>
					<footer>
						<a href="#" class="action-btn">
							<span class="icon">
								<i class="bx bxs-like"></i>
							</span>
							<span class="stat">
								<span class="num">1K</span>
								<span>Likes</span>
							</span>
						</a>

						<a href="#" class="action-btn">
							<span class="icon">
								<i class="bx bxs-comment"></i>
							</span>
							<span class="stat">
								<span class="num">200</span>
								<span>Comments</span>
							</span>
						</a>
					</footer>
				</div>
				<div class="post poll voted">
					<header>
						<img
							src="static/images/profile-picture.jpg"
							alt="person"
						/>
						<div class="text-cont">
							<span class="name">Kathryn Murphy</span>
							<span class="time">2 hours ago</span>
						</div>
					</header>
					<article>
						<h2>What is the best programming language?</h2>
						<p class="caption pt0">100,304 people voted</p>
						<div class="choices-container">
							<div class="choice" style="--width: 20%">
								<span class="content">Java</span>
								<span class="value">20%</span>
							</div>
							<div class="choice" style="--width: 30%">
								<span class="content">Python</span>
								<span class="value">30%</span>
							</div>
							<div class="choice" style="--width: 10%">
								<span class="content">C++</span>
								<span class="value">10%</span>
							</div>
							<div class="choice voted" style="--width: 40%">
								<span class="content">Javascript</span>
								<span class="value">40%</span>
							</div>
						</div>
					</article>
					<footer>
						<a href="#" class="action-btn">
							<span class="icon">
								<i class="bx bxs-like"></i>
							</span>
							<span class="stat">
								<span class="num">1K</span>
								<span>Likes</span>
							</span>
						</a>

						<a href="#" class="action-btn">
							<span class="icon">
								<i class="bx bxs-comment"></i>
							</span>
							<span class="stat">
								<span class="num">200</span>
								<span>Comments</span>
							</span>
						</a>
					</footer>
				</div>

				<div class="pagination">
					<a href="#-1">
						<i class="bx bx-chevron-left"></i>
					</a>
					<a href="#2">1</a>
					<a href="#3" class="active">2</a>
					<a href="#4">3</a>
					<a href="#5">
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
