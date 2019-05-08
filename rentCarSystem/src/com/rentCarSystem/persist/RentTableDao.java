package com.rentCarSystem.persist;

import java.util.List;

import com.rentCarSystem.commons.Page;
import com.rentCarSystem.domain.RentTable;
import com.rentCarSystem.domain.User;

public interface RentTableDao {
	public Page findRentTable(int pageIndex);//业务统计中的查询全部出租单信息
	public RentTable findRentTable(Long tableId,String custId,String carId,String userId);//业务统计中的查询单个出租单信息
	
	public void addRentTable(RentTable rentTable, User user);//添加出租单
	public Page findAllRentTable(RentTable rentTable, int pageIndex);//出租单管理中的查询所有出租单
	public RentTable findRantTableById(Long tableId);//根据出租单号查单个出租单
	public void updateRentTbale(RentTable rentTable);//更新出租单
	public void deleteRentTable(Long tabelId);//删除出租单
}
