package Models;

import Models.Constants.PostTypes;
import Utils.DBConnector;
import java.sql.*;
import java.util.UUID;

public class Blog extends Post {
	public String title;
	public String content;

	public Blog(User user, String title, String content) {
		super(user, PostTypes.BLOG);
		this.title = title;
		this.content = content;
	}
	
	
	public void save() throws SQLException {
		super.save();
		String sql = "INSERT INTO Blogs "
			+ "(id, title, content) "
			+ "VALUES "
			+ "(?, ?, ?)";
		
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, this.id);
		stmt.setString(2, this.title);
		stmt.setString(3, this.content);
		
		stmt.executeUpdate();
	}
}

