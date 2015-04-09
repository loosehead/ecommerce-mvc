package com.monyLady.myapp.ligth;

/**
 * @author aouldch
 *
 */
public class PersonLight {
	
	private String lastName;
	private String firstName;
	private String password;
	private String login;
	private Integer question;
	private String securityAnswer;
	
	
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public Integer getQuestion() {
		return question;
	}
	public void setQuestion(Integer question) {
		this.question = question;
	}
	public String getSecurityAnswer() {
		return securityAnswer;
	}
	public void setSecurityAnswer(String securityAnswer) {
		this.securityAnswer = securityAnswer;
	}
	public PersonLight(String lastName, String firstName, String password,
			String login, Integer question, String securityAnswer) {
		super();
		this.lastName = lastName;
		this.firstName = firstName;
		this.password = password;
		this.login = login;
		this.question = question;
		this.securityAnswer = securityAnswer;
	}
	public PersonLight() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	

}
