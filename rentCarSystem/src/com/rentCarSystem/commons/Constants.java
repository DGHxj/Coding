package com.rentCarSystem.commons;

public abstract class Constants {
	public static final String DB_DRIVER="com.mysql.jdbc.Driver";
	public static final String DB_URL="jdbc:mysql://localhost:3306/db_car_rent?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull";
	public static final String DB_USER_NAME="root";
	public static final String DB_USER_PWD="";
	public static final String SESSION_KEY="user";
	public static final String MESSAGE_KEY="msg";
	public final static String VALIDATE_CODE_KEY = "code";
	public final static int PAGE_NUMBER=5;
	public final static String LOG_ACTION_RENTCARTABLE = "生成出租单";
	public final static String LOG_ACTION_CHECKTABLE = "生成检查单";
	public final static int LOG_ACTION_RENDCARTABLE_STATE = 1;
	public final static int LOG_ACTION_CHECKTABLE_STATE = 2;
}
