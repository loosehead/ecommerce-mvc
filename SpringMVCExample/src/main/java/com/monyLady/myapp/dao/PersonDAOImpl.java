package com.monyLady.myapp.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.monyLady.myapp.model.Person;


@Repository
public class PersonDAOImpl implements PersonDAO {
	
	
	private static Logger logger = Logger.getLogger(PersonDAOImpl.class);

	//Session factory injected by spring context
    private SessionFactory sessionFactory;
     
    //This method will be called when a product object is added
    @Override
    public void addPerson(Person person) {
        this.sessionFactory.getCurrentSession().save(person);
    }
    
  
   
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
	public String present(String login, String password) {
		// TODO Auto-generated method stub
		return "success";
	}


	

  


}
