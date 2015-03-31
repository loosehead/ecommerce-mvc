package com.monyLady.myapp.metiers;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.monyLady.myapp.dao.PersonDAO;
import com.monyLady.myapp.model.Person;

@Service
public class PersonManagerImpl implements PersonManager {

	
	private PersonDAO personDAO;
	public PersonDAO getPersonDAO() {
		return personDAO;
	}
	public void setPersonDAO(PersonDAO personDAO) {
		this.personDAO = personDAO;
	}
	@Override
	@Transactional
	public void addPerson(Person person) {
		personDAO.addPerson(person);
		// TODO Auto-generated method stub
		
	}
	
	@Override
	@Transactional
	public void updatePerson(Person person){
		personDAO.updatePerson(person);
	}

}
