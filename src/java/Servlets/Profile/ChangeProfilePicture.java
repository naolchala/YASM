package Servlets.Profile;

import Models.User;
import Utils.ServletUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.Instant;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(
	fileSizeThreshold = 1024 * 1024 * 1, // 1MB
	maxFileSize = 1024 * 1024 * 10, // 10MB
	maxRequestSize = 1024 * 1024 * 100 // 100MB
)
public class ChangeProfilePicture extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			User user = ServletUtils.getCurrentUser(req);
			if (user == null) {
				resp.sendRedirect("Login");
				return;
			}

			Part profilePicture = req.getPart("profile-picture");
			String originalFilename = profilePicture.getSubmittedFileName();

			String filename = ServletUtils.generateProfileFilename(user, originalFilename);
			String filePath = ServletUtils.PROFILE_PICTURES_DIR + filename;
			profilePicture.write(filePath);

			user.changeProfilePicture(filename);
			ServletUtils.setCurrentUser(req, user);
			resp.sendRedirect("ProfilePage");

		} catch (SQLException ex) {
			Logger.getLogger(ChangeProfilePicture.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

}
