/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets.Profile;

import Exceptions.UserDontExistException;
import Models.User;
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

/**
 *
 * @author naol
 */
public class ProfilePage extends HttpServlet {
	
	void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = ServletUtils.getCurrentUser(req);
		if (user == null) {
			resp.sendRedirect("Login");
			return;
		}

		String id = req.getParameter("id");
		User viewUser;
		if (id == null || id.equals("")) {
			req.setAttribute("mine", true);
			viewUser = ServletUtils.getCurrentUser(req);
		} else {
			try {
				user = User.findById(id);
			} catch (SQLException ex) {
				Logger.getLogger(ProfilePage.class.getName()).log(Level.SEVERE, null, ex);
			} catch (UserDontExistException ex) {
				Logger.getLogger(ProfilePage.class.getName()).log(Level.SEVERE, null, ex);
			}
		}

		RequestDispatcher view = req.getRequestDispatcher("pages/home/profile/update-profile.jsp");
		view.forward(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processRequest(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processRequest(req, resp);
	}
	
	

}
