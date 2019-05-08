package com.rentCarSystem.web.servlet.carServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.rentCarSystem.commons.Constants;
import com.rentCarSystem.domain.Car;
import com.rentCarSystem.service.CarManagerImpl;

public class FindCarServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Log log=LogFactory.getLog(AddCarServlet.class);
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String carNumber=request.getParameter("carNumber2");
		try {
			Car car=CarManagerImpl.getInstance().findCar(carNumber);
			request.setAttribute("car", car);
			request.getRequestDispatcher("carManager/viewCar.jsp").forward(request, response);
		}catch (Exception e) {
			if(e.toString().indexOf("SystemError")!=-1){
				log.fatal(e);
				request.setAttribute(Constants.MESSAGE_KEY, e.getMessage());
				request.getRequestDispatcher("systemError.jsp").forward(request, response);
			}else{
				log.error(e);
				request.setAttribute(Constants.MESSAGE_KEY, e.getMessage());
				request.getRequestDispatcher("failure.jsp").forward(request, response);
			}
		}
	}

}
