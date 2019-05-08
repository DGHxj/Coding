package com.rentCarSystem.service;

import java.sql.SQLException;

import com.rentCarSystem.commons.Constants;
import com.rentCarSystem.commons.JdbcUtil;
import com.rentCarSystem.commons.Page;
import com.rentCarSystem.domain.Car;
import com.rentCarSystem.exception.SystemError;
import com.rentCarSystem.exception.SystemException;
import com.rentCarSystem.exception.UserNotFoundException;
import com.rentCarSystem.persist.CarDaoImpl;

public class CarManagerImpl implements CarManager {
	private static CarManager carManager = new CarManagerImpl();

	private CarManagerImpl() {

	}

	public static CarManager getInstance() {
		return carManager;
	}

	/**
	 * 添加汽车方法
	 * 
	 * @param car
	 */
	public void addCar(Car car) {
		try {
			CarDaoImpl.getInstance().addCar(car);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}

	}

	/**
	 * 分页查询汽车信息方法
	 * 
	 * @param car
	 * @return Page
	 */
	public Page findAllCar(Car car, int pageIndex) {
		Page page = null;
		try {
			page = CarDaoImpl.getInstance().findAllCar(car, pageIndex);
		} catch (SystemException e) {
			throw new SystemException(e.getMessage());
		} catch (SystemError e) {
			throw new SystemError(e.getMessage());
		} catch (Exception e) {
			throw new SystemError(e.getMessage());
		}
		return page;
	}

	/**
	 * 删除汽车信息方法
	 * 
	 * @param carNumber
	 */
	public void deleteCar(String carNumber) {
		try {
			CarDaoImpl.getInstance().deleteCar(carNumber);
		} catch (SystemException e) {
			throw new SystemException(e.getMessage());
		} catch (SystemError e) {
			throw new SystemError(e.getMessage());
		} catch (Exception e) {
			throw new SystemError(e.getMessage());
		}
	}

	/**
	 * 查询单个汽车信息方法
	 * 
	 * @param carNumber
	 */
	public Car findCar(String carNumber) {
		Car car = null;
		try {
			car = CarDaoImpl.getInstance().findCar(carNumber);
		} catch (SystemException e) {
			throw new SystemException(e.getMessage());
		} catch (SystemError e) {
			throw new SystemError(e.getMessage());
		} catch (Exception e) {
			throw new SystemError(e.getMessage());
		}
		return car;
	}

	/**
	 * 更新汽车方法
	 * 
	 * @param car
	 */
	public void updateCar(Car car) {
		try {
			CarDaoImpl.getInstance().updateCar(car);
		} catch (SystemException e) {
			throw new SystemException(e.getMessage());
		} catch (SystemError e) {
			throw new SystemError(e.getMessage());
		} catch (Exception e) {
			throw new SystemError(e.getMessage());
		}
	}

	// 根据出租状态查找汽车号
	public Page findCarByIsrenting(String isrenting) {
		return CarDaoImpl.getInstance().findCarByIsrenting(isrenting);
	}

}
