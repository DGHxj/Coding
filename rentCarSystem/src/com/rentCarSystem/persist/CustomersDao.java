package com.rentCarSystem.persist;

import com.rentCarSystem.commons.Page;
import com.rentCarSystem.domain.Customers;

public interface CustomersDao {
	public void addCustomers(Customers customers);
	public Page findAllCustomers(Customers customers,int pageIndex);
	public void deleteCustomers(String identity);
	public Customers findCustomers(String identity);
	public void updateCustomers(Customers customers);
	public void chengeCustomersPwd(String identity, String newPwd);
}	
