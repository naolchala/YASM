package Servlets;

import Exceptions.UserDontExistException;
import Models.Post;
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

public class Index extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = ServletUtils.getCurrentUser(req);
		if (user == null) {
			resp.sendRedirect("Login");
			return;
		}
		
		String pageString = req.getParameter("page");
		int page = 1;
		if (pageString != null && !pageString.equals("")) {
			page = Integer.parseInt(pageString);
		}
		
		
		try {
			ArrayList<Post> posts= Post.getPostsForUser(user, page);
			req.setAttribute("posts", posts	);
			req.setAttribute("page", page);
			RequestDispatcher view = req.getRequestDispatcher("pages/home/index.jsp");
			view.forward(req, resp);

		} catch (SQLException ex) {
			Logger.getLogger(Index.class.getName()).log(Level.SEVERE, null, ex);
		} 

	}

}
