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
	    <%@include file="components/side-menu.jsp" %>
	    <% SearchTypes type = (SearchTypes) request.getAttribute("type");%>
	    <main class="posts-container search-page">
		
		<%
			switch (type) {
				case USER:
		%>
		<% ArrayList<User> result = (ArrayList<User>) request.getAttribute("users");%>
		<div class="friend-requests-container m-20">
		    <h2 class="sub-title"><%= result.size()%> results found</h2>
		    <section class="friends-list users">
			<%  for (User u : result) {%>
			<div class="friend-item">
			    <img class="avatar" src="<%= u.getProfileUrl()%>" alt="" />
			    <div class="text-cont">
				<h4><%= u.getFullname()%></h4>
				<span><%= u.email%></span>
			    </div>
			    <div class="actions">
				<a href="SendRequest?id=<%= u.id%>" class="accept">
				    Send Request
				</a>
			    </div>
			</div>
			<% }%>
		    </section>
		</div> 
		<%
				break;
			default:
		%>				
		<div class="flex flex-col flex-gap-20">
		    <div class="posts-containerr">
			<div class="post story">
			    <header>
				<img
					src="../../static/images/profile-picture.jpg"
					alt="person"
					/>
				<div class="text-cont">
				    <span class="name">Kathryn Murphy</span>
				    <span class="time">2 hours ago</span>
				</div>
			    </header>
			    <article>
				<img
					src="../../static/images/login_page.jpg"
					alt=""
					/>
				<p class="caption">
				    Lorem ipsum dolor sit amet consectetur
				    adipisicing elit. Inventore quasi ducimus
				    molestiae iure iste consequuntur architecto
				    recusandae sequi fuga corrupti atque odio,
				    vitae nulla unde eveniet. Earum iste
				    doloribus voluptates.
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
		    </div>
		</div>

		<%
			}
		%>


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
