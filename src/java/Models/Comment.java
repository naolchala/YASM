/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import Exceptions.UserDontExistException;
import java.sql.*;
import java.util.UUID;

public class Comment {
	public String id;
	public String content;
	public String postId;
	public String userId;
	public Post post;
	public User user;

	public Comment(String content, String postId, User user) {
		this.id = UUID.randomUUID().toString();
		this.content = content;
		this.postId = postId;
		this.user = user;
		this.userId = user.id;
	}

	public Comment(ResultSet rs) throws SQLException, UserDontExistException {
		this.id = rs.getString("id");
		this.content = rs.getString("content");
		this.userId = rs.getString("userId");
		this.postId = rs.getString("postId");
		this.user = User.findById(this.userId);
	}
}
