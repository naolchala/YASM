
package Models;

import Exceptions.UserDontExistException;
import Models.Constants.PostTypes;
import Utils.DBConnector;
import Utils.ServletUtils;
import java.sql.*;
import java.time.Instant;
import java.util.ArrayList;
import java.util.UUID;

public class Post {
	public String id;
	public User postedBy;
	public Timestamp postedAt;
	public PostTypes type;
	public ArrayList<Reaction> reactions = new ArrayList<Reaction>();
	public int commentCount = 0;
	
	public Post(String id) throws SQLException {
		this.id = id;
		this.loadLikes();
		this.countComments();
	}

	public Post(User user, PostTypes type) {
		this.id = UUID.randomUUID().toString();
		this.postedBy = user;
		this.type = type;
		this.postedAt = Timestamp.from(Instant.now());
	}
	
	
	void save() throws SQLException {
		String sql = "INSERT INTO Posts "
			+ "(id, userId, postedAt, type) "
			+ "VALUES"
			+ "(?, ?, ?, ?)";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, this.id);
		stmt.setString(2, this.postedBy.id);
		stmt.setTimestamp(3, this.postedAt);
		stmt.setString(4, this.type.toString());
		stmt.executeUpdate();
	}
	
	public static User getPoster(String postId) throws SQLException {
		String sql = "SELECT User.* FROM User, Posts WHERE Posts.id=? AND Posts.userId = User.id";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, postId);
		ResultSet rs = stmt.executeQuery();
		rs.next();
		return new User(rs);
	}
	
	
	public static Post findById(String postId) throws SQLException, UserDontExistException {
		String sql  = "SELECT * FROM Posts WHERE id=?";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, postId);
		ResultSet rs = stmt.executeQuery();
		
		if (rs.next()) {
			PostTypes type = PostTypes.valueOf(rs.getString("type"));	
			User poster = User.findById(rs.getString("userId"));
			
			Post p;
			switch (type) {
				case BLOG: {
					p = Blog.getById(rs.getString("id"));
					break;	
				}
				case STORY: {
					p = Story.getById(rs.getString("id"));
					break;
				}
				case POLL:{
					p = Poll.getById(rs.getString("id"));
					break;
				}
				default:
					p = null;
					break;
			}
			
			p.postedAt = rs.getTimestamp("postedAt");
			p.postedBy = poster;
			
			return p;
		}
		
		return null;
	}
	
	
	
	public static ArrayList<Post> getPostsForUser(User user, int page) throws SQLException {
		ArrayList<Post> posts = new ArrayList<Post>();
		String friendsID = ServletUtils.formatInStatement(user.getFriendsID());
		int take = 20;
		int offset  = (page - 1) * take;
		
		String sql = "SELECT * FROM Posts, User WHERE "
			+ "userId IN " + friendsID + " AND "
			+ "User.id = Posts.userId ORDER BY postedAt DESC LIMIT ?, ?";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setInt(1, offset);
		stmt.setInt(2, take);
		
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			PostTypes type = PostTypes.valueOf(rs.getString("type"));
			
			User poster = new User(rs);
			poster.id = rs.getString("userId");
			
			Post p;
			switch (type) {
				case BLOG: {
					p = Blog.getById(rs.getString("id"));
					break;	
				}
				case STORY: {
					p = Story.getById(rs.getString("id"));
					break;
				}
				case POLL:{
					p = Poll.getById(rs.getString("id"));
					break;
				}
				default:
					p = null;
			}
			
			p.postedAt = rs.getTimestamp("postedAt");
			p.postedBy = poster;
			
			posts.add(p);
		}
		
		return posts;
	}
	
	public static ArrayList<Post> explore(int page) throws SQLException {
		ArrayList<Post> posts = new ArrayList<Post>();
		int take = 5;
		int offset  = (page - 1) * take;
		
		String sql = "SELECT * FROM Posts, User WHERE "
			+ "User.id = Posts.userId ORDER BY postedAt DESC LIMIT ?, ?";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setInt(1, offset);
		stmt.setInt(2, take);
		
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			PostTypes type = PostTypes.valueOf(rs.getString("type"));
			
			User poster = new User(rs);
			poster.id = rs.getString("userId");
			
			Post p;
			switch (type) {
				case BLOG: {
					p = Blog.getById(rs.getString("id"));
					break;	
				}
				case STORY: {
					p = Story.getById(rs.getString("id"));
					break;
				}
				case POLL:{
					p = Poll.getById(rs.getString("id"));
					break;
				}
				default:
					p = null;
			}
			
			p.postedAt = rs.getTimestamp("postedAt");
			p.postedBy = poster;
			
			posts.add(p);
		}
		
		return posts;
	}

	
	public void loadLikes() throws SQLException {
		ArrayList<Reaction> reactions = new ArrayList<Reaction>();
		String sql = "SELECT * FROM Reactions WHERE postId=?";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, this.id);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			reactions.add(new Reaction(rs));
		}
		
		this.reactions = reactions;
	}
	
	public void countComments() throws SQLException { 
		String sql = "SELECT COUNT(*) FROM Comments WHERE postId=?";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, this.id);
		ResultSet rs = stmt.executeQuery();
		rs.next();
		this.commentCount = rs.getInt(1);
	}
	
	public ArrayList<Comment> getComments() throws SQLException, UserDontExistException {
		ArrayList<Comment> comments = new ArrayList<Comment>();
		String sql  = "SELECT * FROM Comments WHERE postId=? ORDER BY commentedAt";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, this.id);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			comments.add(new Comment(rs));
		}
		
		return comments;
	}
	
	public boolean isLiked(User u) {	
		for (Reaction r: this.reactions) {
			if (r.userId.equals(u.id)) {
				return true;
			}
		}
		return false;
	}
	
}