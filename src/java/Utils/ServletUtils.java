package Utils;

import Models.User;
import java.time.Instant;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import org.ocpsoft.pretty.time.PrettyTime;

public class ServletUtils {

	static String USER_SESSION_NAME = "current-user";
	public static String PROJECT_DIRECTORY = "/home/naol/Documents/Projects/Advanced Programming/YASM/";
	public static String PROFILE_PICTURES_DIR = PROJECT_DIRECTORY + "web/uploads/profile-pictures/";
	public static String STORIES_DIR = PROJECT_DIRECTORY + "web/uploads/stories/";

	public static User getCurrentUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute(USER_SESSION_NAME) != null) {
			User user = (User) session.getAttribute(USER_SESSION_NAME);
			return user;
		}
		return null;
	}

	public static void setCurrentUser(HttpServletRequest request, User user) {
		HttpSession session = request.getSession();
		session.setAttribute(USER_SESSION_NAME, user);
	}

	public static void destoryCurrentUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
	}

	public static String getFileExtension(String filename) {
		String[] filenameSplit = filename.split("\\.");
		String fileExtension = filenameSplit[filenameSplit.length - 1];

		return "." + fileExtension;
	}

	public static String generateProfileFilename(User user, String filename) {
		String newFilename = user.id + "--"
			+ String.valueOf(Instant.now().toEpochMilli())
			+ getFileExtension(filename);
		return newFilename;
	}

	public static String generateStoryFilename(String filename) {
		return  String.valueOf(Instant.now().toEpochMilli()) + getFileExtension(filename);
	}
	
	public static String formatInStatement(ArrayList<String> list) {
		StringBuilder str = new StringBuilder();
		str.append("('', ");
		
		boolean first = true;
		
		for (String l: list) {
			if (!first) {
				str.append(", ");
			}
			str.append("'" + l + "'");
			first = false;
		}
		
		str.append(")");
		return str.toString();
	}
	
	public static String getFromNow(Timestamp time) {
		PrettyTime p = new PrettyTime();
		return p.format(time);
	}
}
