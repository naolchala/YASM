package Models;

import Exceptions.UserDontExistException;
import Models.Constants.PostTypes;
import Utils.DBConnector;
import java.sql.*;
import java.util.ArrayList;
import java.util.UUID;

public class Blog extends Post {
	public String title;
	public String content;

	public Blog(User user, String title, String content) {
		super(user, PostTypes.BLOG);
		this.title = title;
		this.content = content;
	}
	
	public Blog(ResultSet rs) throws SQLException {
		super(rs.getString("id"));
		this.type = PostTypes.BLOG;
		this.title = rs.getString("title");
		this.content = rs.getString("content");
	}
	

	
	public static Blog getById(String id) throws SQLException {
		String sql = "SELECT * FROM Blogs WHERE id=?";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, id);
		ResultSet rs = stmt.executeQuery();
		if (rs.next()) {
			return new Blog(rs);
		};
		return null;
	}
	
	
	public void save() throws SQLException {
		super.save();
		String sql = "INSERT INTO Blogs "
			+ "(id, title, content) "
			+ "VALUES "
			+ "(?, ?, ?)";
		
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, this.id);
		stmt.setString(2, this.title);
		stmt.setString(3, this.content);
		
		stmt.executeUpdate();
	}
	
	public static ArrayList<Blog> search(String keyword) throws SQLException, UserDontExistException {
		ArrayList<Blog> searchResults = new ArrayList<Blog>();
		String sql = "SELECT * FROM Polls WHERE title LIKE '%?%'";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, keyword);
		
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
			Blog post = new Blog(rs);
			post.postedBy = User.findById(rs.getString("postedBy"));
			searchResults.add(new Blog(rs));
		}
		
		return searchResults;
	}
}

