package Servlets.Post;

import Models.Comment;
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


public class PostComment extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = ServletUtils.getCurrentUser(req);
		if (user == null) {
			resp.sendRedirect("Login");
			return;
		}
		
		String content = req.getParameter("comment");
		String postId = req.getParameter("postId");
		
		Comment comment = new Comment(content, postId, user);
		try {
			comment.save();
			resp.sendRedirect("PostPage?id=" + postId );
		} catch (SQLException ex) {
			req.setAttribute("error", "Error posting your comment, please try again");
			Logger.getLogger(PostComment.class.getName()).log(Level.SEVERE, null, ex);
		}
		
		
		
	}

	
	
	
}
