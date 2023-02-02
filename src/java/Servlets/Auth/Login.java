package Servlets.Auth;

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

public class Login extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = ServletUtils.getCurrentUser(req);
		if (user != null) {
			resp.sendRedirect(".");
			return;
		}

		RequestDispatcher view = req.getRequestDispatcher("pages/auth/login.jsp");
		view.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		try {
			FormValidator.validateEmail(email);
			FormValidator.validatePassword(password);
			
			User user = User.login(email, password);
			ServletUtils.setCurrentUser(req, user);
			resp.sendRedirect(".");
			return;
			
		} catch (FormException ex) {
			req.setAttribute("formError", ex);
			RequestDispatcher view = req.getRequestDispatcher("pages/auth/login.jsp");
			view.forward(req, resp);
		} catch (SQLException ex) {
			Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
		}

	}

}
