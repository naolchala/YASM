package Models;

import java.util.UUID;

public class Choice {
	public String id;
	String pollId;
	public String content;
	
	public Choice(String content) {
		this.id = UUID.randomUUID().toString();
		this.content = content;
	}
}
