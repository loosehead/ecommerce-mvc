// default package
// Generated 1 janv. 2015 18:48:45 by Hibernate Tools 3.4.0.CR1


package com.monyLady.myapp.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

/**
 * ProductsInWishList generated by hbm2java
 */
@Entity
@Table(name = "products_in_wish_list", catalog = "monylady", uniqueConstraints = @UniqueConstraint(columnNames = {
		"wishListID", "productID" }))
public class ProductsInWishList implements java.io.Serializable {

	private Integer productsInWishListId;
	private WishList wishList;
	private Product product;
	private short quantity;
	private Date timeAdded;

	public ProductsInWishList() {
	}

	public ProductsInWishList(WishList wishList, Product product,
			short quantity, Date timeAdded) {
		this.wishList = wishList;
		this.product = product;
		this.quantity = quantity;
		this.timeAdded = timeAdded;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "productsInWishListID", unique = true, nullable = false)
	public Integer getProductsInWishListId() {
		return this.productsInWishListId;
	}

	public void setProductsInWishListId(Integer productsInWishListId) {
		this.productsInWishListId = productsInWishListId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "wishListID", nullable = false)
	public WishList getWishList() {
		return this.wishList;
	}

	public void setWishList(WishList wishList) {
		this.wishList = wishList;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "productID", nullable = false)
	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Column(name = "quantity", nullable = false)
	public short getQuantity() {
		return this.quantity;
	}

	public void setQuantity(short quantity) {
		this.quantity = quantity;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "timeAdded", nullable = false, length = 19)
	public Date getTimeAdded() {
		return this.timeAdded;
	}

	public void setTimeAdded(Date timeAdded) {
		this.timeAdded = timeAdded;
	}

}
