package com.iberry.login.bean;

public class contactBook 
{
	private int id;
	private int qId;
	private String name;
	private String address;
	private String dob;
	private String telno;
	private String landlineno;
	private String website;
	private String companyName;
	
	public contactBook() {
		super();
		// TODO Auto-generated constructor stub
	}

	public contactBook(String name, String address, String dob, String telno, String landlineno,
			String website, String companyName) 
	{
		super();
		//this.id = id;
		//this.qId = qId;
		this.name = name;
		this.address = address;
		this.dob = dob;
		this.telno = telno;
		this.landlineno = landlineno;
		this.website = website;
		this.companyName = companyName;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getqId() {
		return qId;
	}
	public void setqId(int qId) {
		this.qId = qId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getTelno() {
		return telno;
	}
	public void setTelno(String telno) {
		this.telno = telno;
	}
	public String getLandlineno() {
		return landlineno;
	}
	public void setLandlineno(String landlineno) {
		this.landlineno = landlineno;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
}
