package Utils;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnector {

	private static Connection conn;
	private static String HOSTNAME = "jdbc:mysql://localhost:3306/YASM";
	private static String USER = "root";
	private static String PASSWORD = "";

	private static void connect() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(HOSTNAME, USER, PASSWORD);
		} catch (SQLException ex) {
			Logger.getLogger(DBConnector.class.getName()).log(Level.SEVERE, null, ex);
		} catch (ClassNotFoundException ex) {
			Logger.getLogger(DBConnector.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

	public static Connection getConn() {
		if (conn == null) {
			connect();
		}
		return conn;
	}

	public static PreparedStatement getPreparedStmt(String sql) throws SQLException {
		return getConn().prepareStatement(sql);
	}

	@Override
	protected void finalize() throws SQLException, Throwable {
		try {
			conn.close();
		} finally {
			super.finalize();
		}
	}

}
