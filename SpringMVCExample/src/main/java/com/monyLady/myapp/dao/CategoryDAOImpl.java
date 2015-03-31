package com.monyLady.myapp.dao;



import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.monyLady.myapp.model.Category;

@Repository
public class CategoryDAOImpl implements CategoryDAO {
	
	private SessionFactory sessionFactory;
	
		     
	    //This method will be called when a product object is added
	    @Override
	    public void addCategory(Category category) {
	        this.sessionFactory.getCurrentSession().save(category);
	    }
	  
    //This setter will be used by Spring context to inject the sessionFactory instance
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

}
