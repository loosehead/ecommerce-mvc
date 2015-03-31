// default package
// Generated 1 janv. 2015 18:48:45 by Hibernate Tools 3.4.0.CR1


package com.monyLady.myapp.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Review generated by hbm2java
 */
@Entity
@Table(name = "review", catalog = "monylady")
public class Review implements java.io.Serializable {

	private Integer reviewId;
	private Customer customer;
	private Product product;
	private short rating;
	private String review;

	public Review() {
	}

	public Review(Customer customer, Product product, short rating,
			String review) {
		this.customer = customer;
		this.product = product;
		this.rating = rating;
		this.review = review;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "reviewID", unique = true, nullable = false)
	public Integer getReviewId() {
		return this.reviewId;
	}

	public void setReviewId(Integer reviewId) {
		this.reviewId = reviewId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "customerID", nullable = false)
	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "productID", nullable = false)
	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Column(name = "rating", nullable = false)
	public short getRating() {
		return this.rating;
	}

	public void setRating(short rating) {
		this.rating = rating;
	}

	@Column(name = "review", nullable = false, length = 2000)
	public String getReview() {
		return this.review;
	}

	public void setReview(String review) {
		this.review = review;
	}

}
