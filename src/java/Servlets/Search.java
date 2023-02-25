package Servlets;

import Models.Constants.SearchTypes;
import Models.Post;
import Models.User;
import Utils.ServletUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Search extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = ServletUtils.getCurrentUser(req);
		if (user == null) {
			resp.sendRedirect("Login");
			return;
		}

		String keyword = req.getParameter("keyword");
		String typeString = req.getParameter("type");

		if (keyword == null || keyword.equals("")) {
			resp.sendRedirect(".");
			return;
		}
		SearchTypes type;
		if (typeString == null) {
			type = SearchTypes.USER;
		} else {
			type = SearchTypes.valueOf(typeString.toUpperCase());
		}

		ArrayList<User> searchedUsers = null;
		ArrayList<Post> searchedPosts = null;

		if (type == SearchTypes.USER) {
			try {
				searchedUsers = User.search(keyword);
				req.setAttribute("type", type);
				req.setAttribute("keyword", req);
				req.setAttribute("users", searchedUsers);
				req.getRequestDispatcher("pages/home/search.jsp").forward(req, resp);
			} catch (SQLException ex) {
				Logger.getLogger(Search.class.getName()).log(Level.SEVERE, null, ex);
			}
		}

	}

}
