/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import Exceptions.UserDontExistException;
import Models.Constants.CommentReactionTypes;
import Models.Constants.NotificationType;
import Utils.DBConnector;
import java.sql.*;
import java.time.Instant;
import java.util.ArrayList;
import java.util.UUID;

public class Comment {

	public String id;
	public String content;
	public String postId;
	public String userId;
	public Timestamp commentedAt;
	public Post post;
	public User user;
	public ArrayList<CommentReaction> commentReactions;
	public CommentReactionTypes userReaction;

	public Comment(String content, String postId, User user) {
		this.id = UUID.randomUUID().toString();
		this.content = content;
		this.postId = postId;
		this.user = user;
		this.userId = user.id;
		this.commentedAt = Timestamp.from(Instant.now());
	}

	public Comment(ResultSet rs) throws SQLException, UserDontExistException {
		this.id = rs.getString("id");
		this.content = rs.getString("content");
		this.userId = rs.getString("userId");
		this.postId = rs.getString("postId");
		this.user = User.findById(this.userId);
		this.commentedAt = rs.getTimestamp("commentedAt");
		this.userReaction = CommentReaction.isUserVoted(this.userId, this.id);
		loadReactions();
	}

	public void save() throws SQLException {
		String sql = "INSERT INTO Comments "
			+ "(id, userId, postId, content) "
			+ "VALUES "
			+ "(?, ?, ?, ?)";

		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, this.id);
		stmt.setString(2, this.userId);
		stmt.setString(3, this.postId);
		stmt.setString(4, this.content);

		stmt.executeUpdate();
		User postOwner = Post.getPoster(postId);

		if (!postOwner.id.equals(userId)) {
			new Notification(postOwner.id, userId, NotificationType.COMMENTED_POST, postId).save();
		}

	}

	public void loadReactions() throws SQLException {
		commentReactions = new ArrayList<>();
		String sql = "SELECT * FROM CommentReactions WHERE commentId=?";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, this.id);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			commentReactions.add(new CommentReaction(rs));
		}
	}
	
	public int getResult() {
		int count = 0;
		
		for (CommentReaction cr: commentReactions) {
			if (cr.type == CommentReactionTypes.UPVOTE) {
				count++;
			}else if (cr.type == CommentReactionTypes.DOWNVOTE) {
				count--;
			}
		}
		
		return count;
	}
	
	public CommentReactionTypes getUserReaction(String userId) {
		
		for (CommentReaction rxn: commentReactions) {
			if (rxn.userId.equals(userId)) {
				return rxn.type;
			}
		}
		
		return CommentReactionTypes.NONE;
	}
	
}
