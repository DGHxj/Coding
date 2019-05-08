package com.rentCarSystem.commons;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class JdbcUtil {
	//获取数据库连�?
	public static Connection getConnection(){
		Connection conn = null;
		try{
			Class.forName(Constants.DB_DRIVER);
			conn = DriverManager.getConnection(Constants.DB_URL,Constants.DB_USER_NAME ,Constants.DB_USER_PWD);
		}catch(Exception e){
			e.printStackTrace();
		}
		return conn;
	}
	//关闭数据库连�?
	public static void  closeConnection(Connection conn){
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//回滚操作
	public static void rollbackConnection(Connection conn){
		try {
			conn.rollback();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//提交事物
	public static void commitConnection(Connection conn){
		try {
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//自动生成出租单号
	public static Long CreatTableId(){
		long tableId=System.currentTimeMillis();
		return tableId;
	}
}
