package Models;

import Models.Constants.NotificationType;
import Utils.DBConnector;
import com.mysql.cj.jdbc.PreparedStatementWrapper;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

public class Notification {

	public String id;
	public String receiverId;

	public String fromId;
	public User from;

	public NotificationType type;
	public String postId = null;
	public Timestamp datetime;

	public Notification(String receiverId, String fromId, NotificationType type) {
		this.id = UUID.randomUUID().toString();
		this.receiverId = receiverId;
		this.fromId = fromId;
		this.type = type;
		this.datetime = Timestamp.from(Instant.now());
	}

	public Notification(String receiverId, String fromId, NotificationType type, String postId) {
		this.id = UUID.randomUUID().toString();
		this.receiverId = receiverId;
		this.fromId = fromId;
		this.type = type;
		this.datetime = Timestamp.from(Instant.now());
		this.postId = postId;
	}

	public Notification(ResultSet rs) throws SQLException {
		this.id = rs.getString("NId");
		this.receiverId = rs.getString("receiverId");
		this.fromId = rs.getString("fromId");
		this.type = NotificationType.valueOf(rs.getString("type"));
		this.datetime = rs.getTimestamp("datetime");
		this.postId = rs.getString("postId");
		this.from = new User(rs);
	}

	void save() throws SQLException {
		String sql = "INSERT INTO Notification"
			+ "(NId, receiverId, fromId, type, postId, datetime)"
			+ "VALUES"
			+ "(?, ?, ?, ?, ?, ?)";

		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, id);
		stmt.setString(2, receiverId);
		stmt.setString(3, fromId);
		stmt.setString(4, type.toString());
		stmt.setString(5, postId);
		stmt.setTimestamp(6, datetime);

		stmt.executeUpdate();
	}

	public static ArrayList<Notification> getNotifications(User user) throws SQLException {
		ArrayList<Notification> notifications = new ArrayList<>();
		String sql = "SELECT * "
			+ "FROM Notification INNER JOIN User ON "
			+ "User.id = Notification.fromId "
			+ "WHERE Notification.receiverId = ? "
			+ "ORDER BY datetime DESC";

		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, user.id);

		ResultSet rs = stmt.executeQuery();

		while (rs.next()) {
			notifications.add(new Notification(rs));
		}
		return notifications;
	}

	public String getIconClass() {
		switch (this.type) {
			case ACCEPTED_REQUEST:
				return "bxs-user-check";
			case SENT_REQUEST:
				return "bxs-user-plus";
			case COMMENTED_POST:
				return "bxs-comment";
			case LIKED_POST:
				return "bxs-like";
			default:
				return "bxs-bell";
		}
	}

	public String getMessage() {
		switch (this.type) {
			case ACCEPTED_REQUEST:
				return "accepted your friend request.";
			case SENT_REQUEST:
				return "wants to be a friend with you.";
			case COMMENTED_POST:
				return "commented on your post";
			case LIKED_POST:
				return "liked your post";
			default:
				return "O.O";
		}
	}
	
	public String getFormattedDate(){ 
		SimpleDateFormat formatter = new SimpleDateFormat("MMM dd, YYYY");
		return formatter.format(datetime);
	}
}
