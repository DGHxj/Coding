package com.rentCarSystem.web.servlet.roleServlet;

import java.io.IOException;
import java.util.ArrayList;
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

public class UpdateRoleServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Log log = LogFactory.getLog(UpdateRoleServlet.class);
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String roleid=request.getParameter("roleId");
		String roleName=request.getParameter("roleName1");
		Role role=new Role();
		role.setRoleId(Integer.parseInt(roleid));
		role.setRoleName(roleName);
		String menuFatherId=null;
		String[] menuSunsIds=null;
		List<Menu> menus=RoleManagerImpl.getInstance().findAllMenus();
		List<String> menusList=new ArrayList<String>();
		for(Menu m:menus){
			menuFatherId=request.getParameter("f"+m.getMenuId());
			menuSunsIds=request.getParameterValues("s"+m.getMenuId());
			if(menuFatherId!=null){
				menusList.add(menuFatherId);
			}
			if(menuSunsIds!=null){
				for (int i = 0; i < menuSunsIds.length; i++) {
					menusList.add(menuSunsIds[i]);
				}
			}
		}
		try{
			RoleManagerImpl.getInstance().updateRole(role, menusList);
			request.getRequestDispatcher("findAllRole.do").forward(request, response);
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
