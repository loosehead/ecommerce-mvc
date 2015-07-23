package com.monyLady.myapp.controller;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;

import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.monyLady.myapp.ligth.CategoryLigth;
import com.monyLady.myapp.ligth.PersonLight;
import com.monyLady.myapp.ligth.ProductLigth;
import com.monyLady.myapp.ligth.UsersLight;
import com.monyLady.myapp.metiers.PersonManager;
import com.monyLady.myapp.metiers.PersonManagerImpl;
import com.monyLady.myapp.metiers.ProductManager;
import com.monyLady.myapp.metiers.UsersManager;
import com.monyLady.myapp.model.Person;
import com.monyLady.myapp.model.Product;
import com.monyLady.myapp.model.Subcategory;
import com.monyLady.myapp.model.Users;

@Controller
public class MonyLadyController {

	@Autowired
	private PersonManager personManager;
	@Autowired
	private ProductManager productManager;
	@Autowired
    ServletContext context;
	
	@Autowired
	private UsersManager usersManager;

	private static Logger logger = Logger.getLogger(MonyLadyController.class);

	// For add and update person both
	@RequestMapping(value = "savePersont", method = RequestMethod.POST)
	public String saveClient(@ModelAttribute("SpringWeb")PersonLight p) {
			this.personManager.savePerson(this.personManager.toPerson(p));

		return "customer";
	}
	
	
	@RequestMapping(value = "/createUser", method = RequestMethod.GET)
	public @ResponseBody  UsersLight createUser(@ModelAttribute("user")UsersLight user) {
		
		return this.usersManager.toUserLight(this.usersManager.saveUser(this.usersManager.toUsers(user)));	
	}

	
	@RequestMapping(value = "/loginUser", method = RequestMethod.GET)
	public @ResponseBody  UsersLight loginUser(@ModelAttribute("user")UsersLight user) {
		
		return this.usersManager.toUserLight(this.usersManager.getUserByLogin(user.getMail(), user.getPassword()));	
	}
	
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String listPerson(Model model) {

		Person p = new Person();
		model.addAttribute("person", p);

		List<Person> listPerson = new ArrayList<Person>();
		p.setLogin("login");
		p.setPassword("test");
		p.setPersonId(1);
		listPerson.add(p);
		model.addAttribute("listPerson", listPerson);

		return "index";
	}
	
	@RequestMapping(value = "/customer", method = RequestMethod.GET)
	public String listProducts(Model model) {

		Person p = new Person();
		model.addAttribute("person", p);

		List<Person> listPerson = new ArrayList<Person>();
		p.setLogin("login");
		p.setPassword("test");
		p.setPersonId(1);
		listPerson.add(p);
		model.addAttribute("listPerson", listPerson);

		return "customer";
	}
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {

//		Person p = new Person();
//		model.addAttribute("person", p);
//
//		List<Person> listPerson = new ArrayList<Person>();
//		p.setLogin("login");
//		p.setPassword("test");
//		p.setPersonId(1);
//		listPerson.add(p);
//		model.addAttribute("listPerson", listPerson);

		return "login";
	}
	
	@RequestMapping(value = "/panier", method = RequestMethod.GET)
	public String panier(Model model) {

		Person p = new Person();
		model.addAttribute("person", p);

		List<Person> listPerson = new ArrayList<Person>();
		p.setLogin("login");
		p.setPassword("test");
		p.setPersonId(1);
		listPerson.add(p);
		model.addAttribute("listPerson", listPerson);

		return "panier";
	}
	
	@RequestMapping(value = "/listProductsCremes", method = RequestMethod.GET)
	public String listProductsCremes(Model model) {

		Person p = new Person();
		model.addAttribute("person", p);

		List<Person> listPerson = new ArrayList<Person>();
		p.setLogin("login");
		p.setPassword("test");
		p.setPersonId(1);
		listPerson.add(p);
		model.addAttribute("listPerson", listPerson);

		return "listProductsCremes";
	}
	
	
	
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String redirect(Model model) {
		
		/*List<Product> products= this.productManager.getAllProducts();
		List<ProductLigth> productsLights = new ArrayList<ProductLigth>();
		for (Product p : products){
			productsLights.add(productManager.toProductLight(p));
		}
		String path =""; 
		try {
			System.out.println(context.getResource("/WEB-INF/js/demo.json").getPath());
			path = context.getResource("/WEB-INF/js/demo.json").getPath(); 
		} catch (MalformedURLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			mapper.writeValue(new File(path), productsLights);
			System.out.println(mapper.writeValueAsString(productsLights));
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		return "admin";
	}
	// M�thode pour l'ajout d'un produit
	@RequestMapping(value = "SuccessUserImage", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("SpringWeb")ProductLigth product) {
		
		this.productManager.saveImage(product.getImage());
		this.productManager.addProduct(this.productManager.toProduct(product));
		
		//productManager.getProductBySubcategorie(categoryName, subcategoryName);
		
		return "customer"; 
	}
	
	
	
	// M�thode pour lister tous les produit d'un sous cat�gorie
	@RequestMapping(value = "/allProductBySubcategoryName", method = RequestMethod.GET)
	public @ResponseBody List<ProductLigth> getallProductBySubcategoryName(@ModelAttribute("categoryName")String  categoryName, @ModelAttribute("subcategoryName")String  subcategoryName) {

		logger.info("liste de tous les produits du sous categorie :"
				+ subcategoryName);
		;
		
		if("".equals(categoryName) || "".equals(subcategoryName) ){
			return null;
		}
		ArrayList<ProductLigth> listP =new ArrayList<ProductLigth>(); 
		Set<Product> setP= productManager.getProductBySubcategorie(categoryName,subcategoryName);
		for (Product product :setP ){
			listP.add(this.productManager.toProductLight(product));
		}
		return listP;
	}

	


}
