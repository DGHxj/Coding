package com.rentCarSystem.web.servlet.operatorManagerServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rentCarSystem.commons.Constants;
import com.rentCarSystem.commons.Page;
import com.rentCarSystem.commons.Tools;
import com.rentCarSystem.domain.RentTable;
import com.rentCarSystem.persist.RentTableDaoImpl;
import com.rentCarSystem.service.RentTableManagerImpl;

public class FindAllRentCarTable extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tableId = request.getParameter("tableId");
		String beginDate = request.getParameter("beginDate");
		String shouldReturnDate = request.getParameter("shouldReturnDate");
		String returnDate = request.getParameter("returnDate");
		String rentFlag = request.getParameter("rentFlag");
		String custId = request.getParameter("custId");
		String carId = request.getParameter("carId");
		String userId = request.getParameter("userId");
		RentTable rentTable = this.creatRentTable(tableId, beginDate,
				shouldReturnDate, returnDate, rentFlag, custId, carId, userId);
		// 获取当前页
		String pageIndex = request.getParameter("pageIndex");
		// 设置当前页默认为1
		int pageIndexTemp = 1;
		if (pageIndex != null && pageIndex.length() > 0) {
			pageIndexTemp = Integer.parseInt(pageIndex);
		}
		Page page = RentTableManagerImpl.getInstance().findAllRentTable(
				rentTable, pageIndexTemp);
		request.setAttribute("page", page);
		request.setAttribute("rentTable", rentTable);
		request.setAttribute("pageIndex", pageIndexTemp);
		request.getRequestDispatcher("operatorManager/viewAllRentTable.jsp")
				.forward(request, response);
	}

	public RentTable creatRentTable(String tableId, String beginDate,
			String shouldReturnDate, String returnDate, String rentFlag,
			String custId, String carId, String userId) {
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
		if (returnDate != null && returnDate.length() > 0) {
			rentTable.setReturnDate(Tools
					.stringToDate(returnDate, "yyyy-MM-dd"));
		}
		if (rentFlag != null && rentFlag.length() > 0) {
			rentTable.setRentFlag(Integer.parseInt(rentFlag));
		}
		if (custId != null && custId.length() > 0) {
			rentTable.setCustId(custId);
		}
		if (carId != null && carId.length() > 0) {
			rentTable.setCarId(carId);
		}
		if (userId != null && userId.length() > 0) {
			rentTable.setUserId(userId);
		}
		return rentTable;
	}
}
