package com.iberry.login.bean;

public class userLogin 
{
	private String idUserLogin;
	private String password;


	
	public userLogin(String idUserLogin, String password) 
	{
		super();
		this.idUserLogin = idUserLogin;
		this.password = password;
	}
	
	public String getIdUserLogin() {
		return idUserLogin;
	}
	public void setIdUserLogin(String idUserLogin) {
		this.idUserLogin = idUserLogin;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
