<%@page import="Models.Constants.CommentReactionTypes"%>
<%@page import="Models.Comment"%>
<%@page import="Models.Story"%>
<%@page import="Models.Blog"%>
<%@page import="Models.Choice"%>
<%@page import="Models.Poll"%>
<%@page import="Models.Constants.PostTypes"%>
<%@page import="Models.Post"%>
<%
	User current = ServletUtils.getCurrentUser(request);
	Post post = (Post) request.getAttribute("post");
	ArrayList<Comment> comments = (ArrayList<Comment>) request.getAttribute("comments");
%>

<!DOCTYPE html>
<html lang="en">
    <head>
	<%@include file="components/common-head.jsp" %>
	<link rel="stylesheet" href="static/css/post.css" />
    </head>

    <body class="full-page flex flex-col">
	<%@include file="components/navbar.jsp" %>
	<div class="container flex-1">
	    <%@include file="components/side-menu.jsp" %>
	    <main class="posts-container bg-white">
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
			    <span class="time"><%= ServletUtils.getFromNow(post.postedAt)%></span>
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

			<h1 class="title">
			    <%= blog.title%>
			</h1>
			<input type="hidden" value="<%=  blog.content %>" id="blg" />
			<p class="caption" id="content">
			    
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
			<p class="caption pt0"><%= poll.totalVotes%> people voted</p>
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
				<span class="num"><%= post.commentCount%></span>
				<span>Comments</span>
			    </span>
			</a>
		    </footer>
		</div>

		<div class="input-and-comments-wrapper">
		    <form action="PostComment" method="post" class="comment-input">
			<input type="hidden" name="postId" value="<%= post.id%>" hidden>
			<textarea placeholder="Write your comment here..."
				  name="comment"
				  id="comment"
				  rows="4"></textarea>
			<button class=" btn btn-primary send-btn">
			    <span>Comment</span>
			    <i class="icon bx bxs-send"></i>
			</button>
		    </form>
		    <div class="comments-container">
			<h2>
			    Comments
			</h2>
			<div class="comments-wrapper">
			    <% if (comments.isEmpty()) { %>
			    <div class="empty-wrapper">
				<img src="static/images/comment-empty.svg" />
				<h3>Be the first to comment</h3>
			    </div>
			    <% } else {%>
			    <% for (Comment comment : comments) {%>
			    <div class="comment">
				<header>
				    <img src="<%= comment.user.getProfileUrl()%> " alt="" class="avatar"
					 style="--size: 45px">
				    <div class="flex flex-col">
					<h4 class="name"><%= comment.user.getFullname()%></h4>
					<span class="time"><%= ServletUtils.getFromNow(comment.commentedAt)%></span>
				    </div>
				</header>
				<article>
				    <p>
					<%= comment.content%>
				    </p>
				</article>
				<footer>
				    <a href="VoteComment?postId=<%= post.id%>&commentId=<%= comment.id%>&type=upvote"
				       class="icon-btn
				       <%= comment.getUserReaction(current.id) == CommentReactionTypes.UPVOTE
					       ? "selected" : ""%>"
				       >
					<i class="bx bx-chevron-up"></i>
				    </a>
				    <span><%= comment.getResult()%></span>
				    <a href="VoteComment?postId=<%= post.id%>&commentId=<%= comment.id%>&type=downvote" 
				       class="icon-btn
				       <%= comment.getUserReaction(current.id) == CommentReactionTypes.DOWNVOTE
					       ? "selected" : ""%>"
				       >
					<i class="bx bx-chevron-down"></i>
				    </a>
				</footer>
			    </div>
			    <% }%>
			    <%}%>
			</div>
		    </div>
		</div>
	    </main>
	    <%@include file="components/notification.jsp" %>
	</div>
    </body>
    <% if (post.type == PostTypes.BLOG) {%>
    <script src="static/editor/marked.min.js"></script>
    <script>
            let contentDiv = document.getElementById("content")
	    let blog = document.getElementById("blg");
            contentDiv.innerHTML = marked.parse(blg.value);
    </script>
    <%}%>
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