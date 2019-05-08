package com.rentCarSystem.service;

import java.util.List;

import com.rentCarSystem.domain.Menu;
import com.rentCarSystem.domain.Role;

public interface RoleManager {
	public List<Role> findRole();
	/**
	 * 根据角色名查询所有角色
	 * @param roleName
	 * @return
	 */
	public List<Role> findAllRole(String roleName);
	/**
	 * 根据roleid查询角色
	 * @param roleid
	 * @return
	 */
	public Role findRole(int roleid);
	/**
	 * 查询所有菜单方法
	 * @return
	 */
	public List<Menu> findAllMenus();
	/**
	 * 添加角色方法
	 * @param roleName
	 * @param menusList
	 */
	public void addRole(String roleName,List<String> menusList);
	/**
	 * 删除角色方法
	 * @param roleid
	 */
	public void deleteRole(int roleid);
	/**
	 * 更新角色方法
	 * @param roleid
	 */
	public void updateRole(Role role,List<String> menusList);
}
