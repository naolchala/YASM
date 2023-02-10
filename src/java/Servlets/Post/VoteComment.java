
package Servlets.Post;

import Models.CommentReaction;
import Models.Constants.CommentReactionTypes;
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


public class VoteComment extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = ServletUtils.getCurrentUser(req);
		if (user == null) {
			resp.sendRedirect("Login");
			return;
		}
		String postId = req.getParameter("postId");
		String commentId = req.getParameter("commentId");
		String types = req.getParameter("type");
		CommentReactionTypes type;
		
		if (types.equals("upvote")) {
			type = CommentReactionTypes.UPVOTE;
		} else {
			type = CommentReactionTypes.DOWNVOTE;
		}
		
		CommentReaction reaction =  new CommentReaction(user, commentId, type);
		try {
			reaction.save();
			resp.sendRedirect("PostPage?id=" + postId);
		} catch (SQLException ex) {
			Logger.getLogger(VoteComment.class.getName()).log(Level.SEVERE, null, ex);
		}
		
		
	}
	
	
}
