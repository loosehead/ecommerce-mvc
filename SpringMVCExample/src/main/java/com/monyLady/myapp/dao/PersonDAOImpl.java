package com.monyLady.myapp.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.monyLady.myapp.model.Person;
import com.monyLady.myapp.model.SecurityQuestion;


@Repository
public class PersonDAOImpl implements PersonDAO {
	
	
	private static Logger logger = Logger.getLogger(PersonDAOImpl.class);

	//Session factory injected by spring context
    private SessionFactory sessionFactory;
     
   
  
   
    @SuppressWarnings("unchecked")
    @Override
    @Transactional
	public List<Person> getAllPerson() {
		// TODO Auto-generated method stub
		return this.sessionFactory.getCurrentSession().createQuery("from Person").list();
	}
    
    @Override
    @Transactional
    public void updatePerson(Person person){
    	
    	Session session = this.sessionFactory.getCurrentSession();
        session.update(person);
        logger.info("Person updated successfully, Person Details="+person);
    }
    
    //This setter will be used by Spring context to inject the sessionFactory instance
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

	

	
	
	@Override
	@Transactional
	public Person getPersonsByLogin(String login, String pass) {
		
		//Requête de récupération du person correspondant au login et au passowrd donnée
		
		Query q = this.sessionFactory.getCurrentSession().createQuery("from Person p where p.login= :login and p.password=:pass")
				.setString("login", login).setString("pass", pass);
		
		//Récupération et renvoi du résultat unique
				Person p =(Person)q.uniqueResult();
				return p;
	}

	@Override
	@Transactional
	public Person savePerson(Person p) {
		this.sessionFactory.getCurrentSession().save(p);
		return p;
		
	}

	@Override
	@Transactional
	public SecurityQuestion getQuestionById(Integer id) {
		// TODO Auto-generated method stub
		Query q = this.sessionFactory.getCurrentSession().createQuery("from SecurityQuestion  where securityQuesID= '"+id+"'");
				
		SecurityQuestion qs=(SecurityQuestion) q.uniqueResult();
		
		return qs;
		
	}

	

  


}
