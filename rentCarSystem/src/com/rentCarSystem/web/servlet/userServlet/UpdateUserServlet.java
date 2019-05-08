package com.rentCarSystem.web.servlet.userServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.rentCarSystem.commons.Constants;
import com.rentCarSystem.domain.User;
import com.rentCarSystem.service.UserManager;
import com.rentCarSystem.service.UserManagerImpl;

public class UpdateUserServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Log log = LogFactory.getLog(UpdateUserServlet.class);
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获得页面传来值
		String userName=request.getParameter("userName");
		String address=request.getParameter("address");
		String position=request.getParameter("position");
		String userLevel=request.getParameter("userLevel");
		String sex=request.getParameter("sex");
		String fullName=request.getParameter("fullName");
		String identity=request.getParameter("identity");
		String phone=request.getParameter("phone");
		//绑定user
		User user=new User();
		user.setUserName(userName);
		user.setAddress(address);
		user.setPosition(position);
		user.setUserLevel(Integer.parseInt(userLevel));
		user.setSex(sex);
		user.setFullName(fullName);
		user.setIdentity(identity);
		user.setPhone(phone);
		UserManager um=new UserManagerImpl();
		boolean flag=false;
		try{
			flag=um.updateUser(user);
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
		
		if(flag){
			request.getRequestDispatcher("FindUser.do").forward(request, response);
			//request.getRequestDispatcher("success.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}
