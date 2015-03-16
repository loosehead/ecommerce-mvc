package com.monyLady.myapp.metiers;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.monyLady.myapp.dao.ProductDAO;
import com.monyLady.myapp.ligth.ProductLigth;
import com.monyLady.myapp.model.Product;

@Service
public class ProductManagerImpl implements ProductManager {
	
	// product dao is inject by Spring
	
	
	private ProductDAO productDAO;
	
	public ProductDAO getProductDAO() {
		return productDAO;
	}

	public void setProductDAO(ProductDAO productDAO) {
		this.productDAO = productDAO;
	}

	
	@Override
	@Transactional
	public void addProduct(Product product){
		
		productDAO.addProduct(product);
		
	}
	
	@Override
	@Transactional
	public List<Product> getAllProducts(){
		return productDAO.getAllProducts();
	
		
	}

	@Override
	public Product toProduct(ProductLigth product) {
		// TODO Auto-generated method stub
		Product p = new Product(); 
		p.setDescription(product.getDescription());
		p.setImagePath(product.getImage().getPath());
		p.setProductName(product.getProductName());
		p.setPrice(product.getPrice());
		p.setModelNumber(product.getModelNumber());
		p.setQtyOnHand(product.getQtyOnHand());
		p.setSubcategory(this.productDAO.getSubcategorieByName(product.getCategoryName(), product.getSubcategoryName()));
		return p;
	}



}
