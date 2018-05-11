package main;

import com.mysql.cj.xdevapi.SqlDataResult;
import sun.plugin2.main.client.DisconnectedExecutionContext;

import java.io.*;
import java.sql.*;
import java.util.Scanner;

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
			}
			//System.out.println(sb);
			PreparedStatement preparedStatement = connection.prepareStatement(sb.toString());
			br.close();
		} catch (IOException | SQLException e) {
			System.out.println(e);
			return;
		}
		System.out.println("Dump successful");
	}

	public static void insertFiveTenist(Connection connection) {
		try {
			Scanner scanner = new Scanner(System.in);
			for (int i = 0; i < 5; i ++) {
				String name, nickname; int birthYear; String birthCity, townHouse; int isActive;
				System.out.print("Name: "); name = scanner.nextLine();
				System.out.print("Nickname: "); nickname = scanner.nextLine();
				System.out.print("Birth Year: "); birthYear = scanner.nextInt(); scanner.nextLine();
				System.out.print("Birth City: "); birthCity = scanner.nextLine();
				System.out.print("Town house: "); townHouse = scanner.nextLine();
				System.out.print("Is active: "); isActive = scanner.nextInt(); scanner.nextLine();
				PreparedStatement preparedStatement = connection.prepareStatement("insert into tenista (nome, apelido, ano_nasc, cidade_nascimento, cidade_moradia, esta_ativo)" +
					" values (\"" + name + "\", \"" + nickname + "\", \"" + (String.valueOf(birthYear)) + "\", \"" + birthCity + "\", \"" + townHouse + "\", \"" + (String.valueOf(isActive)) + "\")");
				preparedStatement.execute();
			}
			scanner.close();
		} catch (SQLException e) {
			System.out.println(e);
			return;
		}
	}

	public static void remove2009ArapiracaOpen(Connection connection) {
		try {
			PreparedStatement preparedStatement = connection.prepareStatement("delete from participar where participar.id_torneio = (select id_torneio from torneio as t where t.nome = \"Arapiraca Open\") and participar.ano = 2009");
			System.out.println("Removed 2009 Arapiraca Open");
			return;
		} catch (SQLException e) {
			System.out.println(e);
			return;
		}
	}

	public static void listActivePlayers(Connection connection) {
		try {
			PreparedStatement preparedStatement = connection.prepareStatement("select nome, apelido, ano_nasc from tenista where tenista.esta_ativo = true");
			ResultSet resultSet = preparedStatement.executeQuery();
			System.out.println("name, nickname, birth year");
			while (resultSet.next()) {
				String line = resultSet.getString(1) + ", " + resultSet.getString(2) + ", " + resultSet.getString(3);
				System.out.println(line);
			}
		} catch (SQLException e) {
			System.out.println(e);
			return;
		}
	}

	public static void listRolandGarrosPlayers(Connection connection) {
		try {
			PreparedStatement preparedStatement = connection.prepareStatement("select nome, (year(curdate()) - ano_nasc) as age from tenista where tenista.id in (select id_tenista from participar where id_torneio = (select id from torneio where nome = \"Roland Garros\"))");
			ResultSet resultSet = preparedStatement.executeQuery();
			System.out.println("name, age");
			while (resultSet.next()) {
				String line = resultSet.getString(1) + ", " + resultSet.getString(2);
				System.out.println(line);
			}
		} catch (SQLException e) {
			System.out.println(e);
			return;
		}
	}

	public static void listTournamentParticipations(Connection connection) {
		try {
			PreparedStatement preparedStatement = connection.prepareStatement("select (select nome from tenista where id = p.id_tenista), count(*) from participar as p group by id_tenista");
			ResultSet resultSet = preparedStatement.executeQuery();
			System.out.println("name, disputed");
			while (resultSet.next()) {
				String line = resultSet.getString(1) + ", " + resultSet.getString(2);
				System.out.println(line);
			}
		} catch (SQLException e) {
			System.out.println(e);
			return;
		}
	}

	public static void main(String[] args) {
		Connection connection = MySQLConnection.getDatabaseConnection();
		if (connection == null) {
			System.out.println("Connection failed");
			return;
		}
		System.out.println("Connection successful");

		dump(connection);
		try {
			PreparedStatement preparedStatement = connection.prepareStatement("use tenis");
			preparedStatement.execute();
			System.out.println("Using tenisDB");
		} catch (SQLException e) {
			System.out.println(e);
		}
		//remove2009ArapiracaOpen(connection);
		//listActivePlayers(connection);
		//listRolandGarrosPlayers(connection);
		//listTournamentParticipations(connection);
		//insertFiveTenist(connection);
	}
}
