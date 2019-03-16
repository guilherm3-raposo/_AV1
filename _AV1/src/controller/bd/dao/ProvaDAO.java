package controller.bd.dao;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import controller.bd.conexao.Conexao;
import model.beans.ProvaBean;

public class ProvaDAO {
	private static ProvaBean constroiProva(ResultSet rs) throws SQLException, IOException {
		ProvaBean prova = new ProvaBean(rs.getString("prova"),
				new String(rs.getBytes("base64"), StandardCharsets.UTF_8));
		return prova;
	}

	public ProvaBean consulta(String idProva) throws SQLException, IOException {
		Connection conexao = Conexao.abreConexao();
		Statement st = conexao.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM provas WHERE prova = '" + idProva + "';");
		try {
			if (rs.first()) {
				return constroiProva(rs);
			}
		} finally {
			Conexao.fechaConexao();
		}
		return null;
	}

	public Map<String, String> consultaTodos() throws SQLException, IOException {
		Connection conexao = Conexao.abreConexao();
		Statement st = conexao.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM provas;");
		ProvaBean prova;
		Map<String, String> provas = new HashMap<String, String>();
		try {
			while (rs.next()) {
				prova= constroiProva(rs);
				provas.put(prova.getIdProva(), prova.getBase64());
			}
		} finally {
			Conexao.fechaConexao();
		}
		return provas;
	}

	public boolean update(ProvaBean prova) throws SQLException {
		Connection conexao = Conexao.abreConexao();

		PreparedStatement pst = conexao.prepareStatement("UPDATE provas SET base64 = ? WHERE prova = ?");
		pst.setBytes(1, prova.getBase64().getBytes());
		pst.setString(2, prova.getIdProva());
		pst.executeUpdate();
		return true;
	}
}