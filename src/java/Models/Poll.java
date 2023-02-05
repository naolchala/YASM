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
	
	public void addChoice(Choice choice) {
		choices.add(choice);
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
