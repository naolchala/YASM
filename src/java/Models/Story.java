
package Models;

import Models.Constants.PostTypes;
import Utils.DBConnector;
import Utils.ServletUtils;
import java.sql.*;


public class Story extends Post {
	public String photoUrl;
	public String caption;
	
	public Story(User user, String photoUrl, String caption) {
		super(user, PostTypes.STORY);
		this.photoUrl = photoUrl;
		this.caption = caption;
	}
	
	public void save() throws SQLException {
		super.save();
		String sql  = "INSERT INTO Stories "
			+ "(id, photoUrl, caption) "
			+ "VALUES "
			+ "(?, ?, ?)";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, this.id);
		stmt.setString(2, this.photoUrl);
		stmt.setString(3, this.caption);
		
		stmt.executeUpdate();
	}
	
	public String getPhotoUrl() {
		return ServletUtils.STORIES_DIR + this.photoUrl;
	}
	
}
