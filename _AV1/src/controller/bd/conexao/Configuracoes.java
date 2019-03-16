package controller.bd.conexao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class Configuracoes {
	private static final String CONFIGURACOES = "dados/configuracoes.properties";

	public Configuracoes() {
	}

	public Properties carrega() {
		try {
			Properties prop = new Properties();
			InputStream is = new FileInputStream(new File(CONFIGURACOES));
			prop.load(is);
			is.close();
			return prop;
		} catch (IOException e) {
		}
		return null;
	}

	public boolean salva(Properties prop) {
		try {
			FileOutputStream arquivoSaida = new FileOutputStream(new File(CONFIGURACOES));
			prop.store(arquivoSaida, "Alterado em: ");
			arquivoSaida.close();
			return true;
		} catch (IOException e) {
		}
		return true;
	}
}
