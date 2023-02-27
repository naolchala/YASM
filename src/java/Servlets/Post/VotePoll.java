
package Servlets.Post;

import Models.User;
import Models.Vote;
import Utils.ServletUtils;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class VotePoll extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = ServletUtils.getCurrentUser(req);
		if (user == null) {
			resp.sendRedirect("Login");
			return;
		}
		
		String choiceId = req.getParameter("choiceId");
		String pollId = req.getParameter("pollId");
		
		Vote vote = new Vote(user, pollId, choiceId);
		try {
			vote.save();
			resp.sendRedirect(".#"+pollId);
			
			
		} catch (SQLException ex) {
			Logger.getLogger(VotePoll.class.getName()).log(Level.SEVERE, null, ex);
		}
		
		
	}
	
}
