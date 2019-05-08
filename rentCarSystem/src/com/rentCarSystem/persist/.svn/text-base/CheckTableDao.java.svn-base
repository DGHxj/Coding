package com.rentCarSystem.persist;

import com.rentCarSystem.commons.Page;
import com.rentCarSystem.domain.CheckTable;
import com.rentCarSystem.domain.RentTable;
import com.rentCarSystem.domain.User;

public interface CheckTableDao {
	/**
	 * 根据出租单id查出出租单信息
	 * @param rentId
	 * @return
	 */
	public RentTable findRentTable(Long rentId);
	/**
	 * 创建检查单方法
	 * @param checkTable
	 */
	public void createCheckTable(CheckTable checkTable,User user);
	/**
	 * 查询所有检查单方法
	 * @param checkTable
	 * @param pageIndex
	 * @return
	 */
	public Page findAllCheckTable(CheckTable checkTable,int pageIndex);
	/**
	 * 删除检查单
	 * @param checkId
	 */
	public void deleteCheckTable(Long checkId);
	/**
	 * 查找单个检查单
	 * @param checkId
	 * @return
	 */
	public CheckTable findCheckTable(Long checkId);
	/**
	 * 更新出租单
	 * @param checkTable
	 * @return
	 */
	public CheckTable updateCheckTable(CheckTable checkTable);
}
