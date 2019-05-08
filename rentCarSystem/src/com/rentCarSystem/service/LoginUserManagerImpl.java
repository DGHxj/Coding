package com.rentCarSystem.service;

import com.rentCarSystem.exception.UserNotFoundException;
import com.rentCarSystem.persist.UserDao;
import com.rentCarSystem.persist.UserDaoImpl;
import com.rentCarSystem.domain.User;

public class LoginUserManagerImpl implements LoginUserManager {

	public User loginUser(User user) throws UserNotFoundException {
		UserDao uld = new UserDaoImpl();
		User u = uld.loginUser(user);
		//用户登录时的用户名和密码的判断
		if(u != null && u.getUserName().length() > 0){
			if(!user.getUserPwd().equals(u.getUserPwd())){
				//密码不对
				throw new UserNotFoundException("密码有误请重新输入");
			}
		}else{
			//没有该用户
			throw new UserNotFoundException("用户名有误");
		}
		return u;
	}

}
