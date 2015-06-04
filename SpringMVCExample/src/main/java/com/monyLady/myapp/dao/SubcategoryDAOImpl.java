package com.monyLady.myapp.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SubcategoryDAOImpl implements SubcategoryDAO{

	
	@Autowired
	private SessionFactory sessionFactory;
	
	  
    //This setter will be used by Spring context to inject the sessionFactory instance
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
