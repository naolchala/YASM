package Servlets.Post;

import Models.Reaction;
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


public class Like extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = ServletUtils.getCurrentUser(req);
		if (user == null) {
			resp.sendRedirect("Login");
			return;
		}
		
		String postId = req.getParameter("id");
		Reaction reaction = new Reaction(user, postId);
		try {
			reaction.save();
			resp.sendRedirect(".#"+postId);
		} catch (SQLException ex) {
			Logger.getLogger(Like.class.getName()).log(Level.SEVERE, null, ex);
		}
		
		
	}
	
}
