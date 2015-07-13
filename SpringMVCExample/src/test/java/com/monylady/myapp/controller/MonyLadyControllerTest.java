package com.monylady.myapp.controller;

import static org.mockito.Matchers.anyObject;
import static org.mockito.Matchers.anyString;
import static org.mockito.Mockito.doThrow;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.apache.log4j.Logger;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import com.monyLady.myapp.ligth.CategoryLigth;
import com.monyLady.myapp.metiers.ProductManager;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/spring-context-test.xml", "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
public class MonyLadyControllerTest {

	final Logger logger = Logger.getLogger(MonyLadyControllerTest.class);

	private MockMvc mockMvc;

	@Autowired
	WebApplicationContext context;

	@Autowired
	private ProductManager productManagerMock;

	final String CATEGORYNAME = "cosmetique";
	final String SUBCATEGORYNAME = "homme";

	@Before
	public void setUp() throws Exception {

		this.mockMvc = MockMvcBuilders.webAppContextSetup(this.context).build();

		CategoryLigth categoryLigth = new CategoryLigth();
		categoryLigth.setCategoryName(CATEGORYNAME);
		categoryLigth.setSubcategoryName(SUBCATEGORYNAME);

	}

	@Test
	public void testGetallProductBySubcategoryName() {
		CategoryLigth categoryLigth = new CategoryLigth();
		categoryLigth.setCategoryName(CATEGORYNAME);
		categoryLigth.setSubcategoryName(SUBCATEGORYNAME);

		try {
			MockHttpServletRequestBuilder requestMocked = get(
					"/allProductBySubcategoryName").param(CATEGORYNAME, "cosmetique").param(SUBCATEGORYNAME, "homme");
			mockMvc.perform(requestMocked).andExpect(status().isOk());

			if (!requestMocked.equals(""))
				logger.info("response not null");
			// 

		} catch (Exception e) {
			Assert.fail(e.getMessage());
		}

	}



}
