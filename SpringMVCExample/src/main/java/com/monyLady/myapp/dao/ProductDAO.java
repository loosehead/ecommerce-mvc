package com.monyLady.myapp.dao;

import java.util.List;

import com.monyLady.myapp.model.Product;

public interface ProductDAO {

	public void addProduct(Product product);

	public List<Product> getAllProducts();

}
