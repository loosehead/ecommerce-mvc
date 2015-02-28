package com.monyLady.myapp.dao;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.monyLady.myapp.model.Users;

@Repository
public class UserDAOImpl implements UsersDAO {

	private SessionFactory sessionFactory;

	@Override
	public void addUsers(Users users) {
		this.sessionFactory.getCurrentSession().save(users);
	}

	// This setter will be used by Spring context to inject the sessionFactory
	// instance
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	
}
