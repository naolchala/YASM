
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
	
	public Post(String id) throws SQLException {
		this.id = id;
		loadLikes();
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
	
	
	
	
	
	public static ArrayList<Post> getPostsForUser(User user) throws SQLException {
		ArrayList<Post> posts = new ArrayList<Post>();
		String friendsID = ServletUtils.formatInStatement(user.getFriendsID());
		
		String sql = "SELECT * FROM Posts, User WHERE "
			+ "userId IN " + friendsID + " AND "
			+ "User.id = Posts.userId ORDER BY postedAt DESC";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			PostTypes type = PostTypes.valueOf(rs.getString("type"));
			
			User poster = new User(rs);
			poster.id = rs.getString("id");
			
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
	
	
	
	public boolean isLiked(User u) {
		
		for (Reaction r: this.reactions) {
			if (r.userId.equals(u.id)) {
				return true;
			}
		}
		return false;
	}
	
}