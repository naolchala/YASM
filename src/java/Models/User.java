package Models;

import Exceptions.FormException;
import Exceptions.UserDontExistException;
import Utils.DBConnector;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Map;
import java.util.Map.Entry;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

public class User {

	public String id;
	public String firstName;
	public String lastName;
	public String email;
	public String password;
	public String securityQuestion;
	public String securityAnswer;
	public String gender;
	public String profileUrl;

	public User(String id, String firstName, String lastName, String email, String password, String securityQuestion,
		String securityAnswer) {
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.securityQuestion = securityQuestion;
		this.securityAnswer = securityAnswer;
	}

	public User(String firstName, String lastName, String email, String password, String securityQuestion,
		String securityAnswer) {
		this.id = UUID.randomUUID().toString();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.securityQuestion = securityQuestion;
		this.securityAnswer = securityAnswer;
	}

	public User(ResultSet rs) throws SQLException {
		this.id = rs.getString("id");
		this.firstName = rs.getString("firstName");
		this.lastName = rs.getString("lastName");
		this.email = rs.getString("email");
		this.password = rs.getString("password");
		this.securityQuestion = rs.getString("securityQuestion");
		this.securityAnswer = rs.getString("securityAnswer");
		this.gender = rs.getString("gender");
		this.profileUrl = rs.getString("profileUrl");
	}

