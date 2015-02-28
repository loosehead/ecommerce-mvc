package com.monyLady.myapp.dao;

import java.util.List;

import com.monyLady.myapp.model.Customer;

public interface CustomerDAO {

	public void addCustomer(Customer customer);

	public List<Customer> getAllCustomer();

}
