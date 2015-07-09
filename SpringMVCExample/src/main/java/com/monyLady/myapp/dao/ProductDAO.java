package com.monyLady.myapp.dao;

import java.util.List;
import java.util.Set;

import com.monyLady.myapp.model.Product;
import com.monyLady.myapp.model.Subcategory;

public interface ProductDAO {

	public void addProduct(Product product);

	public List<Product> getAllProducts();

	public Subcategory getSubcategorieByName(String categoryName,
			String subcategoryName);
	public Set<Product> getProductBySubcategorie(String categoryName,
			String subcategoryName);
	
	public Product getProductById(Long id);

}
