package model.bd.conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
//	private static Configuracoes config = new Configuracoes();
	private static Connection conexao = null;

	public static Connection abreConexao() {
//		Properties prop = config.carrega();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conexao = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/av1?useSSL=true&serverTimezone=America/Sao_Paulo", "root", "12345");
//					prop.getProperty("base.conector", "jdbc:mysql://") + prop.getProperty("base.ip", "localhost:3306/")
//							+ prop.getProperty("base.nome") + "?useSSL=" + prop.getProperty("base.ssl", "false")
//							+ "&serverTimezone=" + TimeZone.getDefault().getID(),
//					prop.getProperty("base.usr"), prop.getProperty("base.pwd"));
		} catch (SQLException | ClassNotFoundException e) {
		}
		return conexao;
	}

	public static void fechaConexao() {
		if (conexao instanceof Connection)
			try {
				conexao.close();
			} catch (SQLException e) {
			}
		conexao = null;
	}
}
