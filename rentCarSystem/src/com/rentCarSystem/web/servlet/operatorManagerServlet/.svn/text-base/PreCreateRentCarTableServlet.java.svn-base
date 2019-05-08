package com.rentCarSystem.web.servlet.operatorManagerServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.rentCarSystem.commons.Constants;
import com.rentCarSystem.commons.Page;
import com.rentCarSystem.commons.Tools;
import com.rentCarSystem.domain.Customers;
import com.rentCarSystem.domain.User;
import com.rentCarSystem.service.CarManagerImpl;
import com.rentCarSystem.service.CustomersManagerImpl;

public class PreCreateRentCarTableServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Log log = LogFactory.getLog(PreCreateRentCarTableServlet.class);

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String identity = request.getParameter("identity");
		try {
			Customers customers = CustomersManagerImpl.getInstance()
					.findCustomers(identity);
			if (customers == null) {
				request.setAttribute("error", "没有该用户");
				request.getRequestDispatcher("operatorManager/rentCar.jsp")
						.forward(request, response);
			} else {
				// 生成租车单号
				Long tableId = Tools.CreatTableId();
				request.setAttribute("tableId", tableId);
				request.setAttribute("custId", identity);
				HttpSession session = request.getSession();
				User user = (User) session.getAttribute(Constants.SESSION_KEY);
				Page p = CarManagerImpl.getInstance().findCarByIsrenting("0");
				request.setAttribute("carId", p);
				request.setAttribute("userId", user.getUserName());
				request.setAttribute("customers", customers);
				request.getRequestDispatcher(
						"operatorManager/preCreateRenting.jsp").forward(
						request, response);
			}
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				e.printStackTrace();
				log.fatal(e);
				request.setAttribute(Constants.MESSAGE_KEY, e.getMessage());
				request.getRequestDispatcher("systemError.jsp").forward(
						request, response);
			} else {
				e.printStackTrace();
				log.error(e);
				request.setAttribute(Constants.MESSAGE_KEY, e.getMessage());
				request.getRequestDispatcher("failure.jsp").forward(request,
						response);
			}
		}

	}

}
