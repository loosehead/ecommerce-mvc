package com.monyLady.myapp.metiers;

import java.io.File;
import java.util.List;
import java.util.Set;

import com.monyLady.myapp.ligth.ProductLigth;
import com.monyLady.myapp.model.Product;

public interface ProductManager {
	
	//This method is called can you add an product
	public void addProduct(Product product);
	//This method return list product in database
	public List<Product> getAllProducts();
	public Product toProduct(ProductLigth product);
	public ProductLigth toProductLight(Product p);
	public Set<Product> getProductBySubcategorie(String categoryName,
			String subcategoryName);
	public void saveImage(File image);

}
