package com.monyLady.myapp.ligth;

public class UsersLight {
	
	private String firstName;
	private String lastName;
	private String mail;
	private String password;
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public UsersLight(String firstName, String lastName, String mail, String password){
		this.firstName= firstName;
		this.lastName=lastName;
		this.mail=mail;
		this.password=password;
	}
	public UsersLight() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	

}
