package com.rentCarSystem.web.servlet.userServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.rentCarSystem.commons.Constants;
import com.rentCarSystem.commons.Page;
import com.rentCarSystem.domain.User;
import com.rentCarSystem.service.UserManager;
import com.rentCarSystem.service.UserManagerImpl;

public class FindUserServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Log log = LogFactory.getLog(FindUserServlet.class);
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName=request.getParameter("userName");
		String userPwd=request.getParameter("userPwd");
		String address=request.getParameter("address");
		String position=request.getParameter("position");
		String userLevel=request.getParameter("userLevel");
		String sex=request.getParameter("sex");
		String fullName=request.getParameter("fullName");
		String identity=request.getParameter("identity");
		String phone=request.getParameter("phone");
		String pageIndex = request.getParameter("pageIndex");
		//绑定user
		User user=new User();
		user.setUserName(userName);
		user.setUserPwd(userPwd);
		user.setAddress(address);
		user.setPosition(position);
		user.setUserLevel(Integer.parseInt(userLevel));
		user.setSex(sex);
		user.setFullName(fullName);
		user.setIdentity(identity);
		user.setPhone(phone);
		int pageIndexTemp = 1;
		if(pageIndex != null && pageIndex.length() >0  ){
			pageIndexTemp = Integer.parseInt(pageIndex);
		}
		Page page=null;
		try{
			UserManager findUserManager=new UserManagerImpl();
			page=findUserManager.findUser(user, pageIndexTemp);
		}catch (Exception e) {
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
		if(page!=null){
			request.setAttribute("page", page);
			request.setAttribute("user", user);
			request.setAttribute("pageIndex", pageIndexTemp);
			request.getRequestDispatcher("userManager/viewUser.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}
