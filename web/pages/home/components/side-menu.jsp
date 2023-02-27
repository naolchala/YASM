<% String current_page = request.getAttribute("current-page") != null ? (String) request.getAttribute("current-page") :  ""; %>
<aside class="side-bar">
    <a href="." class="menu-item <%= current_page.equals("home") ? "selected" : "" %> ">
	<div class="icon-container">
	    <i class="bx bxs-home-circle"></i>
	</div>
	<span>Home</span>
    </a>
    <a href="Explore" class="menu-item <%= current_page.equals("explore") ? "selected" : "" %>">
	<div class="icon-container">
	    <i class="bx bxs-compass"></i>
	</div>
	<span>Explore</span>
    </a>

    <label class="menu-item <%= current_page.equals("add") ? "selected" : "" %>">
	<div class="icon-container">
	    <i class="bx bxs-file-plus"></i>
	</div>
	<span>Add Post</span>
	<input type="checkbox" name="add-menu" id="addMenu" />
	<div class="sub-menu">
	    <div class="sub-menu-wrapper">
		<a href="PostStory" class="sub-menu-item">
		    <i class="bx bx-image"></i>
		    Add Story
		</a>
		<a href="PostBlog" class="sub-menu-item">
		    <i class="bx bxs-news"></i>
		    Add Blog
		</a>
		<a href="PostPoll" class="sub-menu-item">
		    <i class="bx bx-poll"></i>
		    Add Poll
		</a>
	    </div>
	</div>
    </label>
    <a href="FindFriends" class="menu-item <%= current_page.equals("friends") ? "selected" : "" %>">
	<div class="icon-container">
	    <i class="bx bxs-user-plus"></i>
	</div>
	<span>Friends</span>
    </a>
    <a href="AboutUs" class="menu-item <%= current_page.equals("about") ? "selected" : "" %>">
	<div class="icon-container">
	    <i class="bx bxs-face"></i>
	</div>
	<span>About Us</span>
    </a>
    <div class="flex-1"></div>
    <a href="ProfilePage" class="menu-item selected">
	<div class="icon-container">
	    <i class="bx bxs-user-circle"></i>
	</div>
	<span>Profile</span>
    </a>
    <div class="footer flex flex-col flex-wrap align-center py20">
	<div class="flex flex-row align-center">
	    <a href="#">YASM (Yet Another Social Media)</a>
	</div>
	<div
		class="flex flex-row align-center flex-wrap justify-center flex-gap-10"
		>
	    <a href="AboutUs">About us</a>
	    <i class="bx bxs-circle"></i>
	    <a href="#">Terms and Services</a>
	    <i class="bx bxs-circle"></i>
	    <a href="#">Copyright</a>
	</div>
    </div>
</aside>