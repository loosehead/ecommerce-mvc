package com.monyLady.myapp.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.monyLady.myapp.metiers.PersonManager;
import com.monyLady.myapp.model.Person;
import com.monyLady.myapp.model.Product;
import com.monyLady.myapp.model.Subcategory;


@Controller

public class MonyLadyController {
	


	
	private PersonManager personManager;
	
	private static Logger logger = Logger.getLogger(MonyLadyController.class);
	
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
	
	
  // Méthode pour l'ajout d'un produit	
  @RequestMapping(value ="/addproduct", method= RequestMethod.POST)
  public void addProduct(Product product){
	  logger.info("Ajout d'un produit");
  }
  
  //Méthode pour lister tous les produits dans la table WishList
  @RequestMapping(value ="/allProductWishList", method= RequestMethod.GET)
  public List<Product> allProductWishList(){
	  
	  List <Product> allProductWishList = new ArrayList<Product>();
	  logger.info("Liste de tous les produits dans la table WishList");
	  
	  return allProductWishList;
  }
  
  //Méthode pour lister tous les produit d'un sous catégorie
  @RequestMapping(value="/allProduct", method = RequestMethod.GET)
  public List<Product> allProduct (Subcategory subcategory){
	  
	  logger.info("liste de tous les produits du sous categorie :" + subcategory);;
	  List<Product> allProduct = new  ArrayList<Product>();
	  
	  return allProduct;
  }
   
     
   
   
}
