package com.rentCarSystem.web.servlet.operatorManagerServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.rentCarSystem.commons.Constants;
import com.rentCarSystem.commons.Tools;
import com.rentCarSystem.domain.RentTable;
import com.rentCarSystem.service.RentTableManagerImpl;

public class UpdeateRentTable extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Log log = LogFactory.getLog(UpdeateRentTable.class);
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tableId = request.getParameter("tableId");
		String beginDate = request.getParameter("beginDate");
		String shouldReturnDate = request.getParameter("shouldReturnDate");
		String imprest = request.getParameter("imprest");
		String shouldPayPrice = request.getParameter("shouldPayPrice");
		String price = request.getParameter("price");
		String rentFlag = request.getParameter("rentFlag");
		RentTable rentTable=this.creatRentTable(tableId, beginDate, shouldReturnDate, rentFlag,
				imprest, price, shouldPayPrice);
		try{
			RentTableManagerImpl.getInstance().updateRentTbale(rentTable);
			response.sendRedirect("success.jsp");
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

	public RentTable creatRentTable(String tableId, String beginDate,
			String shouldReturnDate, String rentFlag, String imprest,
			String price, String shouldPayPrice) {
		RentTable rentTable = new RentTable();
		if (tableId != null && tableId.length() > 0) {
			rentTable.setTableId(Long.parseLong(tableId));
		}
		if (beginDate != null && beginDate.length() > 0) {
			rentTable.setBeginDate(Tools.stringToDate(beginDate, "yyyy-MM-dd"));
		}
		if (shouldReturnDate != null && shouldReturnDate.length() > 0) {
			rentTable.setShouldReturnDate(Tools.stringToDate(shouldReturnDate,
					"yyyy-MM-dd"));
		}
		if (imprest != null && imprest.length() > 0) {
			rentTable.setImprest(Double.parseDouble(imprest));
		}

		if (rentFlag != null && rentFlag.length() > 0) {
			rentTable.setRentFlag(Integer.parseInt(rentFlag));
		}
		if (shouldPayPrice != null && shouldPayPrice.length() > 0) {
			rentTable.setShouldPayPrice(Double.parseDouble(shouldPayPrice));
		}
		if (price != null && price.length() > 0) {
			rentTable.setPrice(Double.parseDouble(price));
		}
		return rentTable;
	}

}
