package Servlets.Auth;

import Exceptions.FormException;
import Exceptions.UserDontExistException;
import Models.User;
import Utils.FormValidator;
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
import javax.servlet.http.HttpSession;


public class FindAccount extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		
		if (email == null) {
			RequestDispatcher view = req.getRequestDispatcher("pages/forget/find-account.jsp");
			view.forward(req, resp);
			return;
		}
		
		try {
			FormValidator.validateEmail(email);
			User user = User.findByEmail(email);
			
			HttpSession session = req.getSession();
			session.setAttribute("reseting-user", user);
			
			RequestDispatcher view = req.getRequestDispatcher("pages/forget/verify-account.jsp");
			view.forward(req, resp);
			return;
			
		} catch (SQLException ex) {
			Logger.getLogger(FindAccount.class.getName()).log(Level.SEVERE, null, ex);
		} catch (UserDontExistException ex) {
			req.setAttribute("formError", ex);
			RequestDispatcher view = req.getRequestDispatcher("pages/forget/find-account.jsp");
			view.forward(req, resp);
		} catch (FormException ex) {
			req.setAttribute("formError", ex);
			RequestDispatcher view = req.getRequestDispatcher("pages/forget/find-account.jsp");
			view.forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("reseting-user");
		
		if (user == null) {
			RequestDispatcher view = req.getRequestDispatcher("pages/forget/find-account.jsp");
			view.forward(req, resp);
			return;
		}
		
		String answer = req.getParameter("answer");
		
		
		try {
			FormValidator.validateEmpty(answer, "anwer", "Please provide your security answer");
			
			if (!user.securityAnswer.equals(answer)) {
				throw new FormException("answer", "Wrong security Answer");
			}
			
			session.setAttribute("validated", true);
			resp.sendRedirect("ChangePassword");
			
			
		} catch (FormException ex) {
			req.setAttribute("formError", ex);
			RequestDispatcher view = req.getRequestDispatcher("pages/forget/verify-account.jsp");
			view.forward(req, resp);
		}
	}
	
	
	
}
