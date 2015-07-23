package com.monyLady.myapp.dao;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.monyLady.myapp.model.Users;

@Repository
public class UserDAOImpl implements UsersDAO {

	@Autowired
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
	@Transactional
	public Users getUsersByLogin(String login, String pass) {
		
		//Requête de récupération du User correspondant au login et au passowrd donnée
		// Requête de récupération du User correspondant au login et au password donné
		Query q = this.sessionFactory.getCurrentSession().createQuery("from Users u where u.mail= :login and u.password=:pass")
				.setString("login", login).setString("pass", pass);
		//Récupération et renvoi du résultat unique
		if(q.list().isEmpty()){
			return new Users();
		}else{
			return (Users) q.list().get(0);
		}
				
	}

	@Override
	@Transactional
	public Users saveUser(Users user) {
		user.setUserId((Integer) this.sessionFactory.getCurrentSession().save(user));
		return user;		
	}

	
}
