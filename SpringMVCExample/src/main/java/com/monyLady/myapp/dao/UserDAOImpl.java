package com.monyLady.myapp.dao;

import javax.transaction.Transactional;

import org.hibernate.Query;
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

	@Override
	public Users getUsersByLogin(String login, String pass) {
		
		//Requête de récupération du User correspondant au login et au passowrd donnée
		// Requête de récupération du User correspondant au login et au password donné
		Query q = this.sessionFactory.getCurrentSession().createQuery("from Users u where u.login= :login and u.password=:pass")
				.setString("login", login).setString("pass", pass);
		//Récupération et renvoi du résultat unique
				Users u =(Users)q.uniqueResult();
				return u;
	}

	@Override
	@Transactional
	public Users saveUser(Users user) {
		this.sessionFactory.getCurrentSession().save(user);
		return user;
		
	}

	
}
