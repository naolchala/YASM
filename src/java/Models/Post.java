
package Models;

import Models.Constants.PostTypes;
import Utils.DBConnector;
import com.mysql.cj.xdevapi.DbDoc;
import java.sql.*;
import java.time.Instant;
import java.util.UUID;

public class Post {
	public String id;
	public User user;
	public Timestamp postedAt;
	public boolean isLiked;
	public PostTypes type;

	public Post(User user, PostTypes type) {
		this.id = UUID.randomUUID().toString();
		this.user = user;
		this.type = type;
		this.postedAt = Timestamp.from(Instant.now());
	}
	
	void save() throws SQLException {
		String sql = "INSERT INTO Posts "
			+ "(id, userId, postedAt, type) "
			+ "VALUES"
			+ "(?, ?, ?, ?)";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, this.id);
		stmt.setString(2, this.user.id);
		stmt.setTimestamp(3, this.postedAt);
		stmt.setString(4, this.type.toString());
		
		stmt.executeUpdate();
	}
	
}