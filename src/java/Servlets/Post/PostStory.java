package Servlets.Post;

import Models.Story;
import Models.User;
import Utils.ServletUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(
	fileSizeThreshold = 1024 * 1024 * 1,
	maxFileSize = 1024 * 1024 * 10
)
public class PostStory extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = ServletUtils.getCurrentUser(req);
		if (user == null) {
			resp.sendRedirect("Login");
			return;
		}
		
		RequestDispatcher view = req.getRequestDispatcher("pages/home/add/story.jsp");
		view.forward(req, resp);
	}
	
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = ServletUtils.getCurrentUser(req);
		if (user == null) {
			resp.sendRedirect("Login");
			return;
		}
		
		Part photo = req.getPart("photo");
		String caption = req.getParameter("caption");
		
		String filename = ServletUtils.generateStoryFilename(photo.getSubmittedFileName());
		String filePath = ServletUtils.STORIES_DIR + filename;
		photo.write(filePath);
		
		
		try {
			Story story = new Story(user, filename, caption);
			story.save();
			
			resp.sendRedirect(".");
			
		} catch (SQLException ex) {
			Logger.getLogger(PostStory.class.getName()).log(Level.SEVERE, null, ex);
		}
		
	}

}
