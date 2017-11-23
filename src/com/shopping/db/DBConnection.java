package com.shopping.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * 
 * @author sai
 * 
 *         This is a singleton class to create DB Connection
 */
public class DBConnection {

	private static Connection conn;

	// Private Constructor can only be accessed by the singleton class
	// using static factory method
	private DBConnection() {
		try {
			Class.forName("org.sqlite.JDBC");
			conn = DriverManager.getConnection("jdbc:sqlite:/Users/archus/Downloads/sqlite-tools-osx-x86-3210000/testDB");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Static Factory Method
	@SuppressWarnings("static-access")
	public static Connection getConnecton() {
		if (conn != null) {
			return conn;
		} else {
			return new DBConnection().conn;
		}
	}
}
