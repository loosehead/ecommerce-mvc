package com.monyLady.myapp.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.monyLady.myapp.model.Category;
import com.monyLady.myapp.model.Product;
import com.monyLady.myapp.model.Subcategory;
import com.mysql.jdbc.log.Log;

@Repository
public class ProductDAOImpl implements ProductDAO {

	private static Logger logger = Logger.getLogger(ProductDAOImpl.class);

	// Session factory injected by spring context
	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	ServletContext context;

	// This method will be called when a product object is added

	public static String DOSSIER_IMAGE = "";

	@Override
	public void addProduct(Product product) {
		this.sessionFactory.getCurrentSession().save(product);

	}

	// This method return list of product in database
	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getAllProducts() {
		return this.sessionFactory.getCurrentSession()
				.createQuery("from Product").list();
	}

	// This setter will be used by Spring context to inject the sessionFactory
	// instance
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public Subcategory getSubcategorieByName(String categoryName,
			String subcategoryName) {
		Query q = this.sessionFactory.getCurrentSession().createQuery(
				"from Category where CategoryName = '" + categoryName + "'");
		Category cat = (Category) q.list().get(0);
		return (Subcategory) this.sessionFactory
				.getCurrentSession()
				.createQuery(
						"from Subcategory where subcategoryName = '"
								+ subcategoryName + "' and categoryId ="
								+ cat.getCategoryId()).list().get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public Set<Product> getProductBySubcategorie(String categoryName,
			String subcategoryName) {
		Query q = this.sessionFactory.getCurrentSession().createQuery(
				"from Category where CategoryName = '" + categoryName + "'");
		Category cat = (Category) q.list().get(0);
		Subcategory scat = (Subcategory) this.sessionFactory
				.getCurrentSession()
				.createQuery(
						"from Subcategory where subcategoryName = '"
								+ subcategoryName + "' and categoryId ="
								+ cat.getCategoryId()).list().get(0);
		return scat.getProducts();
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public Product getProductById(Long id) {
		// TODO Auto-generated method stub
		Query q = this.sessionFactory.getCurrentSession().createQuery(
				"from Product where productID ='" + id + "'");

		Product product = (Product) q.list().get(0);
		return product;
	}

	@Override
	public void saveImage(File image) {
		// TODO Auto-generated method stub
		String path = context.getRealPath("/WEB-INF/views/images/");
		System.out.println(path);

		InputStream inStream = null;
		OutputStream outStream = null;
		String dossier_input = "D:\\images";
	 
	    	try{
	 
	    	    
	    	    File bfile =new File(path+"\\"+image.getName());
	 
	    	    inStream = new FileInputStream(dossier_input+"//"+image.getName());
	    	    outStream = new FileOutputStream(bfile);
	 
	    	    byte[] buffer = new byte[1024];
	 
	    	    int length;
	    	    //copy the file content in bytes 
	    	    while ((length = inStream.read(buffer)) > 0){
	 
	    	    	outStream.write(buffer, 0, length);
	 
	    	    }
	 
	    	    inStream.close();
	    	    outStream.close();
	 
	    	    
	    	    System.out.println("File is copied successful!");
	 
	    	}catch(IOException e){
	    	    e.printStackTrace();
	    	}

	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Product> listProductRandom() {
		// This method return list of product in database
			return this.sessionFactory.getCurrentSession()
					.createQuery("from Product p order by rand()").setMaxResults(6).list();
		
		
	}

}
