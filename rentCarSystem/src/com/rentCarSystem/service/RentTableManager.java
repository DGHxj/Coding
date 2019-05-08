package com.rentCarSystem.service;


import com.rentCarSystem.commons.Page;
import com.rentCarSystem.domain.RentTable;
import com.rentCarSystem.domain.User;

public interface RentTableManager {
	public Page findRentTable(int pageIndex);// 查询全部出租单

	public RentTable findRentTable(Long tableId, String custId, String carId,
			String userId);// 查询单个出租单

	public void addRentTable(RentTable rentTable, User user);// 添加出租单
	public Page findAllRentTable(RentTable rentTable, int pageIndex);//出租单管理中的查询所有出租单
	public void updateRentTbale(RentTable rentTable);//更新出租单
	public void deleteRentTable(Long tabelId);//删除出租单
}
