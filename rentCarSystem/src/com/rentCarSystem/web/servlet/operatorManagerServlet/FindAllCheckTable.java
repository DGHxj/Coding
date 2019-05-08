package com.rentCarSystem.web.servlet.operatorManagerServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.rentCarSystem.commons.Constants;
import com.rentCarSystem.commons.Page;
import com.rentCarSystem.commons.Tools;
import com.rentCarSystem.domain.CheckTable;
import com.rentCarSystem.service.CheckTableManagerImpl;

public class FindAllCheckTable extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Log log = LogFactory.getLog(FindAllCheckTable.class);

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String checkId = request.getParameter("checkId");
		String checkDate = request.getParameter("checkDate");
		String checkUserId = request.getParameter("checkUserId");
		String rentId = request.getParameter("rentId");
		CheckTable checkTable = this.creatCheckTabel(checkId, checkDate,
				checkUserId, rentId);
		// 获取当前页
		String pageIndex = request.getParameter("pageIndex");
		// 设置当前页默认为1
		int pageIndexTemp = 1;
		if (pageIndex != null && pageIndex.length() > 0) {
			pageIndexTemp = Integer.parseInt(pageIndex);
		}
		try {
			Page page = CheckTableManagerImpl.getInstance().findAllCheckTable(
					checkTable, pageIndexTemp);
			request.setAttribute("page", page);
			request.setAttribute("rentTable", checkTable);
			request.setAttribute("pageIndex", pageIndexTemp);
			request.getRequestDispatcher(
					"operatorManager/viewAllCheckTable.jsp").forward(request,
					response);
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

	public CheckTable creatCheckTabel(String checkId, String checkDate,
			String checkUserId, String rentId) {
		CheckTable checkTable = new CheckTable();
		if (checkId != null && checkId.length() > 0) {
			checkTable.setCheckId(Long.parseLong(checkId));
		}
		if (checkDate != null && checkDate.length() > 0) {
			checkTable
					.setCheckDate(Tools.stringToDate(checkDate, "yyyy-MM-dd"));
		}
		if (checkUserId != null && checkUserId.length() > 0) {
			checkTable.setCheckUserId(checkUserId);
		}
		if (rentId != null && rentId.length() > 0) {
			checkTable.setRentId(Long.parseLong(rentId));
		}
		return checkTable;
	}
}
