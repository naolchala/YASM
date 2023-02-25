<%@page import="Utils.ServletUtils"%>

<div class="header">
    <h1 class="title">YASM</h1>
    <div class="search-field-container">
	<form action="Search" method="GET" class="search-field">
	    <input placeholder="Search" value="${param["keyword"]}" type="text" name="keyword" />
	    <button class="btn icon-btn search-btn">
		<i class="bx bx-search-alt"></i>
	    </button>
	</form>
    </div>
    <div class="profile-tag">
	<div class="p5 mr10 bg-primary-lighter flex align-center justify-center" style="border-radius: 100%">
	    <img style="--size: 40px" class="avatar" src="<%= ServletUtils.getCurrentUser(request).getProfileUrl()%>" alt="alt"/>
	</div>
	<div class="name-col flex flex-col">
	    <span class="name"><%= ServletUtils.getCurrentUser(request).getFullname()%></span>
	    <span class="email"><%= ServletUtils.getCurrentUser(request).email%></span>
	</div>
	<a href="Logout" class="btn icon-btn logout-btn">
	    <i class="bx bx-log-out-circle"></i>
	</a>
    </div>
</div>
