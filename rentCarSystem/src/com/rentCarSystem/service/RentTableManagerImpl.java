package com.rentCarSystem.service;

import java.util.List;

import com.rentCarSystem.commons.Page;
import com.rentCarSystem.domain.RentTable;
import com.rentCarSystem.domain.User;
import com.rentCarSystem.exception.SystemError;
import com.rentCarSystem.exception.SystemException;
import com.rentCarSystem.persist.RentTableDao;
import com.rentCarSystem.persist.RentTableDaoImpl;

public class RentTableManagerImpl implements RentTableManager {
	// 单例
	public static RentTableManager rentManager = new RentTableManagerImpl();

	private RentTableManagerImpl() {

	}

	public static RentTableManager getInstance() {
		return rentManager;
	}

	//
	public Page findRentTable(int pageIndex) {
		Page page = null;
		try {
			page = RentTableDaoImpl.getInstance().findRentTable(pageIndex);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
		return page;
	}

	public RentTable findRentTable(Long tableId, String custId, String carId,
			String userId) {
		RentTable rt = null;
		try {
			rt = RentTableDaoImpl.getInstance().findRentTable(tableId, custId,
					carId, userId);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
		return rt;
	}

	// 添加出租单
	public void addRentTable(RentTable rentTable, User user) {
		try {
			RentTableDaoImpl.getInstance().addRentTable(rentTable, user);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
	}

	// 出租单管理中的查询所有出租单
	public Page findAllRentTable(RentTable rentTable, int pageIndex) {
		Page page = null;
		try {
			page = RentTableDaoImpl.getInstance().findAllRentTable(rentTable,
					pageIndex);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
		return page;
	}

	// 删除出租单
	public void deleteRentTable(Long tabelId) {
		try {
			RentTableDaoImpl.getInstance().deleteRentTable(tabelId);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
	}

	// 修改出租单
	public void updateRentTbale(RentTable rentTable) {
		try {
			RentTableDaoImpl.getInstance().updateRentTbale(rentTable);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
	}

}
