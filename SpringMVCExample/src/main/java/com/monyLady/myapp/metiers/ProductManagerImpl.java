package com.monyLady.myapp.metiers;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.monyLady.myapp.dao.ProductDAO;
import com.monyLady.myapp.ligth.ProductLigth;
import com.monyLady.myapp.model.Product;

@Service
public class ProductManagerImpl implements ProductManager {
	
	// product dao is inject by Spring
	
	@Autowired
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

	@Override
	public ProductLigth toProductLight(Product product) {
		// TODO Auto-generated method stub
		ProductLigth p = new ProductLigth(); 
		p.setDescription(product.getDescription());
		p.setImage(new File(product.getImagePath()));
		p.setProductName(product.getProductName());
		p.setPrice(product.getPrice());
		p.setModelNumber(product.getModelNumber());
		p.setQtyOnHand(product.getQtyOnHand());
		p.setSubcategoryName(product.getSubcategory().getSubcategoryName());
		p.setCategoryName(product.getSubcategory().getCategory().getCategoryName());
		p.setImageName(product.getImagePath());
		return p;
	}

	@Override
	public Set<Product> getProductBySubcategorie(String categoryName,
			String subcategoryName) {
		// TODO Auto-generated method stub
		return this.productDAO.getProductBySubcategorie(categoryName, subcategoryName);
	}

	@Override
	public void saveImage(File image) {
		// TODO Auto-generated method stub
		this.productDAO.saveImage(image);
		
	}

	@Override
	public List<ProductLigth> listProductRandom() {
		// TODO Auto-generated method stub
		ArrayList<ProductLigth> listP = new ArrayList<ProductLigth>();
		for(Product p : productDAO.listProductRandom()){
			listP.add(this.toProductLight(p));
		}
		return listP;
	}



}
