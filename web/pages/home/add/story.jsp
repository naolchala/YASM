<!DOCTYPE html>
<html lang="en">

    <head>
	<%@include file="../components/common-head.jsp" %>
	<link rel="stylesheet" href="static/css/add.css" />
    </head>

    <body class="full-page flex flex-col">
	<%@include  file="../components/navbar.jsp" %>
	<div class="container flex-1">
	    <% request.setAttribute("current-page", "add");
		   %>
	    <%@include  file="../components/side-menu.jsp" %>
	    <main class="posts-container">
		<form action="" method="post" enctype="multipart/form-data" class="upload-container p30">
		    <h1 class="title mb40">Post a Story</h1>
		    <div class="img-container" id="imgContainer">
			<label class="upload-button" for="photo">
			    <div class="upload-button-wrapper">
				<i class="bx bxs-cloud-upload"></i>
			    </div>
			    <input id="photo" name="photo" type="file" accept=".png, .jpg, .jpeg, .webp, .svg" required />
			</label>
			<img id="preview" />
		    </div>

		    <div class="form-field mt40">
			<span class="form-label">Caption</span>
			<textarea rows="2" name="caption" class="form-input caption-input"></textarea>
		    </div>

		    <button style="width: 100%;" class="btn btn-primary mt40">
			Create Story
		    </button>
		</form>
	    </main>
	    <%@include  file="../components/notification.jsp" %>
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

            let photoUploader = document.querySelector("#photo");
            let photoPreview = document.querySelector("#preview");
            let imgContaier = document.querySelector("#imgContainer");

            photoUploader.addEventListener("change", (event) => {
                photoPreview.setAttribute("src", URL.createObjectURL(event.target.files[0]));
                imgContaier.classList.add("uploaded");

            });
    </script>

</html>