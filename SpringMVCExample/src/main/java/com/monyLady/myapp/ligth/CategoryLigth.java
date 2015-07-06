package com.monyLady.myapp.ligth;

public class CategoryLigth {
	private String categoryName;
	private String subcategoryName;
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getSubcategoryName() {
		return subcategoryName;
	}
	public void setSubcategoryName(String subcategoryName) {
		this.subcategoryName = subcategoryName;
	}
	public CategoryLigth(String categoryName, String subcategoryName) {
		super();
		this.categoryName = categoryName;
		this.subcategoryName = subcategoryName;
	}
	public CategoryLigth() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
