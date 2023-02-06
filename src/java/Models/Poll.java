package Models;

import Models.Constants.PostTypes;
import Utils.DBConnector;
import java.sql.*;
import java.util.ArrayList;


public class Poll extends Post {
	public String title;
	public ArrayList<Choice> choices = new ArrayList<>();
	
	
	
	public Poll(User user, String title) {
		super(user, PostTypes.POLL);
		this.title = title;
	}
	
	public Poll(ResultSet rs) throws SQLException {
		super(rs.getString("id"));
		this.type = PostTypes.POLL;
		this.title = rs.getString("title");
		loadChoices();
	}
	
	public static Poll getById(String id) throws SQLException {
		String sql = "SELECT * FROM Polls WHERE id=?";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, id);
		ResultSet rs = stmt.executeQuery();
		
		if (rs.next()) {
			return new Poll(rs);
		};
		
		return null;
	}
	
	public void addChoice(Choice choice) {
		choices.add(choice);
	}
	
	public void loadChoices() throws SQLException {
		this.choices = new ArrayList<>();
		String sql = "SELECT * FROM Choices WHERE pollID=?";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, this.id);
		ResultSet rs = stmt.executeQuery();
		
		while (rs.next()) {
			this.choices.add(new Choice(rs));
		}
	}
	
	public void save() throws SQLException {
		super.save();
		String sql = "INSERT INTO Polls "
			+ "(id, title) "
			+ "VALUES "
			+ "(?, ?)";
		
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, this.id);
		stmt.setString(2, this.title);
		
		stmt.executeUpdate();
		
//		ADDED CHOICES 
		sql = "INSERT INTO Choices "
			+ "(id, pollId, content) "
			+ "VALUES "
			+ "(?, ?, ?)";
		
		stmt = DBConnector.getPreparedStmt(sql);
		
		for (Choice choice: choices) {
			stmt.setString(1, choice.id);
			stmt.setString(2, this.id);
			stmt.setString(3, choice.content);
			stmt.addBatch();
		}
		
		stmt.executeBatch();
		
	}
	
}
