package model.beans;

public class ProvaBean {
	private String idProva;
	private String base64;
	private String chaveMD5;
	private String questoes;
	private String observacoes;
	private String data;

//	---------------------
//	TODO FAZER O toString
//	---------------------

	public ProvaBean() {
	}

	public ProvaBean(String idProva, String chaveMD5, String questoes, String base64, String observacoes,
			String data) {
		setIdProva(idProva);
		setChaveMD5(chaveMD5);
		setQuestoes(questoes);
		setObservacoes(observacoes);
		setData(data);
	}

	public String getIdProva() {
		return idProva;
	}

	public void setIdProva(String idProva) {
		this.idProva = idProva;
	}

	public String getChaveMD5() {
		return chaveMD5;
	}

	public void setChaveMD5(String chaveMD5) {
		this.chaveMD5 = chaveMD5;
	}

	public String getQuestoes() {
		return questoes;
	}

	public void setQuestoes(String questoes) {
		this.questoes = questoes;
	}

	public String getObservacoes() {
		return observacoes;
	}

	public void setObservacoes(String observacoes) {
		this.observacoes = observacoes;
	}

	public String getBase64() {
		return base64;
	}

	public void setBase64(String base64) {
		this.base64 = base64;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}
}
