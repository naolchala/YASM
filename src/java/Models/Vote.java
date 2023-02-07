
package Models;

import Utils.DBConnector;
import java.util.UUID;
import java.sql.*;


public class Vote {
	public String id;
	public String pollId;
	public String userId;
	public String choiceId;
	
	public Vote(User user, String pollId, String choiceId) {
		this.id = UUID.randomUUID().toString();
		this.pollId = pollId;
		this.userId = user.id;
		this.choiceId = choiceId;
	}
	
	public Vote(ResultSet rs) throws SQLException {
		this.id = rs.getString("id");
		this.pollId = rs.getString("pollId");
		this.userId = rs.getString("userId");
		this.choiceId = rs.getString("choiceId");
	}
	
	public void save() throws SQLException {
		String sql = "INSERT INTO Votes "
			+ "(id, pollId, userId, choiceId) "
			+ "VALUES "
			+ "(?, ?, ?, ?)";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, this.id);
		stmt.setString(2, this.pollId);
		stmt.setString(3, this.userId);
		stmt.setString(4, this.choiceId);
		
		stmt.executeUpdate();
	}
}
