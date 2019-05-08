package com.rentCarSystem.web.servlet.logsServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rentCarSystem.commons.Page;
import com.rentCarSystem.commons.Tools;
import com.rentCarSystem.domain.Customers;
import com.rentCarSystem.domain.Logs;
import com.rentCarSystem.service.LogsManagerImpl;

public class FindLogsServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action1");
		String userName = request.getParameter("userName");
		String actionTime = request.getParameter("actionTime");
		String flag = request.getParameter("flag");
		String id = request.getParameter("id");

		// 创建Logs对象
		Logs logs = new Logs();
		if (id.length() > 0 && id != null) {
			logs.setId(Integer.parseInt(id));
		}
		if (action.length() > 0 && action != null) {
			logs.setAction(action);
		}
		if (userName.length() > 0 && userName != null) {
			logs.setUserName(userName);
		}
		if (actionTime.length() > 0 && actionTime != null) {
			logs.setActionTime(Tools.stringToDate(actionTime, "yyyy-MM-dd"));
		}
		if (flag.length() > 0 && flag != null) {
			logs.setFlag(Integer.parseInt(flag));
		}

		// 获取当前页
		String pageIndex = request.getParameter("pageIndex");
		// 设置当前页默认为1
		int pageIndexTemp = 1;
		if (pageIndex != null && pageIndex.length() > 0) {
			pageIndexTemp = Integer.parseInt(pageIndex);
		}
		Page page = LogsManagerImpl.getInstance().findAllLogs(logs,
				pageIndexTemp);
		request.setAttribute("page", page);
		request.setAttribute("logs", logs);
		request.setAttribute("pageIndex", pageIndexTemp);

		request.getRequestDispatcher("SystemManager/viewAllLogs.jsp").forward(
				request, response);
	}

}
