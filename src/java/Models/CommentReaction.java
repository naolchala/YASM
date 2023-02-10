package Models;

import Models.Constants.CommentReactionTypes;
import Utils.DBConnector;
import java.util.UUID;
import java.sql.*;

public class CommentReaction {

	String id;
	String userId;
	String commentId;
	CommentReactionTypes type;

	public CommentReaction(User user, String commentId, CommentReactionTypes type) {
		this.id = UUID.randomUUID().toString();
		this.userId = user.id;
		this.commentId = commentId;
		this.type = type;
	}

	public CommentReaction(ResultSet rs) throws SQLException {
		this.id = rs.getString("id");
		this.userId = rs.getString("userId");
		this.commentId = rs.getString("commentId");
		this.type = CommentReactionTypes.valueOf(rs.getString("type"));
	}

	/**
	 * *
	 *
	 * @param userID
	 * @return 0 for not voted, 1 for upvoted, -1 for downvoted
	 * @throws SQLException
	 */
	public static CommentReactionTypes isUserVoted(String userID, String commentId) throws SQLException {

		String sql = "SELECT * FROM CommentReactions WHERE userId=? AND commentId=?";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, userID);
		stmt.setString(2, commentId);
		ResultSet rs = stmt.executeQuery();

		if (rs.next()) {
			CommentReactionTypes type = CommentReactionTypes.valueOf(rs.getString("type"));
			return type;
		}

		return CommentReactionTypes.NONE;
	}

	public void save() throws SQLException {
		CommentReactionTypes voteStatus = isUserVoted(this.userId, this.commentId);

		if (voteStatus == this.type) {
			String sql = "DELETE FROM CommentReactions WHERE commentId=? AND userId=?";
			PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
			stmt.setString(1, this.commentId);
			stmt.setString(2, this.userId);
			stmt.executeUpdate();
			
		} else if (voteStatus == CommentReactionTypes.DOWNVOTE || voteStatus == CommentReactionTypes.UPVOTE) {
			String sql = "UPDATE CommentReactions SET type=? WHERE commentId=? AND userId=?";
			PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
			stmt.setString(1, this.type.toString());
			stmt.setString(2, this.commentId);
			stmt.setString(3, this.userId);
			stmt.executeUpdate();
		} else {
			String sql = "INSERT INTO CommentReactions "
				+ "(id, commentId, userId, type) "
				+ "VALUES "
				+ "(?, ?, ?, ?)";
			PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
			stmt.setString(1, this.id);
			stmt.setString(2, this.commentId);
			stmt.setString(3, this.userId);
			stmt.setString(4, this.type.toString());

			stmt.executeUpdate();
		}

		
	}
}
