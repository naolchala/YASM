package Models;

import Utils.DBConnector;
import java.util.UUID;
import java.sql.*;

public class Choice {
	public String id;
	String pollId;
	public String content;
	public int voteCount;
	
	public Choice() {
		
	}
	
	public Choice(ResultSet rs) throws SQLException {
		this.id = rs.getString("id");
		this.content = rs.getString("content");
		loadVoteCount();
	}
	
	public Choice(String content) {
		this.id = UUID.randomUUID().toString();
		this.content = content;
	}
	
	public void loadVoteCount() throws SQLException {
		String sql  = "SELECT Count(*) FROM Votes WHERE choiceId = ?";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, this.id);
		ResultSet rs = stmt.executeQuery();
		
		if (rs.next()) {
			this.voteCount =  rs.getInt(1);
		}
	}

}
