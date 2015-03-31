package com.monyLady.myapp.dao;

import java.util.List;

import com.monyLady.myapp.model.Person;

public interface PersonDAO {
	
	public void addPerson(Person person);
	public void updatePerson(Person person);

	public List<Person> getAllPerson();

	public String present(String login, String password);

}
