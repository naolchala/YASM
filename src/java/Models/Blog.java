package Models;

import Models.Constants.PostTypes;
import java.util.UUID;

public class Blog extends Post {
	public String title;
	public String content;

	public Blog(User user) {
		super(user, PostTypes.BLOG);
	}
	
}

