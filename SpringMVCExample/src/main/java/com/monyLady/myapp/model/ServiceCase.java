// default package
// Generated 1 janv. 2015 18:48:45 by Hibernate Tools 3.4.0.CR1


package com.monyLady.myapp.model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * ServiceCase generated by hbm2java
 */
@Entity
@Table(name = "service_case", catalog = "monylady")
public class ServiceCase implements java.io.Serializable {

	private Integer caseId;
	private Customer customer;
	private Set<Message> messages = new HashSet<Message>(0);

	public ServiceCase() {
	}

	public ServiceCase(Customer customer) {
		this.customer = customer;
	}

	public ServiceCase(Customer customer, Set<Message> messages) {
		this.customer = customer;
		this.messages = messages;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "caseID", unique = true, nullable = false)
	public Integer getCaseId() {
		return this.caseId;
	}

	public void setCaseId(Integer caseId) {
		this.caseId = caseId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "customerID", nullable = false)
	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "serviceCase")
	public Set<Message> getMessages() {
		return this.messages;
	}

	public void setMessages(Set<Message> messages) {
		this.messages = messages;
	}

}
