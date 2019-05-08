package com.rentCarSystem.persist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.rentCarSystem.commons.JdbcUtil;
import com.rentCarSystem.domain.Menu;
import com.rentCarSystem.domain.Role;
import com.rentCarSystem.exception.SystemError;
import com.rentCarSystem.exception.SystemException;

public class RoleDaoImpl implements RoleDao {
	/**
	 * 单例模式
	 */
	private static RoleDao roleDao = new RoleDaoImpl();

	private RoleDaoImpl() {
	}

	public static RoleDao getInstance() {
		return roleDao;
	}

	public List<Role> findRole() {
		Connection conn = null;
		List<Role> list = null;
		try {
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = conn
					.prepareStatement("select r.* from roles r order by r.roleid asc");
			ResultSet rs = ps.executeQuery();
			list = new ArrayList<Role>();
			int i=0;
			while (rs.next()) {
				Role role = new Role();
				role.setRowNum(i++);
				role.setRoleId(rs.getInt("roleid"));
				role.setRoleName(rs.getString("rolename"));
				list.add(role);
			}

		} catch (SQLException e) {
			JdbcUtil.rollbackConnection(conn);
			throw new SystemException("sql语句出错");
		} catch (Exception e) {
			if (e.toString().indexOf("SystemException") != -1) {
				throw new SystemException(e.getMessage());
			} else {
				JdbcUtil.rollbackConnection(conn);
				throw new SystemError("数据库访问失败");
			}
		} finally {
			JdbcUtil.closeConnection(conn);
		}
		return list;
	}

	public List<Role> findAllRole(String roleName) {
		Connection conn = null;
		List<Role> list = null;
		StringBuffer sql = new StringBuffer(
				"select r.* from roles r where 1=1");
		if (roleName != null && roleName.length() > 0) {
			sql.append(" and r.rolename like '%").append(roleName).append("%'");
		}
		try {
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql.toString());
			ResultSet rs = ps.executeQuery();
			list = new ArrayList<Role>();
			int i = 0;
			while (rs.next()) {
				Role role = new Role();
				role.setRowNum(i++);
				role.setRoleId(rs.getInt("roleid"));
				role.setRoleName(rs.getString("rolename"));
				list.add(role);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			JdbcUtil.rollbackConnection(conn);
			throw new SystemException("sql语句出错");
		} catch (Exception e) {
			if (e.toString().indexOf("SystemException") != -1) {
				throw new SystemException(e.getMessage());
			} else {
				JdbcUtil.rollbackConnection(conn);
				throw new SystemError("数据库访问失败");
			}
		} finally {
			JdbcUtil.closeConnection(conn);
		}
		return list;
	}

	public Role findRole(int roleid) {
		Connection conn = null;
		Role role = new Role();
		;
		try {
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = conn
					.prepareStatement("select * from roles r where r.roleid=?");
			ps.setInt(1, roleid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				role.setRoleId(rs.getInt("roleid"));
				role.setRoleName(rs.getString("rolename"));
			}
			PreparedStatement ps2 = conn
					.prepareStatement("select * from roles r,menus m,roles_menus rm where r.roleid=rm.roleid and m.menuid=rm.menuid and r.roleid=?");
			ps2.setInt(1, roleid);
			ResultSet rs2 = ps2.executeQuery();
			while (rs2.next()) {
				Menu m = new Menu();
				m.setMenuId(rs2.getInt("menuid"));
				m.setMenuName(rs2.getString("menuname"));
				m.setFatherId(rs2.getInt("fatherid"));
				m.setConnURL(rs2.getString("connurl"));
				role.getMenus().add(m);
			}

		} catch (SQLException e) {
			JdbcUtil.rollbackConnection(conn);
			throw new SystemException("sql语句出错");
		} catch (Exception e) {
			if (e.toString().indexOf("SystemException") != -1) {
				throw new SystemException(e.getMessage());
			} else {
				JdbcUtil.rollbackConnection(conn);
				throw new SystemError("数据库访问失败");
			}
		} finally {
			JdbcUtil.closeConnection(conn);
		}
		return role;
	}

