package com.rentCarSystem.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rentCarSystem.commons.Constants;
import com.rentCarSystem.domain.Role;
import com.rentCarSystem.domain.User;
import com.rentCarSystem.exception.UserNotFoundException;
import com.rentCarSystem.service.LoginUserManager;
import com.rentCarSystem.service.LoginUserManagerImpl;
import com.rentCarSystem.service.RoleManager;
import com.rentCarSystem.service.RoleManagerImpl;

public class LoginUserServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String userPwd = request.getParameter("userPwd");
		HttpSession session =request.getSession();
		String code=(String) session.getAttribute(Constants.VALIDATE_CODE_KEY);
		String inputCode=request.getParameter("validateCode");
		try{
			if(code.equalsIgnoreCase(inputCode)){
				if(userName != null && userName.length()>0 && userPwd != null && userPwd.length() >0 ){
					LoginUserManager um = new LoginUserManagerImpl();
					User userTemp = this.createUser(userName, userPwd);
					User user = um.loginUser(userTemp);
					session = request.getSession();
					session.setAttribute(Constants.SESSION_KEY, user);
					response.sendRedirect("main.jsp");
				}else{
					request.setAttribute(Constants.MESSAGE_KEY, "用户名或密码不能为空");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}
			}else{
				request.setAttribute(Constants.MESSAGE_KEY, "验证码不正确");
			
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}catch(UserNotFoundException e){
			request.setAttribute(Constants.MESSAGE_KEY, e.getMessage());
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}catch(Exception e){
			response.sendRedirect("error.jsp");
		}
	}
	private User createUser(String userName,String userPwd){
		    User u = new User();
			u.setUserName(userName);
			u.setUserPwd(userPwd);
		     return u;
	}
	}
	

