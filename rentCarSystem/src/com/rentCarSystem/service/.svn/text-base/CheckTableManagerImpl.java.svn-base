package com.rentCarSystem.service;

import com.rentCarSystem.commons.Page;
import com.rentCarSystem.domain.CheckTable;
import com.rentCarSystem.domain.RentTable;
import com.rentCarSystem.domain.User;
import com.rentCarSystem.exception.SystemError;
import com.rentCarSystem.exception.SystemException;
import com.rentCarSystem.persist.CheckTableDaoImpl;

public class CheckTableManagerImpl implements CheckTableManager {
	/**
	 * 单例模式
	 */
	private static CheckTableManager checkTableManager = new CheckTableManagerImpl();

	private CheckTableManagerImpl() {

	}

	public static CheckTableManager getInstance() {
		return checkTableManager;
	}

	/**
	 * 根据出租单id查出出租单信息
	 * 
	 * @param rentId
	 * @return
	 */
	public RentTable findRentTable(Long rentId) {
		RentTable rent = null;
		try {
			rent = CheckTableDaoImpl.getInstance().findRentTable(rentId);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
		return rent;
	}

	/**
	 * 创建检查单方法
	 * 
	 * @param checkTable
	 */
	public void createCheckTable(CheckTable checkTable, User user) {
		try {
			CheckTableDaoImpl.getInstance().createCheckTable(checkTable, user);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
	}

	/**
	 * 查询所有检查单
	 */
	public Page findAllCheckTable(CheckTable checkTable, int pageIndex) {
		Page page = null;
		try {
			page = CheckTableDaoImpl.getInstance().findAllCheckTable(
					checkTable, pageIndex);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
		return page;
	}

	public void deleteCheckTable(Long checkId) {
		try {
			CheckTableDaoImpl.getInstance().deleteCheckTable(checkId);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
	}

	/**
	 * 查找单个检查单
	 * 
	 * @param checkId
	 * @return
	 */
	public CheckTable findCheckTable(Long checkId) {
		CheckTable ck = null;
		try {
			ck = CheckTableDaoImpl.getInstance().findCheckTable(checkId);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
		return ck;

	}

	/**
	 * 更新出租单
	 * 
	 * @param checkTable
	 * @return
	 */
	public CheckTable updateCheckTable(CheckTable checkTable) {
		CheckTable ck = null;
		try {
			ck = CheckTableDaoImpl.getInstance().updateCheckTable(checkTable);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
		return ck;
	}

}
