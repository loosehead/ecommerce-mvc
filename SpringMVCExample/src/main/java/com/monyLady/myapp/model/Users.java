package com.monyLady.myapp.model;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "users", catalog = "monylady", uniqueConstraints = @UniqueConstraint(columnNames = "userId"))
public class Users implements java.io.Serializable {
	private static final long serialVersionID = 1L;
	private Integer userId;
	private String lastName;
	private String firstName;
	private String password;
	private String mail;

	public Users() {

	}

	public Users(String lastName, String firstName, String password, String mail) {
		this.lastName = lastName;
		this.firstName = firstName;
		this.mail = mail;
		this.password = password;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "userId", unique = true, nullable = false)
	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@Column(name = "lastName", nullable = false, length = 15)
	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	@Column(name = "firstName", nullable = false, length = 15)
	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	// ///////////////

	// /////////////////////
	@Column(name = "password", nullable = false, length = 50)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setPasswod(String password) {
		this.password = password;
	}

	@Column(name = "mail", nullable = false, length = 15)
	public String getMail() {
		return this.mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

}
