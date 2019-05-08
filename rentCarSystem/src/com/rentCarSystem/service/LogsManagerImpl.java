package com.rentCarSystem.service;

import com.rentCarSystem.commons.Page;
import com.rentCarSystem.domain.Logs;
import com.rentCarSystem.persist.LogsDaoImpl;

public class LogsManagerImpl implements LogsManager {
	//单例
	public static LogsManager lm=new LogsManagerImpl();
	private LogsManagerImpl(){
		
	}
	public static LogsManager getInstance(){
		return lm;
	}

	public Page findAllLogs(Logs logs, int pageIndex) {
		return LogsDaoImpl.getInstance().findAllLogs(logs, pageIndex);
	}
	public void deleteLogs(int id) {
		LogsDaoImpl.getInstance().deleteLogs(id);
	}

}
