package com.monyLady.myapp.ligth;

import java.io.File;
import java.math.BigDecimal;


public class ProductLigth {

	
	private String  subcategoryName;
	private String categoryName;
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	private String productName;
	private String modelNumber;
	private BigDecimal price;
	private String description;
	private int qtyOnHand;
	private File image; 
	public ProductLigth(String subcategoryName, String productName,
			String modelNumber, BigDecimal price, String description,
			int qtyOnHand, File image) {
		super();
		this.subcategoryName = subcategoryName;
		this.productName = productName;
		this.modelNumber = modelNumber;
		this.price = price;
		this.description = description;
		this.qtyOnHand = qtyOnHand;
		this.image = image;
	}
	public File getImage() {
		return image;
	}
	public void setImage(File image) {
		this.image = image;
	}
	public String getSubcategoryName() {
		return subcategoryName;
	}
	public void setSubcategoryName(String subcategoryName) {
		this.subcategoryName = subcategoryName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getModelNumber() {
		return modelNumber;
	}
	public void setModelNumber(String modelNumber) {
		this.modelNumber = modelNumber;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getQtyOnHand() {
		return qtyOnHand;
	}
	public void setQtyOnHand(int qtyOnHand) {
		this.qtyOnHand = qtyOnHand;
	}
	public ProductLigth() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	
}
