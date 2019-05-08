package com.rentCarSystem.web.servlet.customersServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.rentCarSystem.commons.Constants;
import com.rentCarSystem.commons.Page;
import com.rentCarSystem.domain.Customers;
import com.rentCarSystem.service.CustomersManagerImpl;

public class FindAllCustomersServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Log log = LogFactory.getLog(FindAllCustomersServlet.class);
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 获取表单输入内容
		String identity = request.getParameter("identity");
		String custName = request.getParameter("custName");
		String sex = request.getParameter("sex");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String career = request.getParameter("career");
		//获取当前页
		String pageIndex=request.getParameter("pageIndex");
		// 创建customers对象
		Customers customers=this.creatCustomers(identity, custName, sex, address, phone, career);
		try{
			//设置当前页默认为1
			int pageIndexTemp = 1;
			if(pageIndex != null && pageIndex.length() >0  ){
				pageIndexTemp = Integer.parseInt(pageIndex);
			}
			Page page=CustomersManagerImpl.getInstance().findAllCustomers(customers, pageIndexTemp);
			
			request.setAttribute("page", page);
			request.setAttribute("customers", customers);
			request.setAttribute("pageIndex", pageIndexTemp);
			request.getRequestDispatcher("custManager/viewAllCustomers.jsp").forward(request, response);
		}catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				log.fatal(e);
				request.setAttribute(Constants.MESSAGE_KEY, e.getMessage());
				request.getRequestDispatcher("systemError.jsp").forward(
						request, response);
			} else {
				log.error(e);
				request.setAttribute(Constants.MESSAGE_KEY, e.getMessage());
				request.getRequestDispatcher("failure.jsp").forward(request,
						response);
			}
		}
		
	}
	// 创建customers对象方法
	public Customers creatCustomers(String identity,String custName,String sex,String address,String phone,String career){
		Customers customers = new Customers();
		if (identity != null && identity.length() > 0) {
			customers.setAddress(address);
		}
		if (career != null && career.length() > 0) {
			customers.setCareer(career);
		}
		if (custName != null && custName.length() > 0) {
			customers.setCustName(custName);
		}
		if (identity != null && identity.length() > 0) {
			customers.setIdentity(identity);
		}
		if (phone != null && phone.length() > 0) {
			customers.setPhone(phone);
		}
		if (sex != null && sex.length() > 0) {
			customers.setSex(sex);
		}
		return customers;
	}
}
