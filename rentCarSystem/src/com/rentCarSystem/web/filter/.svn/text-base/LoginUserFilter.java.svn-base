package com.rentCarSystem.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.rentCarSystem.commons.Constants;
import com.rentCarSystem.domain.User;

public class LoginUserFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		String URI = req.getRequestURI();
		User user = (User) session.getAttribute(Constants.SESSION_KEY);
		if (!URI.endsWith(".jsp") || URI.endsWith(".do")) {
			chain.doFilter(request, response);
		} else {
			if (URI.indexOf("login.jsp") != -1 || URI.indexOf("loginUser.do") != -1
					|| URI.indexOf("ValidateCodeServlet.do") != -1) {
				chain.doFilter(request, response);
			} else {
				if (user != null && user.getUserName().length() > 0) {
					chain.doFilter(request, response);
				} else {
					req.setAttribute(Constants.MESSAGE_KEY, "请登陆");
					req.getRequestDispatcher("login.jsp").forward(request,
							response);
				}
			}
			
		}

	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
