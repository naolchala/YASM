package Servlets.Auth;

import Exceptions.FormException;
import Models.User;
import Utils.FormValidator;
import Utils.ServletUtils;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ChangePassword extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		boolean validated = (boolean) session.getAttribute("validated");
		User user = (User) session.getAttribute("reseting-user");

		if (!validated || user == null) {
			resp.sendRedirect("ForgetPassword");
			return;
		}

		RequestDispatcher view = req.getRequestDispatcher("pages/forget/change-password.jsp");
		view.forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String password = req.getParameter("password");
		String confirmPassword = req.getParameter("confirmPassword");

		HttpSession session = req.getSession();
		boolean validated = (boolean) session.getAttribute("validated");
		User user = (User) session.getAttribute("reseting-user");
		
		if (!validated || user == null) {
			resp.sendRedirect("ForgetPassword");
			return;
		}

		try {
			FormValidator.validatePassword(password);
			FormValidator.validateMatch(password, confirmPassword, "password", "Passwords don't match");
			
			user.updatePassword(password);
			user.password = password;
			
			session.removeAttribute("reseting-user");
			session.removeAttribute("validated");
			
			ServletUtils.setCurrentUser(req, user);
			resp.sendRedirect(".");

		} catch (FormException ex) {
			req.setAttribute("formError", ex);
			RequestDispatcher view = req.getRequestDispatcher("pages/forget/change-password.jsp");
			view.forward(req, resp);
		} catch (SQLException ex) {
			Logger.getLogger(ChangePassword.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

}
