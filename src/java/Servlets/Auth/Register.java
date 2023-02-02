package Servlets.Auth;

import Exceptions.FormException;
import Models.User;
import Utils.FormValidator;
import Utils.ServletUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author naol
 */
public class Register extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = ServletUtils.getCurrentUser(req);

		if (user != null) {
			resp.sendRedirect(".");
			return;
		}

		RequestDispatcher view = req.getRequestDispatcher("pages/auth/register.jsp");
		view.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String confrimPassword = req.getParameter("confirmPassword");
		String securityQuestion = req.getParameter("secQuestion");
		String securityAnswer = req.getParameter("secAnswer");

		try {
			FormValidator.validateEmpty(firstName, "firstName", "Please, provide your first name");
			FormValidator.validateEmail(email);
			FormValidator.validateEmpty(password, "password", "Please, provide your password");
			FormValidator.validateLength(password, 6, "password", "your password should be 6 or more characters");
			FormValidator.validateMatch(password, confrimPassword, "password", "Passwords don't match, try again");
			FormValidator.validateEmpty(securityAnswer, "secAnswer",
				"Please, provide your security answer<br>It's used for recovering your password");
			
			User user = new User(firstName, lastName, email, password, securityQuestion, securityAnswer);
			user.save();
			ServletUtils.setCurrentUser(req, user);
			resp.sendRedirect(".");
			return;

		} catch (FormException ex) {
			req.setAttribute("formError", ex);
			RequestDispatcher view = req.getRequestDispatcher("pages/auth/register.jsp");
			view.forward(req, resp);
		} catch (SQLException ex) {
			Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
		}

	}

}