	/**
	 * 查询所有菜单方法
	 * 
	 * @return
	 */
	public List<Menu> findAllMenus() {
		Connection conn = null;
		List<Menu> list = null;
		try {
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = conn.prepareStatement("select * from menus");
			ResultSet rs = ps.executeQuery();
			list = new ArrayList<Menu>();
			while (rs.next()) {
				Menu m = new Menu();
				m.setMenuId(Integer.parseInt(rs.getString("menuid")));
				m.setMenuName(rs.getString("menuname"));
				m.setFatherId(Integer.parseInt(rs.getString("fatherid")));
				m.setConnURL(rs.getString("connurl"));
				list.add(m);
			}

		} catch (SQLException e) {
			JdbcUtil.rollbackConnection(conn);
			throw new SystemException("sql语句出错");
		} catch (Exception e) {
			if (e.toString().indexOf("SystemException") != -1) {
				throw new SystemException(e.getMessage());
			} else {
				JdbcUtil.rollbackConnection(conn);
				throw new SystemError("数据库访问失败");
			}
		} finally {
			JdbcUtil.closeConnection(conn);
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
		String sql = "insert into roles(roleid,rolename) values(null,?)";
		Connection conn = null;
		try {
			conn = JdbcUtil.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, roleName);
			ps.executeUpdate();
			sql = "select r.roleid roleid from roles r where r.rolename=?";
			PreparedStatement ps2 = conn.prepareStatement(sql);
			ps2.setString(1, roleName);
			ResultSet rs = ps2.executeQuery();

			int roleid = 0;
			while (rs.next()) {
				roleid = rs.getInt("roleid");
			}
			for (String menu : menusList) {
				sql = "insert into roles_menus(roleid,menuid) values(?,?)";
				PreparedStatement ps3 = conn.prepareStatement(sql);
				ps3.setInt(1, roleid);
				ps3.setInt(2, Integer.parseInt(menu));
				ps3.executeUpdate();
			}
			conn.commit();

		} catch (SQLException e) {
			JdbcUtil.rollbackConnection(conn);
			throw new SystemException("sql语句出错");
		} catch (Exception e) {
			if (e.toString().indexOf("SystemException") != -1) {
				throw new SystemException(e.getMessage());
			} else {
				JdbcUtil.rollbackConnection(conn);
				throw new SystemError("数据库访问失败");
			}
		} finally {
			JdbcUtil.closeConnection(conn);
		}

	}

	/**
	 * 删除角色方法
	 * 
	 * @param roleid
	 */
	public void deleteRole(int roleid) {
		Connection conn = null;
		try {
			conn = JdbcUtil.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn
					.prepareStatement("delete from roles_menus where roleid=?");
			ps.setInt(1, roleid);
			ps.executeUpdate();
			PreparedStatement ps2 = conn
					.prepareStatement("delete from roles where roleid=?");
			ps2.setInt(1, roleid);
			ps2.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			JdbcUtil.rollbackConnection(conn);
			throw new SystemException("sql语句出错");
		} catch (Exception e) {
			if (e.toString().indexOf("SystemException") != -1) {
				throw new SystemException(e.getMessage());
			} else {
				JdbcUtil.rollbackConnection(conn);
				throw new SystemError("数据库访问失败");
			}
		} finally {
			JdbcUtil.closeConnection(conn);
		}

	}

	/**
	 * 更新角色方法
	 * 
	 * @param roleid
	 */
	public void updateRole(Role role, List<String> menusList) {
		Connection conn = null;
		try {
			conn = JdbcUtil.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn
					.prepareStatement("delete from roles_menus where roleid=?");
			ps.setInt(1, role.getRoleId());
			ps.executeUpdate();
			for (String menu : menusList) {
				PreparedStatement ps2 = conn
						.prepareStatement("insert into roles_menus(roleid,menuid) values(?,?)");
				ps2.setInt(1, role.getRoleId());
				ps2.setInt(2, Integer.parseInt(menu));
				ps2.executeUpdate();
			}
			PreparedStatement ps3 = conn
					.prepareStatement("update roles set rolename=? where roleid=?");
			ps3.setString(1, role.getRoleName());
			ps3.setInt(2, role.getRoleId());
			ps3.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			JdbcUtil.rollbackConnection(conn);
			e.printStackTrace();
			throw new SystemException("sql语句出错");
		} catch (Exception e) {
			if (e.toString().indexOf("SystemException") != -1) {
				throw new SystemException(e.getMessage());
			} else {
				JdbcUtil.rollbackConnection(conn);
				throw new SystemError("数据库访问失败");
			}
		} finally {
			JdbcUtil.closeConnection(conn);
		}
	}

}
