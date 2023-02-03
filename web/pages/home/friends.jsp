<%@page import="java.util.ArrayList"%>
<%@page import="Models.User"%>
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
		<div class="friend-requests-container">
		    <h2 class="sub-title">Friend Requests</h2>
		    <% ArrayList<User> friendRequests = (ArrayList<User>) request.getAttribute("friendRequests");%>
		    <div class="friends-list <%= friendRequests.isEmpty() ? "empty" : ""%>">
			<% if (friendRequests.isEmpty()) {%>
			<div class="friend-item" style="align-self: center; justify-self: center; width: 1fr;">
			    <div class="text-cont">
				<h1 style='font-size: 64px'>
				    <i class="bx bx-user-plus"></i>
				</h1>
				<span>
				    You don't have any friend requests.
				</span>
			    </div>
			</div>
			<% } else { %>
			<% for (User u : friendRequests) {%>
			<div class="friend-item">
			    <img class="avatar" src="<%= u.getProfileUrl()%>" alt="" />
			    <div class="text-cont">
				<h4><%= u.getFullname()%></h4>
				<span><%= u.email%></span>
			    </div>
			    <div class="actions">
				<a href="AcceptRequest?id=<%= u.id%>&action=accept" class="accept">Accept</a>
				<a href="AcceptRequest?id=<%= u.id%>&action=decline" class="decline">Decline</a>
			    </div>
			</div>
			<% }
				}%>
		    </div>
		    <% if (!friendRequests.isEmpty()) {%>
		    <a href="#more" class="flex flex-row align-center text-center p10 text-primary mt40"
		       style="align-self: center">
			<span> Show all Requests </span>
			<i class="bx bx-chevron-right"></i>
		    </a>
		    <% }%>
		</div>
		<div class="friend-requests-container">
		    <h2 class="sub-title">Suggested Friends</h2>
		    <% ArrayList<User> suggestions = (ArrayList<User>) request.getAttribute("suggestions");%>
		    <div class="friends-list <%= suggestions.isEmpty() ? "empty" : ""%>">
			<% if (suggestions.isEmpty()) {%>
			<div class="friend-item" style="align-self: center; justify-self: center; width: 1fr;">
			    <div class="text-cont">
				<h1 style='font-size: 64px'>
				    <i class="bx bx-user-x"></i>
				</h1>
				<span>
				    We don't have any suggestions for you at the time.
				</span>
			    </div>
			</div>
			<% } else { %>
				<%  for (User u : suggestions) {%>
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
			<% }%>
		    </div>
		    <% if (!suggestions.isEmpty()) {%>
		    <a href="#more" class="flex flex-row align-center text-center p10 text-primary mt40"
		       style="align-self: center">
			<span> Show all Suggestions</span>
			<i class="bx bx-chevron-right"></i>
		    </a>
		    <% }%>
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