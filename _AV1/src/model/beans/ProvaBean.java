package model.beans;

public class ProvaBean {
	private String idProva;
	private String base64;

//	---------------------
//	TODO FAZER O toString
//	---------------------

	public ProvaBean() {
	}

	public ProvaBean(String idProva, String base64) {
		setIdProva(idProva);
		setBase64(base64);
	}

	public String getIdProva() {
		return idProva;
	}

	public void setIdProva(String idProva) {
		this.idProva = idProva;
	}

	public String getBase64() {
		return base64;
	}

	public void setBase64(String base64) {
		this.base64 = base64;
	}
}
