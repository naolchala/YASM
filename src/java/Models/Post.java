/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.*;
import java.time.Instant;
import java.util.UUID;

public class Post {
	public String id;
	public User user;
	public Timestamp postedAt;
	public boolean isLiked;
	public PostTypes type;

	public Post(User user, PostTypes type) {
		this.id = UUID.randomUUID().toString();
		this.user = user;
		this.type = type;
		this.postedAt = Timestamp.from(Instant.now());
	}
	
}