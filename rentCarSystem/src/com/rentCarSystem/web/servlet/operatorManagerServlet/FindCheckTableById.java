package com.rentCarSystem.web.servlet.operatorManagerServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.rentCarSystem.commons.Constants;
import com.rentCarSystem.domain.Car;
import com.rentCarSystem.domain.CheckTable;
import com.rentCarSystem.domain.Customers;
import com.rentCarSystem.domain.RentTable;
import com.rentCarSystem.persist.RentTableDaoImpl;
import com.rentCarSystem.service.CarManagerImpl;
import com.rentCarSystem.service.CheckTableManagerImpl;
import com.rentCarSystem.service.CustomersManagerImpl;

public class FindCheckTableById extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Log log = LogFactory.getLog(FindCheckTableById.class);
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String checkId = request.getParameter("checkId");
		try{
		CheckTable checkTable = CheckTableManagerImpl.getInstance()
				.findCheckTable(Long.parseLong(checkId));
		Long rentId=checkTable.getRentId();
		RentTable rentTable=RentTableDaoImpl.getInstance().findRantTableById(rentId);
		Customers customers=CustomersManagerImpl.getInstance().findCustomers(rentTable.getCustId());
		Car car=CarManagerImpl.getInstance().findCar(rentTable.getCarId());
		
		
		request.setAttribute("checkTable", checkTable);
		request.setAttribute("rentTable", rentTable);
		request.setAttribute("customers", customers);
		request.setAttribute("car", car);
		
		request.getRequestDispatcher("operatorManager/viewCheckTable.jsp")
				.forward(request, response);
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

}
