package com.monyLady.myapp.dao;

import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.monyLady.myapp.model.Category;
import com.monyLady.myapp.model.Product;
import com.monyLady.myapp.model.Subcategory;

@Repository
public class ProductDAOImpl implements ProductDAO {
	
	
	
	//Session factory injected by spring context
	@Autowired
    private SessionFactory sessionFactory;
     
    //This method will be called when a product object is added
    
    @Override
    public void addProduct(Product product) {
        this.sessionFactory.getCurrentSession().save(product);
        
    }
 
    //This method return list of product in database
    @SuppressWarnings("unchecked")
    @Override
    public List<Product> getAllProducts() {
        return this.sessionFactory.getCurrentSession().createQuery("from Product").list();
    }
 
    
    //This setter will be used by Spring context to inject the sessionFactory instance
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @SuppressWarnings("unchecked")
    @Override
    @Transactional
	public Subcategory getSubcategorieByName(String categoryName,
			String subcategoryName) {
		Query q = this.sessionFactory.getCurrentSession().createQuery("from Category where CategoryName = '"+categoryName+"'");
		Category cat = (Category) q.list().get(0);
		 return (Subcategory) this.sessionFactory.getCurrentSession().createQuery("from Subcategory where subcategoryName = '"+subcategoryName+"' and categoryId ="+cat.getCategoryId()).list().get(0);
	}

    @SuppressWarnings("unchecked")
    @Override
    @Transactional
	public Set<Product> getProductBySubcategorie(String categoryName,
			String subcategoryName) {
    	Query q = this.sessionFactory.getCurrentSession().createQuery("from Category where CategoryName = '"+categoryName+"'");
		Category cat = (Category) q.list().get(0);
		Subcategory scat = (Subcategory) this.sessionFactory.getCurrentSession().createQuery("from Subcategory where subcategoryName = '"+subcategoryName+"' and categoryId ="+cat.getCategoryId()).list().get(0);
		 return scat.getProducts();
	}

    @SuppressWarnings("unchecked")
    @Override
    @Transactional
	public Product getProductById(Long id) {
		// TODO Auto-generated method stub
		Query q = this.sessionFactory.getCurrentSession().createQuery("from Product where productID ='" +id+"'");
		
		Product product = (Product)q.list().get(0);
		return  product;
	}

}
