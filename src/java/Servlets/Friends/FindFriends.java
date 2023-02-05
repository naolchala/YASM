package Servlets.Friends;

import Models.User;
import Utils.ServletUtils;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FindFriends extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			User user = ServletUtils.getCurrentUser(req);
			if (user == null) {
				resp.sendRedirect("Login");
				return;
			}
			
			ArrayList<User> suggestionList = user.getRandomFriendSuggestion();
			ArrayList<User> friendRequests = user.getFriendRequests();
			req.setAttribute("suggestions", suggestionList);
			req.setAttribute("friendRequests", friendRequests);
			
			RequestDispatcher view = req.getRequestDispatcher("pages/home/friends.jsp");
			view.forward(req, resp);
			
		} catch (SQLException ex) {
			Logger.getLogger(FindFriends.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

}
