<%@page import="Models.Choice"%>
<%@page import="Models.Poll"%>
<%@page import="Models.Blog"%>
<%@page import="Models.Story"%>
<%@page import="Models.Post"%>
<% User current = ServletUtils.getCurrentUser(request); %>
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
		<% ArrayList<Post> posts = (ArrayList<Post>) request.getAttribute("posts"); %>
		<% for (Post post : posts) {%>
		<div class="post <%= post.type.toString().toLowerCase()%>" id="<%= post.id %>">
		    <header>
			<img
				src="<%= post.postedBy.getProfileUrl()%>"
				alt="<%= post.postedBy.getFullname()%>"
				/>
			<div class="text-cont">
			    <span class="name"><%= post.postedBy.getFullname()%></span>
			    <span class="time">2 hours ago</span>
			</div>
		    </header>

		    <% switch (post.type) {
				    case STORY: {
					    Story story = (Story) post;
		    %>

		    <article>
			<img src="<%= story.getPhotoUrl()%>" alt="" />
			<% if (!story.caption.equals("") && story != null) {%>
			<p class="caption">
			    <%= story.caption%>
			</p>
			<% }%>
		    </article>
		    <%
				    break;
			    }
			    case BLOG: {
				    Blog blog = (Blog) post;
		    %>
		    <article>
			<a>
			    <h2 class="title">
				<%= blog.title%>
			    </h2>
			</a>
			<p class="caption">
			    <% if (blog.content.length() < 400) {
					    out.print(blog.content);
				    } else {
					    out.print(blog.content.substring(0, 400));
				    }
			    %>

			</p>
		    </article>
		    <%
				    break;
			    }

			    case POLL: {
				    Poll poll = (Poll) post;
		    %>
		    <article>
			<h2><%= poll.title%></h2>
			<div class="choices-container">
			    <% for (Choice choice : poll.choices) {%>
			    <a href="Vote?id=<%= choice.id%>">
				<div class="choice" style="--width: 20%">
				    <span class="content"><%= choice.content%></span>
				    <!-- <span class="value">20%</span> -->
				</div>
			    </a>
			    <% }%>
			</div>
		    </article>
		    <%
					    break;
				    }
				    default:
					    break;
			    }
		    %>

		    <footer>
			<a href="Like?id=<%= post.id %>" class="action-btn <%= post.isLiked(current) ? "liked" : "" %>">
			    <span class="icon">
				<i class="bx bxs-like"></i>
			    </span>
			    <span class="stat">
				<span class="num"><%= post.reactions.size() %></span>
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
		<% }%>

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
