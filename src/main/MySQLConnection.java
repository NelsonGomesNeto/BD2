package main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConnection {
	private static Connection connection = null;
	private static String USERNAME = "root";
	private static String PASSWORD = "Nelson40!@";
	private static String URL = "jdbc:mysql://localhost:3306";

	public static Connection getDatabaseConnection(){
		try {
			return connection = DriverManager.getConnection(URL,USERNAME,PASSWORD);
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		}

	}
}
