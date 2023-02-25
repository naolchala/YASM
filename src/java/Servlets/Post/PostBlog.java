package Servlets.Post;

import Exceptions.FormException;
import Models.Blog;
import Models.User;
import Utils.FormValidator;
import Utils.ServletUtils;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PostBlog extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = ServletUtils.getCurrentUser(req);
		if (user == null) {
			resp.sendRedirect("Login");
			return;
		}
		
		RequestDispatcher view = req.getRequestDispatcher("pages/home/add/blog.jsp");
		view.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = ServletUtils.getCurrentUser(req);
		if (user == null) {
			resp.sendRedirect("Login");
			return;
		}
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		content = FormValidator.escapeContent(content);
		
		try {
			FormValidator.validateEmpty(title, "title", "Title for the blog is required!");
			Blog blog = new Blog(user, title, content);
			blog.save();
			
			resp.sendRedirect(".");
			
		} catch (FormException ex) {
			req.setAttribute("formError", ex);
			RequestDispatcher view = req.getRequestDispatcher("pages/home/add/blog.jsp");
			view.forward(req, resp);
		} catch (SQLException ex) {
			Logger.getLogger(PostBlog.class.getName()).log(Level.SEVERE, null, ex);
		}
		
	}
	
}
