package com.rentCarSystem.web.servlet.userServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.rentCarSystem.commons.Constants;
import com.rentCarSystem.domain.User;
import com.rentCarSystem.service.UserManager;
import com.rentCarSystem.service.UserManagerImpl;

public class PreChangeUserPwdServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Log log = LogFactory.getLog(PreChangeUserPwdServlet.class);
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String oldPwd=request.getParameter("oldPwdTemp");
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute(Constants.SESSION_KEY);
		String userName=user.getUserName();
		UserManager um=new UserManagerImpl();
		boolean flag=false;
		try{
			flag=um.isTruePwd(userName, oldPwd);
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
			request.setAttribute("pwdTemp", oldPwd);
			request.getRequestDispatcher("userManager/changeUserPwd.jsp").forward(request, response);
		}else{
			request.setAttribute("warning", "密码不正确");
			request.getRequestDispatcher("userManager/changeUserPwd.jsp").forward(request, response);
		}
	}

}
