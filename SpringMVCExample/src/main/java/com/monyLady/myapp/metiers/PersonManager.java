package com.monyLady.myapp.metiers;

import com.monyLady.myapp.ligth.PersonLight;
import com.monyLady.myapp.model.Person;

public interface PersonManager {
	

	void updatePerson(Person person);
	void savePerson(Person person);
	public Person getPersonsByLogin(String login, String password);
	Person toPerson(PersonLight p);

}
