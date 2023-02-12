<!DOCTYPE html>
<html lang="en">

    <head>
	<%@include file="../components/common-head.jsp" %>
	<link rel="stylesheet" href="static/css/add.css" />
	<link rel="stylesheet" href="static/editor/simplemde.min.css">
    </head>

    <body class="full-page flex flex-col">
	<%@include  file="../components/navbar.jsp" %>
	<div class="container flex-1">
	    <% request.setAttribute("current-page", "add");
		   %>
	    <%@include  file="../components/side-menu.jsp" %>
	    <main class="posts-container">
		<form action="PostBlog" method="post" class="upload-container p30">
		    <h1 class="title mb20">Post a Blog</h1>
		    <div class="form-field mt20">
			<span class="form-label">Title</span>
			<textarea rows="2" name="title" class="form-input caption-input"
				  style="font-size: 30px; font-family: 'Raleway'; font-weight: bold;"></textarea>
		    </div>
		    <div class="form-field mt20">
			<!--<span class="form-label">Content</span>--> 
			<textarea rows="100" name="content" id="contentEditor"></textarea>
		    </div>

		    <button style="width: 100%;" class="btn btn-primary mt40">
			Create Blog
		    </button>
		</form>
	    </main>
	    <%@include  file="../components/notification.jsp" %>
	</div>
    </body>

    <script src="static/editor/simplemde.min.js"></script>
    <script>
            let contentEditor = document.getElementById("contentEditor");
            let SME = new SimpleMDE({
                element: contentEditor,
                forceSync: true,

            });


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