	public static User login(String email, String password) throws SQLException, FormException {
		String sql = "SELECT * FROM User WHERE email=?";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, email);
		ResultSet rs = stmt.executeQuery();
		if (!rs.next()) {
			throw new FormException("email", "Account with that email doesn't exist");
		}
		User user = new User(rs);
		if (!password.equals(user.password)) {
			throw new FormException("password", "Incorrect Password, try again!");
		}
		return user;
	}

	public void save() throws SQLException, FormException {
		String CheckDuplicateSQL = "SELECT COUNT(*) FROM User WHERE email=?";
		PreparedStatement stmt = DBConnector.getPreparedStmt(CheckDuplicateSQL);
		stmt.setString(1, email);
		ResultSet rs = stmt.executeQuery();
		if (rs.next() && rs.getInt(1) > 0) {
			throw new FormException("email", "User Already Exists");
		}

		String sql = "INSERT INTO User "
			+ "(id, firstName, lastName, email, password, securityQuestion, securityAnswer, gender, profileUrl)"
			+ "VALUES"
			+ "(?, ?, ?, ?, ?, ?, ?, ?, ?)";

		stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, id);
		stmt.setString(2, firstName);
		stmt.setString(3, lastName);
		stmt.setString(4, email);
		stmt.setString(5, password);
		stmt.setString(6, securityQuestion);
		stmt.setString(7, securityAnswer);
		stmt.setString(8, gender);
		stmt.setString(9, profileUrl);
		stmt.executeUpdate();

	}

	public String getFullname() {
		return this.firstName + " " + this.lastName;
	}

	public String getProfileUrl() {
		return "uploads/profile-pictures/" + (this.profileUrl == null ? "default.png" : this.profileUrl);
	}

	public ArrayList<User> getFriends() throws SQLException {
		ArrayList<User> friends = new ArrayList<>();
		String sql = "SELECT User.* FROM User, FriendRequest "
			+ "WHERE (FriendRequest.toId=? AND FriendRequest.fromId = User.id) "
			+ "OR (FriendRequest.fromId=? AND FriendRequest.toId = User.id) "
			+ "AND FriendRequest.status = \"ACCEPTED\" "
			+ "ORDER BY FriendRequest.datetime DESC";

		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, this.id);
		stmt.setString(2, this.id);
		ResultSet rs = stmt.executeQuery();

		while (rs.next()) {
			friends.add(new User(rs));
		}

		return friends;
	}
	
	public ArrayList<String> getFriendsID() throws SQLException {
		ArrayList<String> ids = new ArrayList<String>();
		ids.add(this.id);
		for (User u: getFriends()) {
			ids.add(u.id);
		}
		
		return ids;
	}

	public ArrayList<User> getFriendRequests() throws SQLException {
		ArrayList<User> requests = new ArrayList<>();
		String sql = "SELECT User.* FROM User, FriendRequest "
			+ "WHERE FriendRequest.status='WAITING' AND FriendRequest.toId = ? AND FriendRequest.fromId = User.id;";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, this.id);
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
			requests.add(new User(rs));
		}
		return requests;
	}

	public ArrayList<User> getRandomFriendSuggestion() throws SQLException {
		String sql = "SELECT User.id FROM User, FriendRequest "
			+ "WHERE (FriendRequest.toId=? AND FriendRequest.fromId = User.id) "
			+ "OR (FriendRequest.fromId=? AND FriendRequest.toId = User.id) "
			+ "ORDER BY FriendRequest.datetime DESC";

		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, this.id);
		stmt.setString(2, this.id);
		ResultSet rs = stmt.executeQuery();

		ArrayList<String> exclusionList = new ArrayList<>();

		while (rs.next()) {
			exclusionList.add(rs.getString("id"));
		}

		if (exclusionList.isEmpty()) {
			sql = "SELECT * FROM User "
				+ "WHERE id != ? "
				+ "ORDER BY RAND() LIMIT 10 ";
			
			stmt = DBConnector.getPreparedStmt(sql);
			stmt.setString(1, this.id);

		} else {
			StringBuilder excludeIn = new StringBuilder();
			boolean first = true;
			for (String id : exclusionList) {
				if (!first) {
					excludeIn.append(',');
				}
				excludeIn.append("'" + id + "'");
				first = false;
			}

			sql = "SELECT * FROM User "
				+ "WHERE id NOT IN (" + excludeIn.toString() + ") "
				+ "AND id != ? "
				+ "ORDER BY RAND() LIMIT 10";
			
			stmt = DBConnector.getPreparedStmt(sql);
			stmt.setString(1, this.id);
		}

		ArrayList<User> randList = new ArrayList<User>();

		rs = stmt.executeQuery();

		while (rs.next()) {
			randList.add(new User(rs));
		}

		return randList;
	}

	public void changeProfilePicture(String profileUrl) throws SQLException {
		this.profileUrl = profileUrl;
		String sql = "UPDATE User SET "
			+ "profileUrl=?"
			+ "WHERE id=?";

		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, this.profileUrl);
		stmt.setString(2, this.id);
		stmt.executeUpdate();

	}

	public void updateName(String firstName, String lastName) throws SQLException {
		this.firstName = firstName;
		this.lastName = lastName;
		String sql = "UPDATE User SET firstName=?, lastName=? WHERE id=?";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, this.firstName);
		stmt.setString(2, this.lastName);
		stmt.setString(3, this.id);
		stmt.executeUpdate();

	}

	public void updatePassword(String newPassword) throws SQLException {
		this.password = newPassword;
		String sql = "UPDATE User SET password=? WHERE id=?";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, this.password);
		stmt.setString(2, this.id);
		stmt.executeUpdate();

	}

	public void updateSecurityQuestionAnswer(String secQuestion, String secAnswer) throws SQLException {
		this.securityAnswer = secAnswer;
		this.securityQuestion = secQuestion;
		String sql = "UPDATE User SET securityQuestion=?,  securityAnswer=? WHERE id=?";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, this.securityQuestion);
		stmt.setString(2, this.securityAnswer);
		stmt.setString(3, this.id);

		stmt.executeUpdate();
	}

	public void sendFriendRequest(String userId) throws SQLException {
		new FriendRequest(id, userId).save();
	}

	public static ArrayList<User> findMany(Map<String, String> where) {
		ArrayList<User> users = new ArrayList<User>();
		StringBuilder sql = new StringBuilder("SELECT * FROM User WHERE ");
		boolean first = true;
		for (Entry<String, String> e : where.entrySet()) {
			if (!first) {
				sql.append("AND ");
			}
			sql.append(e.getKey() + "=? ");
			first = false;
		}

		Logger.getLogger(DBConnector.class.getName()).log(Level.INFO, sql.toString());

		return users;
	}

	public static User findById(String id) throws SQLException, UserDontExistException {
		String sql = "SELECT * FROM User WHERE id=?";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, id);

		ResultSet rs = stmt.executeQuery();

		if (!rs.next()) {
			throw new UserDontExistException();
		}

		return new User(rs);
	}

	public static User findByEmail(String email) throws SQLException, UserDontExistException {
		String sql = "SELECT * FROM User WHERE email=?";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, email);

		ResultSet rs = stmt.executeQuery();

		if (!rs.next()) {
			throw new UserDontExistException();
		}

		return new User(rs);
	}

	public static ArrayList<User> search(String keyword) throws SQLException {
		ArrayList<User> searchResults = new ArrayList<User>();
		String sql = "SELECT * FROM User WHERE firstName LIKE ? OR lastName LIKE ?";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		
		stmt.setString(1,  keyword + "%");
		stmt.setString(2, keyword + "%");
		
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
			searchResults.add(new User(rs));
		}
		
		return searchResults;
	}
}
