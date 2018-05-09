package main;

import com.mysql.cj.xdevapi.SqlDataResult;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class Main {

	public static void dump(Connection connection) {
		FileReader fr;
		try {
			fr = new FileReader(new File("dump.sql"));
		} catch (FileNotFoundException e) {
			System.out.println(e);
			return;
		}
		String s;
		BufferedReader br = new BufferedReader(fr);
		StringBuffer sb = new StringBuffer();
		try {
			while ((s = br.readLine()) != null) {
				if (s.isEmpty()) continue;
				sb.append(s);
//				PreparedStatement preparedStatement = connection.prepareStatement(s);
//				System.out.println(s + " -> " + preparedStatement.executeBatch());
			}
			System.out.println(sb);
			PreparedStatement preparedStatement = connection.prepareStatement(sb.toString());
			System.out.println(preparedStatement.executeBatch());
			br.close();
		} catch (IOException | SQLException e) {
			System.out.println(e);
			return;
		}
		System.out.println("Dump successful");
	}

	public static void main(String[] args) {
		System.out.println("Nice");
		Connection connection = MySQLConnection.getDatabaseConnection();
		if (connection == null) {
			System.out.println("Connection failed");
			return;
		}
		System.out.println("Connection successful");

		dump(connection);
	}
}
