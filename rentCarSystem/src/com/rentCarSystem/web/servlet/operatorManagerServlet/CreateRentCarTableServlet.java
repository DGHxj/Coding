package com.rentCarSystem.web.servlet.operatorManagerServlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.rentCarSystem.commons.Constants;
import com.rentCarSystem.domain.RentTable;
import com.rentCarSystem.domain.User;
import com.rentCarSystem.service.RentTableManagerImpl;

public class CreateRentCarTableServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Log log=LogFactory.getLog(CreateRentCarTableServlet.class);
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tableId = request.getParameter("tableId");
		String imprest = request.getParameter("imprest");
		String shoudPayPrice = request.getParameter("shoudPayPrice");
		String price = request.getParameter("price");
		String beginDate = request.getParameter("beginDate");
		String shouldReturnDate = request.getParameter("shouldReturnDate");
		String returnDate = request.getParameter("returnDate");
		String rentFlag = request.getParameter("rentFlag");
		String custId = request.getParameter("custId");
		String carId = request.getParameter("carId");
		String userId = request.getParameter("userId");
		RentTable rentTable = creatRentTable(tableId, imprest, shoudPayPrice,
				price, beginDate, shouldReturnDate, rentFlag, custId, carId,
				userId);
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute(Constants.SESSION_KEY);
		try{
			RentTableManagerImpl.getInstance().addRentTable(rentTable,user);
			response.sendRedirect("success.jsp");
		} catch (Exception e) {
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
	//创建RentTable对象
	public RentTable creatRentTable(String tableId, String imprest,
			String shoudPayPrice, String price, String beginDate,
			String shouldReturnDate, String rentFlag, String custId,
			String carId, String userId) {
		RentTable rentTable = new RentTable();
		rentTable.setTableId(Long.parseLong(tableId));
		rentTable.setImprest(Double.parseDouble(imprest));
		rentTable.setShouldPayPrice(Double.parseDouble(shoudPayPrice));
		rentTable.setPrice(Double.parseDouble(price));
		SimpleDateFormat bt = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat st = new SimpleDateFormat("yyyy-MM-dd");
		Date bd = null;
		Date sd = null;
		try {
			bd = bt.parse(beginDate);
			sd = bt.parse(shouldReturnDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		rentTable.setBeginDate(bd);
		rentTable.setShouldReturnDate(sd);
		rentTable.setRentFlag(Integer.parseInt(rentFlag));
		rentTable.setCustId(custId);
		rentTable.setCarId(carId);
		rentTable.setUserId(userId);
		return rentTable;
	}
}
