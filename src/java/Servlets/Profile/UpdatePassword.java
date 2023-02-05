package Servlets.Profile;

import Exceptions.FormException;
import Models.User;
import Utils.FormValidator;
import Utils.ServletUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdatePassword extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = ServletUtils.getCurrentUser(req);
		if (user == null) {
			resp.sendRedirect("Login");
			return;
		}

		String currentPassword = req.getParameter("currentPassword");
		String newPassword = req.getParameter("newPassword");
		String confirmPassword = req.getParameter("confirmPassword");

		try {
			FormValidator.validateMatch(currentPassword, user.password, "currentPassword", "Wrong password!");
			FormValidator.validatePassword(newPassword);
			FormValidator.validateMatch(newPassword, confirmPassword, "password", "Passwords don't match!");

			user.updatePassword(newPassword);
			ServletUtils.setCurrentUser(req, user);
			resp.sendRedirect("ProfilePage");

		} catch (FormException ex) {
			req.setAttribute("formError", ex);
			req.setAttribute("method", "post");
			RequestDispatcher view = req.getRequestDispatcher("/ProfilePage");
			view.forward(req, resp);
		} catch (SQLException ex) {
			Logger.getLogger(UpdatePassword.class.getName()).log(Level.SEVERE, null, ex);

		}

	}
}
