
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
	
	public Story(ResultSet rs) throws SQLException {
		super(rs.getString("id"));
		this.type = PostTypes.STORY;
		this.photoUrl = rs.getString("photoUrl");
		this.caption = rs.getString("caption");
	}
	

	public static Story getById(String id) throws SQLException {
		String sql = "SELECT * FROM Stories WHERE id=?";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, id);
		ResultSet rs = stmt.executeQuery();
		if (rs.next()) {
			return new Story(rs);
		};
		return null;
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
		return "uploads/stories/" + this.photoUrl;
	}
	
}
