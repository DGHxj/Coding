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
import com.rentCarSystem.domain.Menu;
import com.rentCarSystem.domain.Role;
import com.rentCarSystem.service.RoleManagerImpl;

public class FindRoleServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Log log = LogFactory.getLog(FindRoleServlet.class);
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String roleid=request.getParameter("roleid");
		try{
			Role role=RoleManagerImpl.getInstance().findRole(Integer.parseInt(roleid));
			List<Menu> list=RoleManagerImpl.getInstance().findAllMenus();
			for(Menu m:role.getMenus()){
				for (Menu mm:list) {
					if(m.getMenuId()==mm.getMenuId()){
						mm.setIsChecked("checked");
					}
				}
			}
			request.setAttribute("role", role);
			request.setAttribute("list",list);
			request.getRequestDispatcher("SystemManager/viewRole.jsp").forward(request, response);
			
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
