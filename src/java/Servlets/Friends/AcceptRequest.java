package Servlets.Friends;

import Models.Constants.FriendRequestStatus;
import Models.FriendRequest;
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

public class AcceptRequest extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String id = req.getParameter("id");
			String action = req.getParameter("action");
			User user = ServletUtils.getCurrentUser(req);

			if (user == null) {
				resp.sendRedirect("Login");
				return;
			}

			FriendRequestStatus status = action.equals("accept")
				? FriendRequestStatus.ACCEPTED
				: FriendRequestStatus.DECLINED;
			
			FriendRequest.updateStatus(user.id, id, status);
			resp.sendRedirect("FindFriends");
		} catch (SQLException ex) {
			Logger.getLogger(AcceptRequest.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

}
