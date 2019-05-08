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

public class AddUserServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Log log=LogFactory.getLog(AddUserServlet.class);
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获得页面传来的值
		String userName=request.getParameter("userName");
		String userPwd=request.getParameter("userPwd");
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
		user.setUserPwd(userPwd);
		user.setAddress(address);
		user.setPosition(position);
		user.setUserLevel(Integer.parseInt(userLevel));
		user.setSex(sex);
		user.setFullName(fullName);
		user.setIdentity(identity);
		user.setPhone(phone);
		UserManager aum=new UserManagerImpl();
		try{
			boolean flag=aum.addUser(user);
			if(flag){
				//request.getRequestDispatcher("success.jsp").forward(request, response);
				request.getRequestDispatcher("FindUser.do").forward(request, response);
			}else{
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		}catch (Exception e) {
			if(e.toString().indexOf("SystemError")!=-1){
				log.fatal(e);
				request.setAttribute(Constants.MESSAGE_KEY, e.getMessage());
				request.getRequestDispatcher("systemError.jsp").forward(request, response);
			}else{
				log.error(e);
				request.setAttribute(Constants.MESSAGE_KEY, e.getMessage());
				request.getRequestDispatcher("failure.jsp").forward(request, response);
			}
			
		}
		
	}

}
