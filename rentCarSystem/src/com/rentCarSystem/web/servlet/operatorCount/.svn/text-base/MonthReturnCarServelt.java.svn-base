package com.rentCarSystem.web.servlet.operatorCount;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rentCarSystem.commons.Page;
import com.rentCarSystem.domain.RentTable;
import com.rentCarSystem.service.RentTableManager;
import com.rentCarSystem.service.RentTableManagerImpl;

public class MonthReturnCarServelt extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pageIndex=request.getParameter("pageIndex");
		int pageIndexTemp = 1;
		if(pageIndex != null && pageIndex.length() >0  ){
			pageIndexTemp = Integer.parseInt(pageIndex);
		}
		Page page=RentTableManagerImpl.getInstance().findRentTable(pageIndexTemp);
		if(page!=null){
			request.setAttribute("page", page);
			request.setAttribute("pageIndex", pageIndexTemp);
			request.getRequestDispatcher("operatorCount/viewMonthReturnCarResult.jsp").forward(request, response);
		}else{
			request.setAttribute("rentTable", "没有出租单信息");
			request.getRequestDispatcher("operatorCount/viewMonthReturnCarResult.jsp").forward(request, response);
		}
		
	}

}
