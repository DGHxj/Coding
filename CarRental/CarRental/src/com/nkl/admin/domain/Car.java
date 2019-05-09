package com.nkl.admin.domain;

import java.io.File;

import com.nkl.common.domain.BaseDomain;

public class Car extends BaseDomain {
	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 935450826788987376L;
	private int row_num; // 
	private int car_id; // 
	private String car_name; // 
	private String car_model; // 
	private String car_desc; // 
	private String car_color; // 
	private String car_oil; // 
	private File car_img;
	private String car_imgFileName;
	private String car_imgContentType;
	private String car_dis; 
	
	
	
	public String getCar_imgFileName() {
		return car_imgFileName;
	}
	public void setCar_imgFileName(String car_imgFileName) {
		this.car_imgFileName = car_imgFileName;
	}
	public String getCar_imgContentType() {
		return car_imgContentType;
	}
	public void setCar_imgContentType(String car_imgContentType) {
		this.car_imgContentType = car_imgContentType;
	}
	public File getCar_img() {
		return car_img;
	}
	public void setCar_img(File car_img) {
		this.car_img = car_img;
	}

	public String getCar_color() {
		return car_color;
	}
	public void setCar_color(String car_color) {
		this.car_color = car_color;
	}
	public String getCar_oil() {
		return car_oil;
	}
	public void setCar_oil(String car_oil) {
		this.car_oil = car_oil;
	}
	public String getCar_dis() {
		return car_dis;
	}
	public void setCar_dis(String car_dis) {
		this.car_dis = car_dis;
	}
	private String ids; //  
	private String random;
	
	public int getRow_num() {
		return row_num;
	}
	public int getCar_id() {
		return car_id;
	}
	public String getCar_name() {
		return car_name;
	}
	public String getCar_model() {
		return car_model;
	}
	public String getCar_desc() {
		return car_desc;
	}
	public String getIds() {
		return ids;
	}
	public String getRandom() {
		return random;
	}
	public void setRow_num(int row_num) {
		this.row_num = row_num;
	}
	public void setCar_id(int car_id) {
		this.car_id = car_id;
	}
	public void setCar_name(String car_name) {
		this.car_name = car_name;
	}
	public void setCar_model(String car_model) {
		this.car_model = car_model;
	}
	public void setCar_desc(String car_desc) {
		this.car_desc = car_desc;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public void setRandom(String random) {
		this.random = random;
	}

}
