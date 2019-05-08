package com.rentCarSystem.service;

import com.rentCarSystem.commons.Page;
import com.rentCarSystem.domain.Car;

public interface CarManager {
	/**
	 * 添加汽车方法
	 * @param car
	 */
	public void addCar(Car car);
	/**
	 * 分页查询汽车信息方法
	 * @param car
	 * @return Page
	 */
	public Page findAllCar(Car car,int pageIndex);
	/**
	 * 删除汽车信息方法
	 * @param carNumber
	 */
	public void deleteCar(String carNumber);
	/**
	 * 查询单个汽车信息方法
	 * @param carNumber
	 */
	public Car findCar(String carNumber);
	/**
	 * 更新汽车方法
	 * @param car
	 */
	public void updateCar(Car car);
	//根据出租状态查找汽车号
	public Page findCarByIsrenting(String isrenting);
}
