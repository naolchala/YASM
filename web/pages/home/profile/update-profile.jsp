<%@page import="Exceptions.FormException"%>
<%@page import="Models.User"%>
<% User currentUser = ServletUtils.getCurrentUser(request);%>
<% FormException ex = (FormException) request.getAttribute("formError");
	if (ex == null) {
		ex = new FormException("no-error", "");
	}
%>


<!DOCTYPE html>
<html lang="en">
    <head>
	<%@include file="../components/common-head.jsp" %>
    </head>

    <body class="full-page flex flex-col">
	<%@include file="../components/navbar.jsp" %>
	<div class="container flex-1">
	    <%@include file="../components/side-menu.jsp" %>
	    <main class="profile-container">
		<div class="profile-container-wrapper">

		    <form class="flex flex-col mb50" action="ChangeProfilePicture" method="post" enctype="multipart/form-data">
			<div class="img-container">
			    <div class="image-wrapper">
				<img id="preview" src="<%= currentUser.getProfileUrl()%>" alt="" />
				<label for="profileInput">
				    <i class="bx bx-cloud-upload"></i>
				</label>
			    </div>

			    <input type="file"
				   id="profileInput"
				   name="profile-picture"
				   style="display: none;"
				   accept="image/jpg, image/png, image/jpeg"
				   />
			    <button class="btn btn-primary login-btn" id="submitBtn" style="display: none;">
				Change Profile Picture
			    </button>
			</div>
		    </form>

		    <h2 class="flex mb40 justify-center align-center text-primary" >
			Edit Information
		    </h2>

		    <form action="UpdateName" method="post" class="basic-info mb40">
			<div class="Basic-info-label">
			    <h3 class="mb20">Basic Info</h3>
			</div>
			<div class="basic-info-field">
			    <div class="form-field flex-1 <%= ex.getElement() == "firstName" ? "error" : ""%>">
				<span class="form-label">First Name</span>
				<input type="text" value="<%= currentUser.firstName%>" class="form-input" name="firstName" id="firstName" />
				<% if (ex.getElement() == "firstName") {%>
				<span class="form-error">
				    <%= ex.getMessage()%>
				</span> 
				<% }%>
			    </div>
			    <div class="form-field flex-1">
				<span class="form-label">Last Name</span>
				<input type="text"  value="<%= currentUser.lastName%>"  class="form-input" name="lastName" id="lastName" />
			    </div>

			</div>
			<button class="btn btn-primary" style="align-self: flex-end">Change Name</button>
		    </form>


		    <div class="security-container mt50">
			<h3 class="mb20">Security</h3>
			<form action="UpdatePassword" method="post">
			    <div class="security-field flex flex-col">
				<div class="form-field flex-1 <%= ex.getElement() == "currentPassword" ? "error" : ""%>">
				    <span class="form-label">
					Current Password
				    </span>
				    <input type="password" class="form-input" name="currentPassword" required />
				    <% if (ex.getElement() == "currentPassword") {%>
				    <span class="form-error">
					<%= ex.getMessage()%>
				    </span> 
				    <% }%>
				</div>
				<div class="flex flex-row flex-gap-20">
				    <div class="form-field flex-1 <%= ex.getElement() == "password" ? "error" : ""%> ">
					<span class="form-label">New Password</span>
					<input type="password" class="form-input" name="newPassword" required />
					<% if (ex.getElement() == "password") {%>
					<span class="form-error">
					    <%= ex.getMessage()%>
					</span> 
					<% }%>
				    </div>
				    <div class="form-field flex-1">
					<span class="form-label">
					    Confirm Password
					</span>
					<input type="password" class="form-input" name="confirmPassword" required />
				    </div>
				</div>
				<button type="submit" class="btn btn-primary" style="align-self: flex-end">Change Password</button>
			    </div>
			</form>
		    </div>
		    <div class="mt50">
			<h3 class="mb20">Recovery Setting</h3>
			<form method="post" action="UpdateSecurity" class="flex flex-col">
			    <div class="form-field">
				<span class="form-label">
				    Security Question
				</span>
				<select name="secQuestion" class="form-input">
				    <option value="What is your hometown?">
					What is your hometown?
				    </option>

				    <option value="What is your favorite color?">
					What is your favorite color?
				    </option>
				    <option value="What is your favorite movie?">
					What is your favorite movie?
				    </option>
				    <option value="What is the name of your high school?">
					What is the name of your high
					school?
				    </option>
				    <option value="What is your favorite sports team?">
					What is your favorite sports team?
				    </option>
				    <option value="What is your favorite book?">
					What is your favorite book?
				    </option>
				    <option value="What street did you grow up on?">
					What street did you grow up on?
				    </option>
				    <option value="Who was your first grade teacher?">
					Who was your first grade teacher?
				    </option>
				</select>
			    </div>
			    <div class="form-field  <%= ex.getElement() == "secAnswer" ? "error" : ""%>">
				<span class="form-label">Security Answers</span>
				<input type="text" class="form-input" name="secAnswer" required />
				<% if (ex.getElement() == "secAnswer") {%>
				<span class="form-error">
				    <%= ex.getMessage()%>
				</span> 
				<% }%>
			    </div>
			    <button class="btn btn-primary" style="align-self: flex-end">Change Recovery</button>
			</form>
		    </div>
		</div>
	    </main>
	    <%@include file="../components/notification.jsp" %>
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

            let preview = document.querySelector("#preview");
            let profileInput = document.querySelector("#profileInput");
            let submitBtn = document.querySelector("#submitBtn");

            profileInput.addEventListener("change", event => {
                preview.setAttribute("src", URL.createObjectURL(event.target.files[0]));
                submitBtn.style.display = "flex";
            });



    </script>

</html>