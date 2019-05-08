package com.rentCarSystem.service;

import java.sql.SQLException;

import com.rentCarSystem.commons.JdbcUtil;
import com.rentCarSystem.commons.Page;
import com.rentCarSystem.domain.User;
import com.rentCarSystem.exception.SystemError;
import com.rentCarSystem.exception.SystemException;
import com.rentCarSystem.persist.UserDao;
import com.rentCarSystem.persist.UserDaoImpl;

public class UserManagerImpl implements UserManager {
	UserDao ud = new UserDaoImpl();

	// 根据user添加用户
	public boolean addUser(User user) {
		boolean flag = false;
		try {
			flag = ud.addUser(user);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
		return flag;
	}

	// 根据身份证删除用户
	public boolean deleteUser(String identity) {
		UserDao ud = new UserDaoImpl();
		boolean flag = false;
		try {
			flag = ud.deleteUser(identity);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
		return flag;
	}

	// 根据user 页码查找用户
	public Page findUser(User user, int pageIndex) {
		UserDao ud = new UserDaoImpl();
		Page page = null;
		try {
			page = ud.findUser(user, pageIndex);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
		return page;
	}

	// 根据身份证查找用户
	public User findUser(String identity) {
		User user = null;
		try {
			user = ud.findUser(identity);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
		return user;
	}

	// 根据user更新用户
	public boolean updateUser(User user) {
		boolean flag = false;
		try {
			flag = ud.updateUser(user);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
		return flag;
	}

	// 根据用户名判断密码是否正确
	public boolean isTruePwd(String userName, String userPwd) {
		boolean flag = false;
		try {
			flag = ud.isTruePwd(userName, userPwd);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
		return flag;
	}

	// 根据用户名修改密码
	public boolean changeUserPwd(String userName, String newPwd) {
		boolean flag = false;
		try {
			flag= ud.changeUserPwd(userName, newPwd);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
		return flag;
	}
}
