package com.rentCarSystem.persist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.rentCarSystem.commons.Constants;
import com.rentCarSystem.commons.JdbcUtil;
import com.rentCarSystem.domain.Fun;
import com.rentCarSystem.domain.Menu;
import com.rentCarSystem.commons.Page;
import com.rentCarSystem.domain.User;
import com.rentCarSystem.exception.SystemError;
import com.rentCarSystem.exception.SystemException;

public class UserDaoImpl implements UserDao {
	// 用户登录
	public User loginUser(User user) {
		Connection conn = null;
		User u = null;
		int roleId = -1;
		String sql = "select * from users u,roles r where u.userlevel=r.roleid and username=?";
		try {
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUserName());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				u = new User();
				u.setAddress(rs.getString("address"));
				u.setFullName(rs.getString("fullname"));
				u.setIdentity(rs.getString("identity"));
				u.setPhone(rs.getString("phone"));
				u.setPosition(rs.getString("position"));
				u.setSex(rs.getString("sex"));
				u.setUserName(rs.getString("userName"));
				u.setUserPwd(rs.getString("userpwd"));
				u.setUserLevel(rs.getInt("userlevel"));
				roleId = rs.getInt("userlevel");
			}
			if (user != null && user.getUserName().length() > 0) {

				sql = "select * from roles r,menus m,roles_menus rm where r.roleid=rm.roleid and m.menuid=rm.menuid and r.roleid=? order by m.menuid asc";
				PreparedStatement ps2 = conn.prepareStatement(sql);
				ps2.setInt(1, roleId);
				ResultSet rs2 = ps2.executeQuery();
				while (rs2.next()) {
					Menu menu = new Menu();
					menu.setConnURL(rs2.getString("connurl"));
					menu.setFatherId(rs2.getInt("fatherid"));
					menu.setMenuId(rs2.getInt("menuid"));
					menu.setMenuName(rs2.getString("menuname"));
					if (menu != null && menu.getMenuName().length() > 0) {
						sql = "select * from menus m,funs f where f.menuid=m.menuid and m.menuid=?";
						PreparedStatement ps3 = conn.prepareStatement(sql);
						ps3.setInt(1, menu.getMenuId());
						ResultSet rs3 = ps3.executeQuery();
						while (rs3.next()) {
							Fun fun = new Fun();
							fun.setFunId(rs3.getInt("funid"));
							fun.setFunName(rs3.getString("funname"));
							fun.setFunURL(rs3.getString("funurl"));
							fun.setMenu(menu);
							u.getFuns().add(fun);
						}
					}
					u.getMenus().add(menu);
				}
			}
		}catch(SQLException e){
			JdbcUtil.rollbackConnection(conn);
			throw new SystemException("sql语句出错");
		}catch(Exception e){
			if(e.toString().indexOf("SystemException")!=-1){
				throw new SystemException(e.getMessage());
			}else{
				JdbcUtil.rollbackConnection(conn);
				throw new SystemError("数据库访问失败");
			}
		}finally{
			JdbcUtil.closeConnection(conn);
		}
		return u;
	}

	// 添加用户信息
	public boolean addUser(User user) {
		Connection conn = null;
		boolean flag = false;
		try {
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = conn
					.prepareStatement("insert into users (username,identity,fullname,sex,address,phone,position,userlevel,userpwd) values(?,?,?,?,?,?,?,?,?)");
			ps.setString(1, user.getUserName());
			ps.setString(2, user.getIdentity());
			ps.setString(3, user.getFullName());
			ps.setString(4, user.getSex());
			ps.setString(5, user.getAddress());
			ps.setString(6, user.getPhone());
			ps.setString(7, user.getPosition());
			ps.setInt(8, user.getUserLevel());
			ps.setString(9, user.getUserPwd());
			int result = ps.executeUpdate();
			if (result != -1) {
				flag = true;
			}
		} catch(SQLException e){
			JdbcUtil.rollbackConnection(conn);
			e.printStackTrace();
			throw new SystemException("sql语句出错");
		}catch(Exception e){
			if(e.toString().indexOf("SystemException")!=-1){
				throw new SystemException(e.getMessage());
			}else{
				JdbcUtil.rollbackConnection(conn);
				throw new SystemError("数据库访问失败");
			}
		}finally{
			JdbcUtil.closeConnection(conn);
		}
		return flag;
	}

	// 查询用户
	public Page findUser(User user, int pageIndex) {
		Connection conn = null;
		Page p = new Page();
		try {

			conn = JdbcUtil.getConnection();
			int from = (pageIndex - 1) * Constants.PAGE_NUMBER;
			int to = Constants.PAGE_NUMBER;
			String sql = this.genSQL(user, from, to);
			String countSql = this.countSQL(user);
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User u = new User();
				u.setUserName(rs.getString("username"));
				u.setUserPwd(rs.getString("userpwd"));
				u.setAddress(rs.getString("address"));
				u.setPosition(rs.getString("position"));
				u.setUserLevel(rs.getInt("userlevel"));
				u.setSex(rs.getString("sex"));
				u.setFullName(rs.getString("fullname"));
				u.setIdentity(rs.getString("identity"));
				u.setPhone(rs.getString("phone"));
				p.getResult().add(u);
			}
			if (p.getResult().size() > 0) {
				PreparedStatement ps2 = conn.prepareStatement(countSql);
				ResultSet rs2 = ps2.executeQuery();
				int countTemp = -1;
				while (rs2.next()) {
					countTemp = rs2.getInt("c");
				}
				if (countTemp != -1) {
					int totalPage = 0;
					if (countTemp % Constants.PAGE_NUMBER == 0) {
						totalPage = countTemp / Constants.PAGE_NUMBER;
					} else {
						totalPage = countTemp / Constants.PAGE_NUMBER + 1;
					}
					p.setCurrPage(pageIndex);
					p.setTotalPage(totalPage);
					p.setCountRow(countTemp);
				}
			}
		} catch(SQLException e){
			JdbcUtil.rollbackConnection(conn);
			throw new SystemException("sql语句出错");
		}catch(Exception e){
			if(e.toString().indexOf("SystemException")!=-1){
				throw new SystemException(e.getMessage());
			}else{
				JdbcUtil.rollbackConnection(conn);
				throw new SystemError("数据库访问失败");
			}
		}finally{
			JdbcUtil.closeConnection(conn);
		}
		return p;
	}

	// 拼凑查询sql语句
	private String genSQL(User user) {
		StringBuffer sb = new StringBuffer(
				"select rownum rn,username,userpwd,address,position,userlevel,sex,fullname,identity,phone from users u where 1=1 ");
		if (user.getUserName() != null && user.getUserName().length() > 0) {
			sb.append(" and u.username='").append(user.getUserName()).append("'");
		}
		if (user.getUserPwd() != null && user.getUserPwd().length() > 0) {
			sb.append(" and u.userpwd='").append(user.getUserPwd()).append("'");
		}
		if (user.getAddress() != null && user.getAddress().length() > 0) {
			sb.append(" and u.address='").append(user.getAddress()).append("'");
		}
		if (user.getPosition() != null && user.getPosition().length() > 0) {
			sb.append(" and u.position='").append(user.getPosition()).append("'");
		}
		if (Integer.toString(user.getUserLevel()) != null
				&& Integer.toString(user.getUserLevel()).length() > 0) {
			sb.append(" and u.userlevel=").append(user.getUserLevel());
		}
		if (user.getSex() != null && user.getSex().length() > 0) {
			sb.append(" and u.sex='").append(user.getSex()).append("'");
		}
		if (user.getFullName() != null && user.getFullName().length() > 0) {
			sb.append(" and u.fullname='").append(user.getFullName()).append("'");
		}
		if (user.getIdentity() != null && user.getIdentity().length() > 0) {
			sb.append(" and u.identity='").append(user.getIdentity()).append("'");
		}
		if (user.getPhone() != null && user.getPhone().length() > 0) {
			sb.append(" and u.phone='").append(user.getPhone()).append("'");
		}
		return sb.toString();
	}

	// 拼接查询码内建视图的sql语句
	private String genSQL(User user, int from, int to) {
		StringBuffer sb = new StringBuffer("select * from users");
//		sb.append(this.genSQL(user)).append(")t where t.rn between ").append(
//				from).append(" and ").append(to);
		if(user != null && !"".equals(user.getUserName()) && user.getUserName() != null){
			sb.append(" where username = '" + user.getUserName() + "'");
		}
		return sb.toString();
	}

	private String countSQL(User user) {
		StringBuffer sb = new StringBuffer(
				"select count(*) c from  users u ");
		if (user.getUserName() != null && user.getUserName().length() > 0) {
			sb.append(" and u.username='").append(user.getUserName()).append("'");
		}
//		if (user.getUserPwd() != null && user.getUserPwd().length() > 0) {
//			sb.append(" and u.userpwd='").append(user.getUserPwd()).append("'");
//		}
//		if (user.getAddress() != null && user.getAddress().length() > 0) {
//			sb.append(" and u.address='").append(user.getAddress()).append("'");
//		}
//		if (user.getPosition() != null && user.getPosition().length() > 0) {
//			sb.append(" and u.position='").append(user.getPosition()).append("'");
//		}
//		if (Integer.toString(user.getUserLevel()) != null
//				&& Integer.toString(user.getUserLevel()).length() > 0) {
//			sb.append(" and u.userlevel=").append(user.getUserLevel());
//		}
//		if (user.getSex() != null && user.getSex().length() > 0) {
//			sb.append(" and u.sex='").append(user.getSex()).append("'");
//		}
//		if (user.getFullName() != null && user.getFullName().length() > 0) {
//			sb.append(" and u.fullname='").append(user.getFullName()).append("'");
//		}
//		if (user.getIdentity() != null && user.getIdentity().length() > 0) {
//			sb.append(" and u.identity='").append(user.getIdentity()).append("'");
//		}
//		if (user.getPhone() != null && user.getPhone().length() > 0) {
//			sb.append(" and u.phone='").append(user.getPhone()).append("'");
//		}
		return sb.toString().replaceFirst("and", "where");
	}

	// 根据身份证删除用户
	public boolean deleteUser(String identity) {
		Connection conn = null;
		boolean flag = false;
		try {
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = conn
					.prepareStatement("delete from users where identity=?");
			ps.setString(1, identity);
			int result = ps.executeUpdate();
			if (result != -1) {
				flag = true;
			}
		}catch(SQLException e){
			JdbcUtil.rollbackConnection(conn);
			throw new SystemException("sql语句出错");
		}catch(Exception e){
			if(e.toString().indexOf("SystemException")!=-1){
				throw new SystemException(e.getMessage());
			}else{
				JdbcUtil.rollbackConnection(conn);
				throw new SystemError("数据库访问失败");
			}
		}finally{
			JdbcUtil.closeConnection(conn);
		}
		return flag;
	}

	// 根据身份证查找用户
	public User findUser(String identity) {
		Connection conn = null;
		User user = null;
		try {
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = conn
					.prepareStatement("select * from users u where u.identity=?");
			ps.setString(1, identity);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setUserName(rs.getString("username"));
				user.setUserPwd(rs.getString("userpwd"));
				user.setAddress(rs.getString("address"));
				user.setPosition(rs.getString("position"));
				user.setUserLevel(rs.getInt("userlevel"));
				user.setSex(rs.getString("sex"));
				user.setFullName(rs.getString("fullname"));
				user.setIdentity(rs.getString("identity"));
				user.setPhone(rs.getString("phone"));
			}
		} catch(SQLException e){
			JdbcUtil.rollbackConnection(conn);
			throw new SystemException("sql语句出错");
		}catch(Exception e){
			if(e.toString().indexOf("SystemException")!=-1){
				throw new SystemException(e.getMessage());
			}else{
				JdbcUtil.rollbackConnection(conn);
				throw new SystemError("数据库访问失败");
			}
		}finally{
			JdbcUtil.closeConnection(conn);
		}
		return user;
	}

	// 根据user更新用户
	public boolean updateUser(User user) {
		Connection conn = null;
		boolean flag=false;
		try {
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = conn
					.prepareStatement("update users u set u.username=?,u.fullname=?,u.sex=?,u.address=?,u.phone=?,u.position=?,u.userlevel=? where u.identity=?");
			ps.setString(1, user.getUserName());
			ps.setString(2, user.getFullName());
			ps.setString(3, user.getSex());
			ps.setString(4, user.getAddress());
			ps.setString(5, user.getPhone());
			ps.setString(6,user.getPosition());
			ps.setInt(7, user.getUserLevel());
			ps.setString(8,user.getIdentity());
			int result=ps.executeUpdate();
			if(result!=-1){
				flag=true;
			}
		}catch(SQLException e){
			JdbcUtil.rollbackConnection(conn);
			e.printStackTrace();
			throw new SystemException("sql语句出错");
		}catch(Exception e){
			if(e.toString().indexOf("SystemException")!=-1){
				throw new SystemException(e.getMessage());
			}else{
				JdbcUtil.rollbackConnection(conn);
				throw new SystemError("数据库访问失败");
			}
		}finally{
			JdbcUtil.closeConnection(conn);
		}
		return flag;
	}
	//根据用户名判断密码是否正确
	public boolean isTruePwd(String userName,String userPwd){
		Connection conn=null;
		boolean flag=false;
		try{
			conn=JdbcUtil.getConnection();
			PreparedStatement ps=conn.prepareStatement("select * from users u where u.username=? and u.userpwd=?");
			ps.setString(1, userName);
			ps.setString(2, userPwd);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				flag=true;
			}
		}catch(SQLException e){
			JdbcUtil.rollbackConnection(conn);
			throw new SystemException("sql语句出错");
		}catch(Exception e){
			if(e.toString().indexOf("SystemException")!=-1){
				throw new SystemException(e.getMessage());
			}else{
				JdbcUtil.rollbackConnection(conn);
				throw new SystemError("数据库访问失败");
			}
		}finally{
			JdbcUtil.closeConnection(conn);
		}
		return flag;
	}
	//根据用户名修改密码
	public boolean changeUserPwd(String userName,String newPwd){
		Connection conn=null;
		boolean flag=false;
		try{
			conn=JdbcUtil.getConnection();
			PreparedStatement ps=conn.prepareStatement("update users u set u.userpwd=? where u.username=?");
			ps.setString(1, newPwd);
			ps.setString(2, userName);
			int result=ps.executeUpdate();
			if(result!=-1){
				flag=true;
			}
		}catch(SQLException e){
			JdbcUtil.rollbackConnection(conn);
			throw new SystemException("sql语句出错");
		}catch(Exception e){
			if(e.toString().indexOf("SystemException")!=-1){
				throw new SystemException(e.getMessage());
			}else{
				JdbcUtil.rollbackConnection(conn);
				throw new SystemError("数据库访问失败");
			}
		}finally{
			JdbcUtil.closeConnection(conn);
		}
		return flag;
	}
}
