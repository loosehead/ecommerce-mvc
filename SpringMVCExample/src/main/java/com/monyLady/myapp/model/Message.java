// default package
// Generated 1 janv. 2015 18:48:45 by Hibernate Tools 3.4.0.CR1

package com.monyLady.myapp.model;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Message generated by hbm2java
 */
@Entity
@Table(name = "message", catalog = "monylady")
public class Message implements java.io.Serializable {

	private Integer messageId;
	private Person person;
	private ServiceCase serviceCase;
	private char empOrCust;
	private short sequence;
	private String message;

	public Message() {
	}

	public Message(Person person, ServiceCase serviceCase, char empOrCust,
			short sequence, String message) {
		this.person = person;
		this.serviceCase = serviceCase;
		this.empOrCust = empOrCust;
		this.sequence = sequence;
		this.message = message;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "messageID", unique = true, nullable = false)
	public Integer getMessageId() {
		return this.messageId;
	}

	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "personID", nullable = false)
	public Person getPerson() {
		return this.person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "caseID", nullable = false)
	public ServiceCase getServiceCase() {
		return this.serviceCase;
	}

	public void setServiceCase(ServiceCase serviceCase) {
		this.serviceCase = serviceCase;
	}

	@Column(name = "empOrCust", nullable = false, length = 1)
	public char getEmpOrCust() {
		return this.empOrCust;
	}

	public void setEmpOrCust(char empOrCust) {
		this.empOrCust = empOrCust;
	}

	@Column(name = "sequence", nullable = false)
	public short getSequence() {
		return this.sequence;
	}

	public void setSequence(short sequence) {
		this.sequence = sequence;
	}

	@Column(name = "message", nullable = false, length = 1000)
	public String getMessage() {
		return this.message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
