package com.monyLady.myapp.dao;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

@Repository
public class ItemsOrderedDAOImpl implements ItemsOrderedDAO {
	
	private SessionFactory sessionFactory;
	
    //This setter will be used by Spring context to inject the sessionFactory instance
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


}
