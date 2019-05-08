package com.rentCarSystem.web.servlet.userServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.rentCarSystem.commons.Constants;
import com.rentCarSystem.service.UserManager;
import com.rentCarSystem.service.UserManagerImpl;

public class DeleteAllUserServelt extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Log log = LogFactory.getLog(DeleteAllUserServelt.class);

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userInfo[] = request.getParameterValues("userInfo");
		UserManager um = new UserManagerImpl();
		boolean flag = false;
		for (int i = 0; i < userInfo.length; i++) {
			try {
				flag = um.deleteUser(userInfo[i]);
			} catch (Exception e) {
				if (e.toString().indexOf("SystemError") != -1) {
					log.fatal(e);
					request.setAttribute(Constants.MESSAGE_KEY, e.getMessage());
					request.getRequestDispatcher("systemError.jsp").forward(
							request, response);
				} else {
					log.error(e);
					request.setAttribute(Constants.MESSAGE_KEY, e.getMessage());
					request.getRequestDispatcher("failure.jsp").forward(
							request, response);
				}

			}
		}
		if (flag) {
			request.getRequestDispatcher("success.jsp").forward(request,
					response);
		} else {
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		}
	}

}
