package com.rentCarSystem.persist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.rentCarSystem.commons.Constants;
import com.rentCarSystem.commons.JdbcUtil;
import com.rentCarSystem.commons.Page;
import com.rentCarSystem.domain.Customers;
import com.rentCarSystem.exception.SystemError;
import com.rentCarSystem.exception.SystemException;

public class CustomersDaoImpl implements CustomersDao {
	/**
	 * 单例模式
	 */
	private static CustomersDao custDao = new CustomersDaoImpl();

	private CustomersDaoImpl() {

	}

	public static CustomersDao getInstance() {
		return custDao;
	}

	// 添加客户信息
	public void addCustomers(Customers customers) {
		Connection conn = null;
		// Customers cu = null;
		String sql = "insert into customers (identity,custName,sex,address,phone,career,custPwd) values(?,?,?,?,?,?,?)";
		try {
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, customers.getIdentity());
			ps.setString(2, customers.getCustName());
			ps.setString(3, customers.getSex());
			ps.setString(4, customers.getAddress());
			ps.setString(5, customers.getPhone());
			ps.setString(6, customers.getCareer());
			ps.setString(7, customers.getCustPwd());
			ps.executeUpdate();
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

	// 查询客户信息
	public Page findAllCustomers(Customers customers, int pageIndex) {
		Connection conn = null;
		Page p = new Page();
		try {
			conn = JdbcUtil.getConnection();
			// 公式求起始页和结束页
			int from = (pageIndex - 1) * Constants.PAGE_NUMBER;
			int to = Constants.PAGE_NUMBER;
			// 获取查询SQL语句
			String sql = this.genSQL(customers, from, to);

			// 获取查询总条数的sql语句
			String countSql = this.countSQL(customers);

			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Customers c = new Customers();
				c.setAddress(rs.getString("address"));
				c.setCareer(rs.getString("career"));
				c.setCustName(rs.getString("custname"));
				c.setIdentity(rs.getString("identity"));
				c.setPhone(rs.getString("phone"));
				c.setSex(rs.getString("sex"));
				// 将查询到的结果集放到page的list属性里
				p.getResult().add(c);
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
					p.setCountRow(countTemp);
					p.setCurrPage(pageIndex);
					p.setTotalPage(totalPage);
				}
			}
		}  catch (SQLException e) {
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

		return p;
	}

	// sql语句操作↓↓↓
	// 拼接查询的sql语句
	private String genanSQl(Customers customers) {
		StringBuffer sb = new StringBuffer(
				"select identity,custname,sex,address,phone,career from  customers c ");

		if (customers.getIdentity() != null
				&& customers.getIdentity().length() > 0) {
			sb.append(" and c.identity like '%")
					.append(customers.getIdentity()).append("%'");
		}
		if (customers.getCustName() != null
				&& customers.getCustName().length() > 0) {
			sb.append(" and c.custname like '%")
					.append(customers.getCustName()).append("%'");
		}
		if (customers.getSex() != null && customers.getSex().length() > 0) {
			sb.append(" and c.sex = '").append(customers.getSex()).append("'");
		}
		if (customers.getAddress() != null
				&& customers.getAddress().length() > 0) {
			sb.append(" and c.address like '%").append(customers.getAddress())
					.append("%'");
		}
		if (customers.getPhone() != null && customers.getPhone().length() > 0) {
			sb.append(" and c.phone like '%").append(customers.getPhone())
					.append("%'");
		}
		if (customers.getCareer() != null && customers.getCareer().length() > 0) {
			sb.append(" and c.career like '%").append(customers.getCareer())
					.append("%'");
		}
		return sb.toString();
	}

	// 拼接查询码内建视图的sql语句
	private String genSQL(Customers customers, int from, int to) {
		StringBuffer sb = new StringBuffer("");
		sb.append(this.genanSQl(customers)).append(" limit ")
				.append(from).append(" , ").append(to);
		return sb.toString().replaceFirst("and", "where");
	}

	// 拼接查询总条数的sql语句
	private String countSQL(Customers customers) {
		StringBuffer sb = new StringBuffer(
				"select count(*) c from  customers u where 1=1 ");
		if (customers.getIdentity() != null
				&& customers.getIdentity().length() > 0) {
			sb.append(" and u.identity like '%")
					.append(customers.getIdentity()).append("%'");
		}
		if (customers.getCustName() != null
				&& customers.getCustName().length() > 0) {
			sb.append(" and u.custName like '%")
					.append(customers.getCustName()).append("%'");
		}
		if (customers.getSex() != null && customers.getSex().length() > 0) {
			sb.append(" and u.sex = '").append(customers.getSex()).append("'");
		}
		if (customers.getAddress() != null
				&& customers.getAddress().length() > 0) {
			sb.append(" and u.address like '%").append(customers.getAddress())
					.append("%'");
		}
		if (customers.getPhone() != null && customers.getPhone().length() > 0) {
			sb.append(" and u.phone like '%").append(customers.getPhone())
					.append("%'");
		}
		if (customers.getCareer() != null && customers.getCareer().length() > 0) {
			sb.append(" and u.career like '%").append(customers.getCareer())
					.append("%'");
		}
		return sb.toString();
	}

	// 删除客户
	public void deleteCustomers(String identity) {
		Connection conn = null;
		String sql = "delete from customers where identity = ?";
		try {
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, identity);
			int i = ps.executeUpdate();
		}  catch (SQLException e) {
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
	}

	// 查询单个客户
	public Customers findCustomers(String identity) {
		Connection conn = null;
		Customers c = null;
		String sql = "select * from customers where identity = ?";
		try {
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, identity);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new Customers();
				c.setAddress(rs.getString("address"));
				c.setCareer(rs.getString("career"));
				c.setCustName(rs.getString("custname"));
				c.setIdentity(rs.getString("identity"));
				c.setPhone(rs.getString("phone"));
				c.setCustPwd(rs.getString("custPwd"));
				c.setSex(rs.getString("sex"));
			}
		}  catch (SQLException e) {
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
		return c;
	}

	// 修改客户信息
	public void updateCustomers(Customers customers) {
		Connection conn = null;
		String sql = "update customers set custname=?,address=?,career=?,phone=?,sex=? where identity=?";
		try {
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, customers.getCustName());
			ps.setString(2, customers.getAddress());
			ps.setString(3, customers.getCareer());
			ps.setString(4, customers.getPhone());
			ps.setString(5, customers.getSex());
			ps.setString(6, customers.getIdentity());
			ps.executeUpdate();
		}  catch (SQLException e) {
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

	// 修改客户密码
	public void chengeCustomersPwd(String identity, String newPwd) {
		Connection conn = null;
		String sql = "update customers set custPwd=? where identity=?";
		try {
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, newPwd);
			ps.setString(2, identity);
			ps.executeUpdate();

		}  catch (SQLException e) {
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

}
