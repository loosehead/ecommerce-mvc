package com.monyLady.myapp.metiers;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.monyLady.myapp.dao.PersonDAO;
import com.monyLady.myapp.ligth.PersonLight;
import com.monyLady.myapp.model.Person;
import com.monyLady.myapp.model.SecurityQuestion;

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
	public void savePerson(Person person) {
		personDAO.savePerson(person);
		// TODO Auto-generated method stub
		
	}
	
	@Override
	@Transactional
	public Person getPersonsByLogin (String login, String password){
		Person p = personDAO.getPersonsByLogin(login, password);
		return p;
		
	}
	
	
	@Override
	@Transactional
	public void updatePerson(Person person){
		personDAO.updatePerson(person);
	}
	@Override
	public Person toPerson(PersonLight p) {
		// TODO Auto-generated method stub
		
		Person person = new Person();
		
		person.setLogin(p.getLogin());
		person.setPassword(p.getPassword());
		person.setSecurityAnswer(p.getSecurityAnswer());
		person.setSecurityQuestion(personDAO.getQuestionById(p.getQuestion()));
		
		return person;
	}

}
