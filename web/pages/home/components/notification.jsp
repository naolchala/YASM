<%@page import="java.time.format.TextStyle"%>
<%@page import="java.util.Locale"%>
<%@page import="Models.Constants.NotificationType"%>
<%@page import="Models.Notification"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Models.User"%>
<%@page import="Utils.ServletUtils"%>

<% User user = ServletUtils.getCurrentUser(request); %>
<% ArrayList<Notification> notifications = Notification.getNotifications(user);%>

<aside class="notifications-container">
    <h1 class="title">Recent Notifications</h1>
    <div class="flex flex-col flex-gap-10 pt20">
	<% for (Notification n : notifications) {%>
	<div class="notification-item unseen">
	    <div class="icon-container">

		<i class="bx <%= n.getIconClass()%>"></i>
	    </div>
	    <div class="flex flex-col flex-1">
		<span class="desc">
		    <b class="name"><%= n.from.getFullname()%></b> <%= n.getMessage()%>
		</span>
		    <span class="time"> <%= ServletUtils.getFromNow(n.datetime) %> </span>
	    </div>
	</div>
	<% }%>

    </div>
</aside>
