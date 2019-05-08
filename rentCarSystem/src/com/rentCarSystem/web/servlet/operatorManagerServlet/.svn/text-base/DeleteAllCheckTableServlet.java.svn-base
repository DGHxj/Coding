package com.rentCarSystem.web.servlet.operatorManagerServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.rentCarSystem.commons.Constants;
import com.rentCarSystem.service.CheckTableManagerImpl;
import com.rentCarSystem.web.servlet.customersServlet.DeleteAllCustomersServlet;

public class DeleteAllCheckTableServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Log log = LogFactory.getLog(DeleteAllCustomersServlet.class);
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		String checkId[] = request.getParameterValues("cbId");
		Long id = null;
		if (checkId.length > 0) {
			for (int i = 0; i < checkId.length; i++) {
				id = Long.parseLong(checkId[i]);
				try {
					CheckTableManagerImpl.getInstance().deleteCheckTable(id);
				} catch (Exception e) {
					if (e.toString().indexOf("SystemError") != -1) {
						e.printStackTrace();
						log.fatal(e);
						request.setAttribute(Constants.MESSAGE_KEY, e
								.getMessage());
						request.getRequestDispatcher("systemError.jsp")
								.forward(request, response);
					} else {
						e.printStackTrace();
						log.error(e);
						request.setAttribute(Constants.MESSAGE_KEY, e
								.getMessage());
						request.getRequestDispatcher("failure.jsp").forward(
								request, response);
					}
				}
			}
		}
		request.setAttribute(Constants.MESSAGE_KEY, "删除成功");
		request.getRequestDispatcher("findAllCheckTable.do").forward(request, response);
	}
}
