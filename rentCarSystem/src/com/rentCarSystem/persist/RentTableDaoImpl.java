package com.rentCarSystem.persist;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.rentCarSystem.commons.Constants;
import com.rentCarSystem.commons.JdbcUtil;
import com.rentCarSystem.commons.Page;
import com.rentCarSystem.commons.Tools;
import com.rentCarSystem.domain.Car;
import com.rentCarSystem.domain.Customers;
import com.rentCarSystem.domain.RentTable;
import com.rentCarSystem.domain.User;
import com.rentCarSystem.exception.SystemError;
import com.rentCarSystem.exception.SystemException;

public class RentTableDaoImpl implements RentTableDao {
	/**
	 * 单例模式
	 */
	private static RentTableDao rentDao = new RentTableDaoImpl();

	private RentTableDaoImpl() {

	}

	public static RentTableDao getInstance() {
		return rentDao;
	}

	// 业务统计中查询全部出租单信息
	public Page findRentTable(int pageIndex) {
		Connection conn = null;
		Page p = new Page();
		RentTable rent = null;
		String custId = null;
		String carId = null;
		String userId = null;
		try {
			conn = JdbcUtil.getConnection();
			int from = (pageIndex - 1) * Constants.PAGE_NUMBER;
			int to = Constants.PAGE_NUMBER;
			PreparedStatement ps = conn.prepareStatement(this.genSQL(from, to));
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				rent = new RentTable();
				rent.setTableId(rs.getLong("tableid"));
				rent.setShouldPayPrice(rs.getDouble("shouldpayprice"));
				rent.setPrice(rs.getDouble("price"));
				rent.setBeginDate(rs.getDate("begindate"));
				rent.setShouldReturnDate(rs.getDate("shouldreturndate"));
				rent.setReturnDate(rs.getDate("returndate"));
				rent.setRentFlag(rs.getInt("rentflag"));
				rent.setCustId(rs.getString("custid"));
				rent.setCarId(rs.getString("carid"));
				rent.setUserId(rs.getString("userid"));
				custId = rs.getString("custid");
				carId = rs.getString("carid");
				userId = rs.getString("userid");
				if (custId != null && custId.length() > 0) {
					PreparedStatement ps2 = conn
							.prepareStatement("select * from customers where identity=?");
					ps2.setString(1, custId);
					ResultSet rs2 = ps2.executeQuery();
					while (rs2.next()) {
						Customers customer = new Customers();
						customer.setIdentity(rs2.getString("identity"));
						customer.setCustName(rs2.getString("custname"));
						customer.setSex(rs2.getString("sex"));
						customer.setAddress(rs2.getString("address"));
						customer.setPhone(rs2.getString("phone"));
						customer.setCareer(rs2.getString("career"));
						customer.setCustPwd(rs2.getString("custpwd"));
						rent.setCustomers(customer);
					}
				}
				if (carId != null && carId.length() > 0) {
					PreparedStatement ps3 = conn
							.prepareStatement("select * from cars where carnumber=?");
					ps3.setString(1, carId);
					ResultSet rs3 = ps3.executeQuery();
					while (rs3.next()) {
						Car car = new Car();
						car.setCarNumber(rs3.getString("carnumber"));
						car.setCarType(rs3.getString("cartype"));
						car.setColor(rs3.getString("color"));
						car.setPrice(rs3.getString("price"));
						car.setRentPrice(rs3.getString("rentprice"));
						car.setDeposit(rs3.getString("deposit"));
						car.setIsRenting(rs3.getString("isrenting"));
						car.setDescription(rs3.getString("cardesc"));
						rent.setCar(car);
					}

				}
				if (userId != null && userId.length() > 0) {
					PreparedStatement ps4 = conn
							.prepareStatement("select * from users where username=?");
					ps4.setString(1, userId);
					ResultSet rs4 = ps4.executeQuery();
					while (rs4.next()) {
						User user = new User();
						user.setUserName(rs4.getString("username"));
						user.setIdentity(rs4.getString("identity"));
						user.setFullName(rs4.getString("fullname"));
						user.setSex(rs4.getString("sex"));
						user.setAddress(rs4.getString("address"));
						user.setPhone(rs4.getString("phone"));
						user.setPosition(rs4.getString("position"));
						user.setUserLevel(rs4.getInt("userlevel"));
						user.setUserPwd(rs4.getString("userpwd"));
						rent.setUser(user);
					}
				}
				p.getResult().add(rent);
			}
			if (p.getResult().size() > 0) {
				PreparedStatement ps2 = conn
						.prepareStatement("select count(*) c from renttable rent, cars car, users users, customers cust where rent.custid=cust.identity and rent.carid=car.carnumber and rent.userid=users.username");
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
		return p;
	}

	// 分页信息
	private String genSQL(int from, int to) {
		StringBuffer sb = new StringBuffer("");
		sb.append("select rent.tableid,rent.imprest,rent.shouldpayprice,rent.price,rent.begindate,rent.shouldreturndate,rent.returndate,rent.rentflag,rent.custid,rent.carid,rent.userid from renttable rent, cars car, users users, customers cust where rent.custid=cust.identity and rent.carid=car.carnumber and rent.userid=users.username")
				.append(" limit ").append(from).append(" , ")
				.append(to);
		return sb.toString();

	}

	// 业务统计中查询单个出租单信息
	public RentTable findRentTable(Long tableId, String custId, String carId,
			String userId) {
		Connection conn = null;

		RentTable rent = null;
		try {
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = conn
					.prepareStatement("select * from renttable where tableid=?");
			ps.setLong(1, tableId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				rent = new RentTable();
				rent.setTableId(rs.getLong("tableid"));
				rent.setImprest(rs.getDouble("imprest"));
				rent.setShouldPayPrice(rs.getDouble("shouldpayprice"));
				rent.setPrice(rs.getDouble("price"));
				rent.setBeginDate(rs.getDate("begindate"));
				rent.setShouldReturnDate(rs.getDate("shouldreturndate"));
				rent.setReturnDate(rs.getDate("returndate"));
				rent.setRentFlag(rs.getInt("rentflag"));
				rent.setCustId(rs.getString("custid"));
				rent.setCarId(rs.getString("carid"));
				rent.setUserId(rs.getString("userid"));
				if (custId != null && custId.length() > 0) {
					PreparedStatement ps2 = conn
							.prepareStatement("select * from customers where identity=?");
					ps2.setString(1, custId);
					ResultSet rs2 = ps2.executeQuery();
					while (rs2.next()) {
						Customers customer = new Customers();
						customer.setIdentity(rs2.getString("identity"));
						customer.setCustName(rs2.getString("custname"));
						customer.setSex(rs2.getString("sex"));
						customer.setAddress(rs2.getString("address"));
						customer.setPhone(rs2.getString("phone"));
						customer.setCareer(rs2.getString("career"));
						customer.setCustPwd(rs2.getString("custpwd"));
						rent.setCustomers(customer);
					}
				}
				if (carId != null && carId.length() > 0) {
					PreparedStatement ps3 = conn
							.prepareStatement("select * from cars where carnumber=?");
					ps3.setString(1, carId);
					ResultSet rs3 = ps3.executeQuery();
					while (rs3.next()) {
						Car car = new Car();
						car.setCarNumber(rs3.getString("carnumber"));
						car.setCarType(rs3.getString("cartype"));
						car.setColor(rs3.getString("color"));
						car.setPrice(rs3.getString("price"));
						car.setRentPrice(rs3.getString("rentprice"));
						car.setDeposit(rs3.getString("deposit"));
						car.setIsRenting(rs3.getString("isrenting"));
						car.setDescription(rs3.getString("cardesc"));
						rent.setCar(car);
					}

				}
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
		return rent;
	}

	// 添加出租单
	public void addRentTable(RentTable rentTable, User user) {
		Connection conn = null;
		String sql = "insert into renttable(tableid,imprest, shouldpayprice,price,begindate,shouldreturndate,rentflag,custid,carid,userid) values(?,?,?,?,?,?,?,?,?,?)";
		try {
			conn = JdbcUtil.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setLong(1, rentTable.getTableId());
			ps.setDouble(2, rentTable.getImprest());
			ps.setDouble(3, rentTable.getShouldPayPrice());
			ps.setDouble(4, rentTable.getPrice());
			ps.setDate(5, new Date(rentTable.getBeginDate().getTime()));
			ps.setDate(6, new Date(rentTable.getShouldReturnDate().getTime()));
			ps.setInt(7, rentTable.getRentFlag());
			ps.setString(8, rentTable.getCustId());
			ps.setString(9, rentTable.getCarId());
			ps.setString(10, rentTable.getUserId());
			ps.executeUpdate();
			String sql2 = "update cars c set c.isrenting=? where c.carnumber=?";
			PreparedStatement ps2 = conn.prepareStatement(sql2);
			ps2.setString(1, "1");
			ps2.setString(2, rentTable.getCarId());
			ps2.executeUpdate();
			Tools.addLog(user, Constants.LOG_ACTION_RENTCARTABLE,
					Constants.LOG_ACTION_RENDCARTABLE_STATE, conn);

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

	// 出租单管理中查询所有出租单
	public Page findAllRentTable(RentTable rentTable, int pageIndex) {
		Connection conn = null;
		Page p = new Page();
		try {
			conn = JdbcUtil.getConnection();
			// 公式求起始页和结束页
			int from = (pageIndex - 1) * Constants.PAGE_NUMBER;
			int to = Constants.PAGE_NUMBER;
			// 获取查询SQL语句
			String sql = this.genSQL(rentTable, from, to);

			// 获取查询总条数的sql语句
			String countSql = this.countSQL(rentTable);

			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				RentTable r = new RentTable();
				r.setTableId(rs.getLong("tableid"));
				r.setImprest(rs.getDouble("imprest"));
				r.setShouldPayPrice(rs.getDouble("shouldpayprice"));
				r.setPrice(rs.getDouble("price"));
				r.setBeginDate(rs.getDate("begindate"));
				r.setShouldReturnDate(rs.getDate("shouldreturndate"));
				r.setReturnDate(rs.getDate("returndate"));
				r.setRentFlag(rs.getInt("rentflag"));
				r.setCustId(rs.getString("custid"));
				r.setCarId(rs.getString("carid"));
				r.setUserId(rs.getString("userid"));

				// 将查询到的结果集放到page的list属性里
				p.getResult().add(r);
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

		return p;
	}

	// sql语句操作↓↓↓
	// 拼接查询的sql语句
	private String genanSQl(RentTable rentTable) {
		StringBuffer sb = new StringBuffer(
				"select tableid,imprest,shouldpayprice,price,begindate,shouldreturndate,returndate,rentflag,custid,carid,userid from  renttable r ");

		if (rentTable.getTableId() != null) {
			sb.append(" and r.tableid =").append(rentTable.getTableId());
		}
		if (rentTable.getBeginDate() != null) {
			sb.append(" and r.begindate like  '%")
					.append(
							Tools.dateToString(rentTable.getBeginDate(),
									"yyyy-MM-dd")).append("%'");
		}
		if (rentTable.getShouldReturnDate() != null) {
			sb.append(" and r.shouldreturndate like  '%")
					.append(
							Tools.dateToString(rentTable.getShouldReturnDate(),
									"yyyy-MM-dd")).append("%'");
		}
		if (rentTable.getReturnDate() != null) {
			sb.append(" and r.returndate like  '%")
					.append(
							Tools.dateToString(rentTable.getReturnDate(),
									"yyyy-MM-dd")).append("%'");
		}
		if (rentTable.getCustId() != null && rentTable.getCustId().length() > 0) {
			sb.append(" and r.custid ='").append(rentTable.getCustId())
					.append("'");
		}
		if (rentTable.getCarId() != null && rentTable.getCarId().length() > 0) {
			sb.append(" and r.carid like '%").append(rentTable.getCarId())
					.append("%'");
		}
		if (rentTable.getUserId() != null && rentTable.getUserId().length() > 0) {
			sb.append(" and r.userid like '%").append(rentTable.getUserId())
					.append("%'");
		}
		if (rentTable.getRentFlag() != null) {
			sb.append(" and r.rentflag ='").append(rentTable.getRentFlag())
					.append("'");
		}

		return sb.toString().replaceFirst("and", "where");
	}

	// 拼接查询码内建视图的sql语句
	private String genSQL(RentTable table, int from, int to) {
		StringBuffer sb = new StringBuffer("");
		sb.append(this.genanSQl(table)).append(" limit ")
				.append(from).append(" , ").append(to);
		return sb.toString();
	}

	// 拼接查询总条数的sql语句
	private String countSQL(RentTable rentTable) {
		StringBuffer sb = new StringBuffer(
				"select count(*) c from  renttable u where 1=1 ");

		if (rentTable.getTableId() != null) {
			sb.append(" and u.tableid =").append(rentTable.getTableId());
		}
		if (rentTable.getBeginDate() != null) {
			sb.append(" and u.begindate like  '%")
					.append(
							Tools.dateToString(rentTable.getBeginDate(),
									"yyyy-MM-dd")).append("%'");
		}
		if (rentTable.getShouldReturnDate() != null) {
			sb.append(" and u.shouldreturndate like  '%")
					.append(
							Tools.dateToString(rentTable.getShouldReturnDate(),
									"yyyy-MM-dd")).append("%'");
		}
		if (rentTable.getReturnDate() != null) {
			sb.append(" and u.returndate like  '%")
					.append(
							Tools.dateToString(rentTable.getReturnDate(),
									"yyyy-MM-dd")).append("%'");
		}
		if (rentTable.getCustId() != null && rentTable.getCustId().length() > 0) {
			sb.append(" and u.custid like '%").append(rentTable.getCustId())
					.append("%'");
		}
		if (rentTable.getCarId() != null && rentTable.getCarId().length() > 0) {
			sb.append(" and u.carid like '%").append(rentTable.getCarId())
					.append("%'");
		}
		if (rentTable.getUserId() != null && rentTable.getUserId().length() > 0) {
			sb.append(" and u.userid like '%").append(rentTable.getUserId())
					.append("%'");
		}
		if (rentTable.getRentFlag() != null) {
			sb.append(" and u.rentflag  ='").append(rentTable.getRentFlag())
					.append("'");
		}
		return sb.toString();
	}

	// 根据出租单号查单个出租单
	public RentTable findRantTableById(Long tableId) {
		Connection conn = null;
		RentTable r = null;
		String sql = "select * from renttable where tableid = ?";
		try {
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setLong(1, tableId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				r = new RentTable();
				r.setTableId(rs.getLong("tableid"));
				r.setImprest(rs.getDouble("imprest"));
				r.setShouldPayPrice(rs.getDouble("shouldpayprice"));
				r.setPrice(rs.getDouble("price"));
				r.setBeginDate(rs.getDate("begindate"));
				r.setShouldReturnDate(rs.getDate("shouldreturndate"));
				r.setReturnDate(rs.getDate("returndate"));
				r.setRentFlag(rs.getInt("rentflag"));
				r.setCustId(rs.getString("custid"));
				r.setCarId(rs.getString("carid"));
				r.setUserId(rs.getString("userid"));
			}
		} catch (SQLException e) {
			JdbcUtil.rollbackConnection(conn);
			throw new SystemException("sql语句出错");
		} catch (Exception e) {
			if (e.toString().indexOf("SystemException") != -1) {
				throw new SystemException(e.getMessage());
			} else {
				e.printStackTrace();
				JdbcUtil.rollbackConnection(conn);
				throw new SystemError("数据库访问失败");
			}
		} finally {
			JdbcUtil.closeConnection(conn);
		}
		return r;
	}

	// 删除出租单
	public void deleteRentTable(Long tabelId) {
		Connection conn = null;
		String sql = "delete from renttable where tableid = ?";
		try {
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setLong(1, tabelId);
			ps.executeUpdate();
		} catch (SQLException e) {
			JdbcUtil.rollbackConnection(conn);
			throw new SystemException("sql语句出错");
		} catch (Exception e) {
			if (e.toString().indexOf("SystemException") != -1) {
				throw new SystemException(e.getMessage());
			} else {
				e.printStackTrace();
				JdbcUtil.rollbackConnection(conn);
				throw new SystemError("数据库访问失败");
			}
		} finally {
			JdbcUtil.closeConnection(conn);
		}
	}

	// 更新出租单
	public void updateRentTbale(RentTable rentTable) {
		Connection conn = null;
		String sql = "update renttable set imprest=?,shouldpayprice=?,price=?,begindate=?,shouldreturndate=?,returndate=?,rentflag=? where tableid = ?";
		try {
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setDouble(1, rentTable.getImprest());
			ps.setDouble(2, rentTable.getShouldPayPrice());
			ps.setDouble(3, rentTable.getPrice());
			ps.setDate(4, Tools.utilDateToSqlDate(rentTable.getBeginDate()));
			ps.setDate(5, Tools.utilDateToSqlDate(rentTable
					.getShouldReturnDate()));
			ps.setDate(6, Tools.utilDateToSqlDate(rentTable
					.getReturnDate()));
			ps.setInt(7, rentTable.getRentFlag());
			ps.setLong(8, rentTable.getTableId());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			JdbcUtil.rollbackConnection(conn);
			throw new SystemException("sql语句出错");
		} catch (Exception e) {
			if (e.toString().indexOf("SystemException") != -1) {
				throw new SystemException(e.getMessage());
			} else {
				e.printStackTrace();
				JdbcUtil.rollbackConnection(conn);
				throw new SystemError("数据库访问失败");
			}
		} finally {
			JdbcUtil.closeConnection(conn);
		}
	}

}
