package com.monyLady.myapp.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.monyLady.myapp.metiers.PersonManager;
import com.monyLady.myapp.model.Person;


@Controller

public class MonyLadyController {

	
	private PersonManager personManager;
	
	@Autowired(required=true)
	@Qualifier(value= "personManager")
	public void setPersonManager(PersonManager pm){
		this.personManager=pm;
	}
	
	
	 //For add and update person both
	@RequestMapping(value= "/person/add", method = RequestMethod.POST)
	public String addPerson(@ModelAttribute("person") Person p){
		
		if (p.getPersonId()==0){
			//new person add it
			this.personManager.addPerson(p);
		}else{
			//existing person, call update
			this.personManager.updatePerson(p);
		}
		
		return "redirect:/views/persons";
	}
	
	@RequestMapping(value="/customer", method=RequestMethod.GET)
	public String listPerson(Model model){
		
		Person p = new Person();
		model.addAttribute("person",p);
		
		List<Person> listPerson = new ArrayList<Person>();
		p.setLogin("login");
		p.setPassword("test");
		p.setPersonId(1);
		listPerson.add(p);
		model.addAttribute("listPerson" , listPerson);
		
		return "customer";
	}
	
	
  
     
   
   
}
