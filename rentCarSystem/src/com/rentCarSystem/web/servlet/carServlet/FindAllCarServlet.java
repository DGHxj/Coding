package com.rentCarSystem.web.servlet.carServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.rentCarSystem.commons.Constants;
import com.rentCarSystem.commons.Page;
import com.rentCarSystem.domain.Car;
import com.rentCarSystem.service.CarManagerImpl;

public class FindAllCarServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Log log=LogFactory.getLog(AddCarServlet.class);
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获得查询汽车信息
		String carNumber=request.getParameter("carNumber");//汽车车号
		String carType=request.getParameter("carType");//汽车型号
		String color=request.getParameter("color");//汽车颜色
		String price=request.getParameter("price");//汽车价格
		String rentPrice=request.getParameter("rentPrice");//汽车租金
		String deposit=request.getParameter("deposit");//汽车押金
		String isRenting=request.getParameter("isRenting");//租用情况
		String pageIndex = request.getParameter("pageIndex");
		//得到当前页
		int pageIndexTemp = 1;
		if(pageIndex != null && pageIndex.length() >0  ){
			pageIndexTemp = Integer.parseInt(pageIndex);
		}
		//将查询汽车信息封装到汽车类中
		Car car=this.createCar(carNumber, carType, color, price, rentPrice, deposit, isRenting);
		try{
			//查询得到所有汽车的分页信息
			Page p=CarManagerImpl.getInstance().findAllCar(car, pageIndexTemp);
			//将信息设置到request作用域中
			request.setAttribute("page", p);
			request.setAttribute("car", car);
			request.setAttribute("pageIndex", pageIndexTemp);
			//跳转页面显示分页信息
			request.getRequestDispatcher("carManager/viewAllCar.jsp").forward(request, response);
		}catch (Exception e) {
			if(e.toString().indexOf("SystemError")!=-1){
				log.fatal(e);
				request.setAttribute(Constants.MESSAGE_KEY, e.getMessage());
				request.getRequestDispatcher("systemError.jsp").forward(request, response);
			}else{
				log.error(e);
				request.setAttribute(Constants.MESSAGE_KEY, e.getMessage());
				request.getRequestDispatcher("failure.jsp").forward(request, response);
			}
		}
	}
	/**
	 * 封装汽车信息方法
	 * @param carNumber
	 * @param carType
	 * @param color
	 * @param price
	 * @param rentPrice
	 * @param deposit
	 * @param isRenting
	 * @return
	 */
	private Car createCar(String carNumber,String carType,String color,String price,String rentPrice,String deposit,String isRenting){
		Car car=new Car();
		if(carNumber!=null && carNumber.length()>0){
			car.setCarNumber(carNumber);
		}
		if(carType!=null && carType.length()>0){
			car.setCarType(carType);
		}
		if(color!=null && color.length()>0){
			car.setColor(color);
		}
		if(price!=null && price.length()>0 ){
			car.setPrice(price);
		}
		if(rentPrice!=null && rentPrice.length()>0){
			car.setRentPrice(rentPrice);
		}
		if(deposit!=null && deposit.length()>0){
			car.setDeposit(deposit);
		}
		if(isRenting!=null && isRenting.length()>0){
			car.setIsRenting(isRenting);
		}
		return car;
	}

}
