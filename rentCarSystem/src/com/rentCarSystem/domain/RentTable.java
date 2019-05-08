package com.rentCarSystem.domain;

import java.io.Serializable;
import java.util.Date;

public class RentTable implements Serializable{
	private Long tableId;
	private Double imprest;
	private Double shouldPayPrice;
	private Double price;
	private Date beginDate;
	private Date shouldReturnDate;
	private Date returnDate;
	private Integer rentFlag;
	private String custId;
	private String carId;
	private String userId;
	private Customers customers;
	private Car car;
	private User user;
	public Long getTableId() {
		return tableId;
	}
	public void setTableId(Long tableId) {
		this.tableId = tableId;
	}
	public Double getImprest() {
		return imprest;
	}
	public void setImprest(Double imprest) {
		this.imprest = imprest;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Date getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}
	public Date getShouldReturnDate() {
		return shouldReturnDate;
	}
	public void setShouldReturnDate(Date shouldReturnDate) {
		this.shouldReturnDate = shouldReturnDate;
	}
	public Date getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}
	public Integer getRentFlag() {
		return rentFlag;
	}
	public void setRentFlag(Integer rentFlag) {
		this.rentFlag = rentFlag;
	}
	public Customers getCustomers() {
		return customers;
	}
	public void setCustomers(Customers customers) {
		this.customers = customers;
	}
	public Car getCar() {
		return car;
	}
	public void setCar(Car car) {
		this.car = car;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getCustId() {
		return custId;
	}
	public void setCustId(String custId) {
		this.custId = custId;
	}
	public String getCarId() {
		return carId;
	}
	public void setCarId(String carId) {
		this.carId = carId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Double getShouldPayPrice() {
		return shouldPayPrice;
	}
	public void setShouldPayPrice(Double shouldPayPrice) {
		this.shouldPayPrice = shouldPayPrice;
	}
	
}
