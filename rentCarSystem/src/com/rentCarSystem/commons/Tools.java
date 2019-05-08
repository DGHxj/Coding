package com.rentCarSystem.commons;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import com.rentCarSystem.domain.User;

public class Tools {
	// 自动生成出租单号
	public static Long CreatTableId(){
		long tableId=System.currentTimeMillis();
		return tableId;
	}
	
	// 添加日志记录
	public static void addLog(User user ,String action,int flag,Connection conne) throws SQLException{
		Connection conn = null;
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = conn.prepareStatement("insert into logs values(null,?,?,now(),?) ");
			ps.setString(1, user.getUserName());
			ps.setString(2, action);
			ps.setInt(3, flag);
			ps.execute();
}
	//String to Date
	public static Date stringToDate(String source,String pattern){
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		if(source!=null){
			if(source.indexOf("CST")>-1){
				SimpleDateFormat sdf1= new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
				try {
					return sdf.parse(sdf.format(sdf1.parse(source)));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		Date date = null;
		try {
			 date = sdf.parse(source);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	//Date to String
	public static String dateToString(Date source,String pattern){
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		return sdf.format(source);
	}
	//java.util.Date To java.sql.Date
	public static java.sql.Date utilDateToSqlDate(java.util.Date date){
		if(date == null)return null;
		return new java.sql.Date(date.getTime());
	}
}
