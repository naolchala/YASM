package Models;

import Models.Constants.NotificationType;
import Utils.DBConnector;
import com.mysql.cj.jdbc.PreparedStatementWrapper;
import java.sql.*;
import java.time.Instant;
import java.util.UUID;


public class Notification {
	String id;
	String receiverId;
	String fromId;
	NotificationType type;
	String postId = null;
	Timestamp datetime;

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
	
	
	void save() throws SQLException {
		String sql = "INSERT INTO Notification"
			+ "(id, receiverId, fromId, type, postId, datetime)"
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
	
	
}

