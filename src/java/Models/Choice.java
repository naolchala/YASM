package Models;

import java.util.UUID;
import java.sql.*;

public class Choice {
	public String id;
	String pollId;
	public String content;
	
	public Choice() {
		
	}
	
	public Choice(ResultSet rs) throws SQLException {
		this.id = rs.getString("id");
		this.content = rs.getString("content");
	}
	
	public Choice(String content) {
		this.id = UUID.randomUUID().toString();
		this.content = content;
	}
	

}
