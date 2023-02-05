package Servlets.Friends;

import Models.User;
import Utils.ServletUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SendRequest extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			User user = ServletUtils.getCurrentUser(req);
			if (user == null) {
				resp.sendRedirect("Login");
				return;
			}
			
			String id = req.getParameter("id");
			
			if (id == null || id.equals("")) {
				resp.sendRedirect("FindFriend");
			}
			
			user.sendFriendRequest(id);
			resp.sendRedirect("FindFriends");
		} catch (SQLException ex) {
			Logger.getLogger(SendRequest.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

}
