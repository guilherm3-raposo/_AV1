package model.bd.dao;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.bd.conexao.Conexao;
import model.beans.ProvaBean;

public class ProvaDAO {
	private static ProvaBean constroiProva(ResultSet rs) throws SQLException, IOException {
		ProvaBean prova = new ProvaBean(rs.getString("prova"), rs.getString("md5"),
							 new String(rs.getBytes("questoes"), StandardCharsets.UTF_8),
							 new String(rs.getBytes("base64"), StandardCharsets.UTF_8),
							 new String(rs.getBytes("observacao"), StandardCharsets.UTF_8), 
									    rs.getString("dataHora"));
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

	public boolean insere(ProvaBean prova) throws SQLException {
		Connection conexao = Conexao.abreConexao();


		PreparedStatement pst = conexao.prepareStatement(
				"INSERT INTO provas (prova, questoes, observacao, dataHora, base64) VALUES (?, ?, ?, ?, ?);");
		pst.setString(1, prova.getIdProva());
		pst.setBytes(2, prova.getQuestoes().getBytes());
		pst.setBytes(3, prova.getObservacoes().getBytes());
		pst.setString(4, prova.getData());
		pst.setBytes(5, prova.getBase64().getBytes());
		pst.executeUpdate();
		return true;
	}
}