package com.monyLady.myapp.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.monyLady.myapp.model.Product;

@Repository
public class ProductDAOImpl implements ProductDAO {
	
	
	
	//Session factory injected by spring context
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

}
