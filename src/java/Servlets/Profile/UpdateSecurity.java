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


public class UpdateSecurity extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = ServletUtils.getCurrentUser(req);
		if (user == null) {
			resp.sendRedirect("Login");
			return;
		}

		String securityAnswer = req.getParameter("secAnswer");
		String securityQuestion = req.getParameter("secQuestion");
		

		try {
			FormValidator.validateEmpty(securityAnswer, "secAnswer", "Please provide your answer");
			user.updateSecurityQuestionAnswer(securityQuestion, securityAnswer);
			ServletUtils.setCurrentUser(req, user);
			resp.sendRedirect("ProfilePage");

		} catch (FormException ex) {
			req.setAttribute("formError", ex);
			RequestDispatcher view = req.getRequestDispatcher("/ProfilePage");
			view.forward(req, resp);
		} catch (SQLException ex) {
			Logger.getLogger(UpdatePassword.class.getName()).log(Level.SEVERE, null, ex);
		}

	}
	
}
