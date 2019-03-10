package model.beans;

public class LoginBean {

	private String username;
	private String password;
	public boolean valid;

//	---------------------
//	TODO FAZER O toString
//	---------------------

	public LoginBean() {
	}
	
	public LoginBean(String username, String password, boolean valid) {
		super();
		this.username = username;
		this.password = password;
		this.valid = valid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String newPassword) {
		password = newPassword;
	}

	public String getUsername() {
		return username;
	}

	public void setUserName(String newUsername) {
		username = newUsername;
	}

	public boolean isValid() {
		return valid;
	}

	public void setValid(boolean newValid) {
		valid = newValid;
	}
}
