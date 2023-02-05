package Servlets.Post;

import Models.Choice;
import Models.Poll;
import Models.User;
import Utils.ServletUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PostPoll extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = ServletUtils.getCurrentUser(req);
		if (user == null) {
			resp.sendRedirect("Login");
			return;
		}

		RequestDispatcher view = req.getRequestDispatcher("pages/home/add/poll.jsp");
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
		String[] choices = req.getParameterValues("choices");

		try {
			Poll poll = new Poll(user, title);

			for (String choiceContent : choices) {
				Choice c = new Choice(choiceContent);
				poll.addChoice(c);
			}
			
			poll.save();
			
			resp.sendRedirect(".");

		} catch (SQLException ex) {
			Logger.getLogger(PostPoll.class.getName()).log(Level.SEVERE, null, ex);
		}

	}

}
