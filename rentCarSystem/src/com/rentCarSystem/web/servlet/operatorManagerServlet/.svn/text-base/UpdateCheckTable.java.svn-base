package com.rentCarSystem.web.servlet.operatorManagerServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.rentCarSystem.commons.Constants;
import com.rentCarSystem.domain.CheckTable;
import com.rentCarSystem.service.CheckTableManagerImpl;

public class UpdateCheckTable extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Log log = LogFactory.getLog(UpdateCheckTable.class);
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String checkId=request.getParameter("checkId1");
		String problem=request.getParameter("problem");
		String field=request.getParameter("field");
		String paying=request.getParameter("paying");
		CheckTable checkTable=new CheckTable();
		checkTable.setCheckId(Long.parseLong(checkId));
		if(problem!=null && problem.length()>0){
			checkTable.setProblem(problem);
		}
		if(field!=null && field.length()>0){
			checkTable.setFiled(field);
		}
		if(paying!=null && paying.length()>0){
			checkTable.setPaying(Double.parseDouble(paying));
		}
		try{
			CheckTableManagerImpl.getInstance().updateCheckTable(checkTable);
			request.setAttribute(Constants.MESSAGE_KEY, "更新成功");
			request.getRequestDispatcher("findAllCheckTable.do").forward(request, response);
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
