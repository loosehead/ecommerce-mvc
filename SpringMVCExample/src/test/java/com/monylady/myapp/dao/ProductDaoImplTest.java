package com.monylady.myapp.dao;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.monyLady.myapp.dao.ProductDAO;
import com.monyLady.myapp.model.Product;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={ "classpath:/spring-context-test.xml" })
@WebAppConfiguration
public class ProductDaoImplTest {
	
	@Autowired
	ProductDAO productdao;
	
	@Test
	public void testGetProductById(){
		
		Product pro = productdao.getProductById(1L);
		
		assertNotNull(pro);
		
	}
	
	
}