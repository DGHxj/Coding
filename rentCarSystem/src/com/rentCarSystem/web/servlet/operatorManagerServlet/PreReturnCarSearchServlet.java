package com.rentCarSystem.web.servlet.operatorManagerServlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.rentCarSystem.commons.Constants;
import com.rentCarSystem.commons.Tools;
import com.rentCarSystem.domain.RentTable;
import com.rentCarSystem.service.CheckTableManagerImpl;

public class PreReturnCarSearchServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Log log = LogFactory.getLog(PreReturnCarSearchServlet.class);
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tableId=request.getParameter("tableId");
		try{
			RentTable rent=CheckTableManagerImpl.getInstance().findRentTable(Long.parseLong(tableId));
			request.setAttribute("rent", rent);
			long checkId=new Date().getTime();
			request.setAttribute("checkId",checkId);
			request.setAttribute("checkDate",Tools.dateToString(new Date(), "yyyy-MM-dd"));
			if(rent!=null){
				request.getRequestDispatcher("operatorManager/createCheckTable.jsp").forward(request, response);
			}else{
				request.setAttribute(Constants.MESSAGE_KEY,"出租单不存在,请重新输入");
				request.getRequestDispatcher("operatorManager/returnCar.jsp").forward(request, response);
			}
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
