
package Utils;

import Models.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


public class ServletUtils {
	static String USER_SESSION_NAME = "current-user";
	public static String PROJECT_DIRECTORY = "/home/naol/Documents/Projects/Advanced Programming/YASM";
	public static String PROFILE_PICTURES_DIR = PROJECT_DIRECTORY + "/web/uploads/profile-pictures/";
	
	public static User getCurrentUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute(USER_SESSION_NAME) != null) {
			User user = (User) session.getAttribute("current-user");
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
}
