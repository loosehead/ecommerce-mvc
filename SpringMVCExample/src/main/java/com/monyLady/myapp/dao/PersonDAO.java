package com.monyLady.myapp.dao;

import java.util.List;

import com.monyLady.myapp.model.Person;
import com.monyLady.myapp.model.SecurityQuestion;

public interface PersonDAO {
	

	public void updatePerson(Person person);

	public List<Person> getAllPerson();

	
	public Person getPersonsByLogin(String login, String pass);
	Person savePerson(Person p);

	public SecurityQuestion getQuestionById(Integer question);

}
