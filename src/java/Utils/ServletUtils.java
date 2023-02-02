
package Utils;

import Models.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


public class ServletUtils {
	public static User getCurrentUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("current-user") != null) {
			User user = (User) session.getAttribute("current-user");
			return user;
		}
		return null;
	}
	
	public static void setCurrentUser(HttpServletRequest request, User user) {
		HttpSession session = request.getSession();
		session.setAttribute("current-user", user);
	}
}
