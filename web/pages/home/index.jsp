<%@page import="Models.Constants.PostTypes"%>
<%@page import="Models.Choice"%>
<%@page import="Models.Poll"%>
<%@page import="Models.Blog"%>
<%@page import="Models.Story"%>
<%@page import="Models.Post"%>
<% User current = ServletUtils.getCurrentUser(request); %>
<!DOCTYPE html>
<html lang="en">
    <head>
	<%@include file="components/common-head.jsp" %>
    </head>
    <body class="full-page flex flex-col">
	<%@include file="components/navbar.jsp" %>
	<div class="container flex-1">
	    <% request.setAttribute("current-page", "home"); %>
	    <%@include file="components/side-menu.jsp" %>
	    <main class="posts-container">
		<% ArrayList<Post> posts = (ArrayList<Post>) request.getAttribute("posts"); %>
		
		<% if (posts.isEmpty()) { %>
		<div class="empty-wrapper">
		    <img src="static/images/posts-empty.svg" alt="empty" />
		    <h3>Connect with friends and comeback</h3>
		</div>
		<% } else { %>
		<% for (Post post : posts) {%>
		<div class="post
		     <%= post.type.toString().toLowerCase()%>
		     <%= post.type == PostTypes.POLL && ((Poll) post).isVoted(current) ? "voted" : ""%>" 
		     id="<%= post.id%>"
		     >
		    <header>
			<img
				loading="lazy"
				src="<%= post.postedBy.getProfileUrl()%>"
				alt="<%= post.postedBy.getFullname()%>"
				/>
			<div class="text-cont">
			    <span class="name"><%= post.postedBy.getFullname()%></span>
			    <span class="time"><%= ServletUtils.getFromNow(post.postedAt) %></span>
			</div>
		    </header>

		    <% switch (post.type) {
				    case STORY: {
					    Story story = (Story) post;
		    %>

		    <article>
			<img loading="lazy" src="<%= story.getPhotoUrl()%>" alt="" />
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
			<a href="PostPage?id=<%= blog.id %>">
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
			<p class="caption pt0"><%= poll.totalVotes %> people voted</p>
			<div class="choices-container">
			    <% for (Choice choice : poll.choices) {%>
			    <% if (poll.votedChoice == null) {%>
			    <a href="VotePoll?choiceId=<%= choice.id%>&pollId=<%= poll.id%>">
				<div 
					class="choice
					<%= poll.votedChoice != null && choice.id.equals(poll.votedChoice.choiceId)
						? "voted" : ""%>"
					style="--width: 20%">
				    <span class="content"><%= choice.content%></span>
				</div>
			    </a>
			    <% } else {%>
			    <div 
				    class="choice
				    <%= poll.votedChoice != null && choice.id.equals(poll.votedChoice.choiceId)
					    ? "voted" : ""%>"
				    style="--width: <%= choice.voteCount * 100 / poll.totalVotes%>%">
				<span class="content"><%= choice.content%></span>
				<span class="value"><%= choice.voteCount * 100 / poll.totalVotes%>%</span> 

			    </div>
			    <%}%>
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
			<a href="Like?id=<%= post.id%>" class="action-btn <%= post.isLiked(current) ? "liked" : ""%>">
			    <span class="icon">
				<i class="bx bxs-like"></i>
			    </span>
			    <span class="stat">
				<span class="num"><%= post.reactions.size()%></span>
				<span>Likes</span>
			    </span>
			</a>

			<a href="PostPage?id=<%= post.id%>" class="action-btn">
			    <span class="icon">
				<i class="bx bxs-comment"></i>
			    </span>
			    <span class="stat">
				<span class="num"><%= post.commentCount %></span>
				<span>Comments</span>
			    </span>
			</a>
		    </footer>
		</div>
		<% }%>


		<div class="pagination">
		   
		    <% if (((int)request.getAttribute("page")) > 1) { %>
		    <a href=".?page=${requestScope["page"] -1}">
			<i class="bx bx-chevron-left"></i>
		    </a>
			<% }%>
		    <a href="#3" class="active">${requestScope["page"]}</a>
		    <a href=".?page=${requestScope["page"] + 1}">
			<i class="bx bx-chevron-right"></i>
		    </a>
		</div>
		<% }%>
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
