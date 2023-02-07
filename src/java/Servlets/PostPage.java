package Servlets;

import Exceptions.UserDontExistException;
import Models.Comment;
import Models.Post;
import Models.User;
import Utils.ServletUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PostPage extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = ServletUtils.getCurrentUser(req);
		if (user == null) {
			resp.sendRedirect("Login");
			return;
		}

		String postId = req.getParameter("id");
		try {
			Post post = Post.findById(postId);
			ArrayList<Comment> comments = post.getComments();
			req.setAttribute("post", post);
			req.setAttribute("comments", comments);
			
			RequestDispatcher view = req.getRequestDispatcher("pages/home/post.jsp");
			view.forward(req, resp);

		} catch (SQLException ex) {
			Logger.getLogger(PostPage.class.getName()).log(Level.SEVERE, null, ex);
		} catch (UserDontExistException ex) {
			Logger.getLogger(PostPage.class.getName()).log(Level.SEVERE, null, ex);
		}

	}

}
