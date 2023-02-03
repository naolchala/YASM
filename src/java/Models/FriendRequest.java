package Models;

import Models.Constants.FriendRequestStatus;
import Models.Constants.NotificationType;
import Utils.DBConnector;
import java.sql.*;
import java.time.Instant;

import java.util.UUID;

public class FriendRequest {
	String id;
	String fromId;
	String toId;
	FriendRequestStatus status;
	User toUser;
	Timestamp datetime;

	public FriendRequest(String fromId, String toId) {
		this.id = UUID.randomUUID().toString();
		this.fromId = fromId;
		this.toId = toId;
		this.status = FriendRequestStatus.WAITING;
		this.datetime = Timestamp.from(Instant.now());
	}
	
	public void save() throws SQLException {
		String sql = "INSERT INTO FriendRequest "
			+ "(id, fromId, toId, status, datetime)"
			+ "VALUES"
			+ "(?, ?, ?, ?, ?)"; 
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, id);
		stmt.setString(2, fromId);
		stmt.setString(3, toId);
		stmt.setString(4, status.toString());
		stmt.setTimestamp(5, datetime);
		
		stmt.executeUpdate();
		
		new Notification(toId, fromId, NotificationType.SENT_REQUEST).save();
	}
	
	public static void updateStatus(String userId, String fromId, FriendRequestStatus status) throws SQLException {
		String sql = "UPDATE FriendRequest SET "
			+ "status=? "
			+ "WHERE fromId=? AND toId=?";
		
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, status.toString());
		stmt.setString(2, fromId);
		stmt.setString(3, userId);
		
		stmt.executeUpdate();
		
		new Notification(fromId, userId, NotificationType.ACCEPTED_REQUEST).save();
	}
	
}

