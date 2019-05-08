package com.rentCarSystem.web.servlet.operatorManagerServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.rentCarSystem.commons.Constants;
import com.rentCarSystem.service.RentTableManagerImpl;
import com.rentCarSystem.web.servlet.customersServlet.DeleteAllCustomersServlet;

public class DeleteAllRentTableServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Log log=LogFactory.getLog(DeleteAllRentTableServlet.class);
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Long id = null;
		String table[] = request.getParameterValues("tbId");
		if (table.length > 0) {
			for (int i = 0; i < table.length; i++) {
				id = Long.parseLong(table[i]);
				try {
					RentTableManagerImpl.getInstance().deleteRentTable(id);
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
		response.sendRedirect("success.jsp");
	}

}
