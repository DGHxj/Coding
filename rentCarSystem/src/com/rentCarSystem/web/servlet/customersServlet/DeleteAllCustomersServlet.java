package com.rentCarSystem.web.servlet.customersServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.rentCarSystem.commons.Constants;
import com.rentCarSystem.service.CustomersManagerImpl;

public class DeleteAllCustomersServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Log log = LogFactory.getLog(DeleteAllCustomersServlet.class);
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cust[] = request.getParameterValues("custid");
		for(int i=0; i <cust.length;i++){
			try{
				CustomersManagerImpl.getInstance().deleteCustomers(cust[i]);
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
		request.setAttribute(Constants.MESSAGE_KEY, "删除成功");
		request.getRequestDispatcher("findAllCustomersServlet.do").forward(request, response);
	}

}
