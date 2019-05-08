package com.rentCarSystem.domain;

import java.io.Serializable;
import java.util.Date;

public class CheckTable implements Serializable {

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long checkId;//检查单id
	private Date checkDate;//检查日期
	private String filed;//属性
	private String problem;//问题
	private Double paying;//赔费
	private String checkUserId;//用户名
	private long rentId;//出租单id
	private String carNumber;
	
	public Long getCheckId() {
		return checkId;
	}
	public void setCheckId(Long checkId) {
		this.checkId = checkId;
	}
	public Date getCheckDate() {
		return checkDate;
	}
	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}
	public String getFiled() {
		return filed;
	}
	public void setFiled(String filed) {
		this.filed = filed;
	}
	public String getProblem() {
		return problem;
	}
	public void setProblem(String problem) {
		this.problem = problem;
	}
	public Double getPaying() {
		return paying;
	}
	public void setPaying(Double paying) {
		this.paying = paying;
	}
	public String getCheckUserId() {
		return checkUserId;
	}
	public void setCheckUserId(String checkUserId) {
		this.checkUserId = checkUserId;
	}
	public long getRentId() {
		return rentId;
	}
	public void setRentId(long rentId) {
		this.rentId = rentId;
	}
	public String getCarNumber() {
		return carNumber;
	}
	public void setCarNumber(String carNumber) {
		this.carNumber = carNumber;
	}
	
	
}
