package main;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class Main {

	public static void dump(Connection connection) {
		FileReader fr;
		try {
			fr = new FileReader(new File("dump.sql"));
		} catch (FileNotFoundException e) {
			System.out.println(e);
			return;
		}
		BufferedReader br = new BufferedReader(fr);
		StringBuffer sb = new StringBuffer();
		sb.append(br.lines());
		try {
			br.close();
		} catch (IOException e) {
			System.out.println(e);
			return;
		}
		String code = "";
		for (System.out.println(code)) {
		}
		PreparedStatement preparedStatement = connection.createStatement(sb);
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
