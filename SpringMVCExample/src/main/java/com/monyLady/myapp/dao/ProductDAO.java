package com.monyLady.myapp.dao;

import java.util.List;

import com.monyLady.myapp.model.Product;
import com.monyLady.myapp.model.Subcategory;

public interface ProductDAO {

	public void addProduct(Product product);

	public List<Product> getAllProducts();

	public Subcategory getSubcategorieByName(String categoryName,
			String subcategoryName);

}
