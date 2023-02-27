<%@page import="Models.Constants.SearchTypes"%>
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
	    <% request.setAttribute("current-page", "explore");
	    %> 
	    <%@include file="components/side-menu.jsp" %>
	    <main class="posts-container search-page">
		<div class="friend-requests-container m-20">
		    <h2 class="mb10">ASTU Software Engineering</h2>
		    <h3 class="mb40">Section 2</h3>
		    <section class="friends-list users">
			<div class="friend-item">
			    <img class="avatar" src="static/images/Us/eden.jpg" alt="" />
			    <div class="text-cont">
				<h4>Eden Birhan</h4>
				<span>UGR/22779/13</span>
			    </div>


			</div>
			<div class="friend-item">
			    <img class="avatar" src="static/images/Us/ephy.jpg" alt="" />
			    <div class="text-cont">
				<h4>Ephrem Getachew</h4>
				<span>UGR/22512/13</span>
			    </div>
			</div>
			<div class="friend-item">
			    <img class="avatar" src="static/images/Us/guyatu.jpg" alt="" />
			    <div class="text-cont">
				<h4>Guyatu Gelgelo</h4>
				<span>UGR/23292/13</span>
			    </div>

			</div>
			<div class="friend-item">
			    <img class="avatar" src="static/images/Us/hayat.jpeg" alt="" />
			    <div class="text-cont">
				<h4>Hayat Shemsu</h4>
				<span>UGR/23107/13</span>
			    </div>
			</div>
			<div class="friend-item">
			    <img class="avatar" src="static/images/Us/naol.png" alt="" />
			    <div class="text-cont">
				<h4>Naol Chala</h4>
				<span>UGR/22527/13</span>
			    </div>
			</div>

		    </section>
		</div> 
	    </main>
	    <%@include file="components/notification.jsp" %>
	</div>
    </body>
    <script>
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
