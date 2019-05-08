package com.rentCarSystem.service;

import com.rentCarSystem.commons.Page;
import com.rentCarSystem.domain.User;

public interface UserManager {
	public boolean addUser(User user);//添加用户
	public boolean deleteUser(String identity);//根据身份证删除用户
	public Page findUser(User user,int pageIndex);//根据user 页码查找用户
	public User findUser(String identity);//根据身份证查找用户
	public boolean updateUser(User user);//根据user更新用户
	public boolean isTruePwd(String userName,String userPwd);//根据用户名判断密码是否正确
	public boolean changeUserPwd(String userName,String newPwd);//根据用户名修改密码
}
