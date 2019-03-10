package model.bd.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.bd.conexao.Conexao;
import model.beans.LoginBean;


public class LoginDAO {
	
	private static LoginBean constroiLogin(ResultSet rs) throws SQLException  {
		LoginBean login = new LoginBean(rs.getString(1),
						 		rs.getString(2),
						 		false);
		return login;
	}
	
	public boolean consulta(LoginBean usuario) throws SQLException {
		Connection conexao = Conexao.abreConexao();
		Statement st = conexao.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM usuario WHERE login = '" + usuario.getUsername() + "';");
			if (rs.first()) {
				return constroiLogin(rs).getPassword().matches(usuario.getPassword());
			}
			return false;
	}

}
