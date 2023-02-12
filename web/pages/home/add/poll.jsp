<!DOCTYPE html>
<html lang="en">

    <head>
	<%@include file="../components/common-head.jsp" %>
    </head>

    <body class="full-page flex flex-col">
	<%@include file="../components/navbar.jsp" %>
	<div class="container flex-1">
	    <% request.setAttribute("current-page", "add");
		   %>
	    <%@include file="../components/side-menu.jsp" %>
	    <main class="posts-container">
		<form action="PostPoll" method="post" class="upload-container p30">
		    <h1 class="title mb20">Post a Poll</h1>
		    <div class="form-field mt20">
			<span class="form-label">Title</span>
			<textarea rows="2" name="title" class="form-input caption-input"
				  style="font-size: 20px; font-family: 'Raleway'; font-weight: bold;" 
				  required>

			</textarea>
		    </div>

		    <div class="flex flex-col mt20">
			<h3 class="mb20">Choices <span style="font-weight: 300; font-size: small;">(max. 5)</span></h3>
			<div class="poll-choices-container">
			</div>
			<button class="btn btn-secondary" id="addChoiceBtn">
			    <i class="bx bx-plus"></i>
			    <span>Add Choice</span>
			</button>
		    </div>

		    <button style="width: 100%;" class="btn btn-primary mt40">
			Create Poll
		    </button>
		</form>
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

            let addChoiceBtn = document.querySelector("#addChoiceBtn");
            let choicesContainer = document.querySelector(".poll-choices-container");
            let choicesCount = 0;

            const createChoice = () => {

                choicesCount++;

                if (choicesCount > 5) {
                    addChoiceBtn.style.display = "none";
                    return;
                }

                let choice = document.createElement('div');
                choice.className = "form-field poll-choice ";

                let choiceCheckbox = document.createElement('input');
                choiceCheckbox.setAttribute("type", 'checkbox');
                choiceCheckbox.setAttribute("name", "choices");
                choiceCheckbox.setAttribute("hidden", true);
                choiceCheckbox.setAttribute("checked", true);

                let choiceLabel = document.createElement("span");
                choiceLabel.className = "form-label";
                choiceLabel.innerText = `Choice ` + choicesCount;

                let choiceInput = document.createElement('input');
                choiceInput.setAttribute("type", "text");
                choiceInput.classList.add("form-input");
                choiceInput.setAttribute("required", true);
                choiceInput.addEventListener("change", (event) => {
                    choiceCheckbox.value = event.target.value;
                })

                choice.appendChild(choiceCheckbox);
                choice.appendChild(choiceLabel);
                choice.appendChild(choiceInput);
                choicesContainer.appendChild(choice);


            }

            for (let i = 0; i < 2; i++) {
                createChoice();
            }

            addChoiceBtn.addEventListener("click", (event) => {
                event.preventDefault();
                createChoice();
            })

    </script>

</html>