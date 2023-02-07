package Models;

import Exceptions.UserDontExistException;
import Models.Constants.NotificationType;
import Utils.DBConnector;
import java.sql.*;
import java.time.Instant;
import java.util.UUID;

public class Reaction {

	String id;
	String postId;
	String userId;
	Timestamp datetime;
	String type;

	public Reaction(ResultSet rs) throws SQLException {
		this.id = rs.getString("id");
		this.postId = rs.getString("postId");
		this.userId = rs.getString("userId");
		this.datetime = rs.getTimestamp("datetime");
		this.type = rs.getString("type");
	}

	public Reaction(User user, String postId) {
		this.id = UUID.randomUUID().toString();
		this.postId = postId;
		this.userId = user.id;
		this.datetime = Timestamp.from(Instant.now());
	}

	private void insert() throws SQLException {
		String sql = "INSERT INTO Reactions "
			+ "(id, postId, userId, datetime, type) "
			+ "VALUES"
			+ "(?, ?, ?, ?, ?)";

		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, this.id);
		stmt.setString(2, this.postId);
		stmt.setString(3, this.userId);
		stmt.setTimestamp(4, this.datetime);
		stmt.setString(5, this.type);

		stmt.executeUpdate();
	}

	private void remove() throws SQLException {
		String sql = "DELETE FROM Reactions WHERE userId=? AND postId=?";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, userId);
		stmt.setString(2, postId);
		stmt.executeUpdate();
	}

	public void save() throws SQLException, UserDontExistException {
		String sql = "SELECT * FROM Reactions WHERE userId=? AND postId=?";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, userId);
		stmt.setString(2, postId);

		Post post = Post.findById(postId);

		ResultSet rs = stmt.executeQuery();

		if (rs.next()) {
			remove();
		} else {
			insert();
			if (!post.postedBy.id.equals(userId)) {
				new Notification(post.postedBy.id, userId, NotificationType.LIKED_POST, postId).save();
			}

		}
	}
}
