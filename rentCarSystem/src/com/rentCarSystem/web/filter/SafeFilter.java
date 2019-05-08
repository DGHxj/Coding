package com.rentCarSystem.web.filter;

import java.io.IOException;
import java.util.Iterator;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rentCarSystem.commons.Constants;
import com.rentCarSystem.domain.Fun;
import com.rentCarSystem.domain.User;

public class SafeFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		String uri = req.getRequestURI();
		User user = (User) session.getAttribute(Constants.SESSION_KEY);
		if (uri.endsWith(".jsp") || uri.endsWith(".do")) {
			if (uri.indexOf("loginUser.do") != -1
					|| uri.indexOf("login.jsp") != -1
					|| uri.indexOf("ValidateCodeServlet.do") != -1) {
				chain.doFilter(request, response);
			} else {
				boolean flag = false;
				Set<Fun> funs = user.getFuns();
				Iterator<Fun> it = funs.iterator();
				while (it.hasNext()) {
					Fun funTemp = it.next();
					if (uri.indexOf(funTemp.getFunURL()) != -1) {
						flag = true;
						break;
					}
				}
				if (flag) {
					chain.doFilter(request, response);
				} else {
					if(!uri.contains("norole.jsp")){
						((HttpServletResponse) response).sendRedirect("norole.jsp");
					}else{
						chain.doFilter(request, response);
					}
				}
			}

		} else {
			chain.doFilter(request, response);
		}

	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
