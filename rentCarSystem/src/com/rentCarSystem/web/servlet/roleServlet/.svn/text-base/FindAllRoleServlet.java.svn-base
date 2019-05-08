package com.rentCarSystem.web.servlet.roleServlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.rentCarSystem.commons.Constants;
import com.rentCarSystem.domain.Role;
import com.rentCarSystem.service.RoleManagerImpl;

public class FindAllRoleServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Log log = LogFactory.getLog(FindAllRoleServlet.class);

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String roleName=request.getParameter("roleName");
		try {
			List<Role> list = RoleManagerImpl.getInstance().findAllRole(roleName);
			request.setAttribute("list", list);
			request.setAttribute("roleName", roleName);
			request.getRequestDispatcher("SystemManager/viewAllRole.jsp")
					.forward(request, response);
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
