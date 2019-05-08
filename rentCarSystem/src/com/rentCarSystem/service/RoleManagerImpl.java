package com.rentCarSystem.service;

import java.util.List;

import com.rentCarSystem.domain.Menu;
import com.rentCarSystem.domain.Role;
import com.rentCarSystem.exception.SystemError;
import com.rentCarSystem.exception.SystemException;
import com.rentCarSystem.persist.RoleDao;
import com.rentCarSystem.persist.RoleDaoImpl;

public class RoleManagerImpl implements RoleManager {
	/**
	 * 单例模式
	 */
	private static RoleManager roleManager = new RoleManagerImpl();

	private RoleManagerImpl() {
	}

	public static RoleManager getInstance() {
		return roleManager;
	}

	public List<Role> findRole() {
		List<Role> list = null;
		try {
			list = RoleDaoImpl.getInstance().findRole();
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
		return list;
	}

	/**
	 * 根据角色名查询所有角色
	 * 
	 * @param roleName
	 * @return
	 */
	public List<Role> findAllRole(String roleName) {
		List<Role> list = null;
		try {
			list=RoleDaoImpl.getInstance().findAllRole(roleName);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
		return list;
	}

	/**
	 * 根据roleid查询菜单
	 * 
	 * @param roleid
	 * @return
	 */
	public Role findRole(int roleid) {
		Role role = null;
		try {
			role = RoleDaoImpl.getInstance().findRole(roleid);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
		return role;
	}

	/**
	 * 查询所有菜单方法
	 * 
	 * @return
	 */
	public List<Menu> findAllMenus() {
		List<Menu> list = null;
		try {
			list = RoleDaoImpl.getInstance().findAllMenus();
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
		return list;
	}

	/**
	 * 添加角色方法
	 * 
	 * @param roleName
	 * @param menusList
	 */
	public void addRole(String roleName, List<String> menusList) {
		try {
			RoleDaoImpl.getInstance().addRole(roleName, menusList);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
	}

	/**
	 * 删除角色方法
	 * 
	 * @param roleid
	 */
	public void deleteRole(int roleid) {
		try {
			RoleDaoImpl.getInstance().deleteRole(roleid);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
	}

	public void updateRole(Role role, List<String> menusList) {
		try {
			RoleDaoImpl.getInstance().updateRole(role, menusList);
		} catch (Exception e) {
			if (e.toString().indexOf("SystemError") != -1) {
				throw new SystemError(e.getMessage());
			} else {
				throw new SystemException(e.getMessage());
			}
		}
	}

}
