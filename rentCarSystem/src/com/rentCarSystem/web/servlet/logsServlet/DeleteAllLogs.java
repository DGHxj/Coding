package com.rentCarSystem.web.servlet.logsServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.text.normalizer.IntTrie;

import com.rentCarSystem.commons.Constants;
import com.rentCarSystem.service.LogsManagerImpl;

public class DeleteAllLogs extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String logs[] = request.getParameterValues("logsid");
		for(int i=0;i<logs.length;i++){
			LogsManagerImpl.getInstance().deleteLogs(Integer.parseInt(logs[i]));
		}
		request.setAttribute(Constants.MESSAGE_KEY, "删除成功");
		request.getRequestDispatcher("findLogsServlet.do").forward(request, response);
	}

}
