package com.rentCarSystem.web.servlet.operatorCount;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rentCarSystem.domain.RentTable;
import com.rentCarSystem.service.RentTableManagerImpl;

public class FindMonthReturnCarByInfoServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tableId=request.getParameter("tableId");
		String custId=request.getParameter("custId");
		String carId=request.getParameter("carId");
		String userId=request.getParameter("userId");
		long tableIdTemp=Long.parseLong(tableId);
		RentTable rent=RentTableManagerImpl.getInstance().findRentTable(tableIdTemp, custId, carId, userId);
		if(rent!=null){
			request.setAttribute("rent", rent);
			request.getRequestDispatcher("operatorCount/findMonthReturnCarByInfo.jsp").forward(request, response);
		}else{
			request.setAttribute("rent", "没有数据");
			
		}
	}

}
