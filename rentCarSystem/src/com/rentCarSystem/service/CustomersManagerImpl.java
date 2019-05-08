package com.rentCarSystem.service;

import com.rentCarSystem.commons.Page;
import com.rentCarSystem.domain.Customers;
import com.rentCarSystem.exception.SystemError;
import com.rentCarSystem.exception.SystemException;
import com.rentCarSystem.persist.CustomersDao;
import com.rentCarSystem.persist.CustomersDaoImpl;

public class CustomersManagerImpl implements CustomersManager {
	/**
	 * 单例模式
	 */
	private static CustomersManager custManager = new CustomersManagerImpl();

	private CustomersManagerImpl() {

	}

	public static CustomersManager getInstance() {
		return custManager;
	}

	public void addCustomers(Customers customers) {
		try {
			CustomersDaoImpl.getInstance().addCustomers(customers);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
	}

	public void deleteCustomers(String identity) {
		try {
			CustomersDaoImpl.getInstance().deleteCustomers(identity);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
	}

	public Page findAllCustomers(Customers customers, int pageIndex) {
		Page page = null;
		try {
			page = CustomersDaoImpl.getInstance().findAllCustomers(customers,
					pageIndex);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
		return page;
	}

	public Customers findCustomers(String identity) {
		Customers c = null;
		try {
			c = CustomersDaoImpl.getInstance().findCustomers(identity);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
		return c;
	}

	public void updateCustomers(Customers customers) {
		try {
			CustomersDaoImpl.getInstance().updateCustomers(customers);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
	}

	public void chengeCustomersPwd(String identity, String newPwd) {
		try {
			CustomersDaoImpl.getInstance().chengeCustomersPwd(identity, newPwd);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
	}

}
