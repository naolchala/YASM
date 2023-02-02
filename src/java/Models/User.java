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
	
	public String getFullname() {
		return this.firstName + " " + this.lastName;
	}
	
	public String getProfileUrl() {
		return "uploads/profile-pictures/" + this.profileUrl;
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

//    public ArrayList<User> friends() {
//	    
//    }
//    
//    public ArrayList<User> friendRequests() {
//	    
//    }
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
	
	public void updatePassword(String newPassword) throws SQLException {
		String sql = "UPDATE User SET password=? WHERE id=?";
		PreparedStatement stmt = DBConnector.getPreparedStmt(sql);
		stmt.setString(1, newPassword);
		stmt.setString(2, this.id);
		stmt.executeUpdate();
	}
}
