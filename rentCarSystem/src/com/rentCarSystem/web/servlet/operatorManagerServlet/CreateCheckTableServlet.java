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
import com.rentCarSystem.commons.Tools;
import com.rentCarSystem.domain.CheckTable;
import com.rentCarSystem.domain.User;
import com.rentCarSystem.service.CheckTableManagerImpl;
import com.rentCarSystem.web.servlet.carServlet.AddCarServlet;

public class CreateCheckTableServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Log log=LogFactory.getLog(CreateCheckTableServlet.class);
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String checkId = request.getParameter("checkId");
		String checkDate = request.getParameter("checkDate");
		String userId = request.getParameter("userId");
		String field = request.getParameter("field");
		String problem = request.getParameter("problem");
		String paying = request.getParameter("paying");
		String rentid = request.getParameter("rentid");
		String carNumber = request.getParameter("carNumber");
		CheckTable ck = new CheckTable();
		if (checkId != null && checkId.length() > 0) {
			ck.setCheckId(Long.parseLong(checkId));
		}
		if (checkDate != null && checkDate.length() > 0) {
			ck.setCheckDate(Tools.stringToDate(checkDate, "yyyy-MM-dd"));
		}
		if (field != null && field.length() > 0) {
			ck.setFiled(field);
		}
		if (problem != null && problem.length() > 0) {
			ck.setProblem(problem);
		}
		if (paying != null && paying.length() > 0) {
			ck.setPaying(Double.parseDouble(paying));
		}
		if (userId != null && userId.length() > 0) {
			ck.setCheckUserId(userId);
		}
		if (rentid != null && rentid.length() > 0) {
			ck.setRentId(Long.parseLong(rentid));
		}
		if (carNumber != null && carNumber.length() > 0) {
			ck.setCarNumber(carNumber);
		}
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(Constants.SESSION_KEY);
		try {
			CheckTableManagerImpl.getInstance().createCheckTable(ck, user);
			//response.sendRedirect("success.jsp");
			request.getRequestDispatcher("findAllCheckTable.do").forward(request, response);
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

}
