package com.rentCarSystem.persist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.rentCarSystem.commons.Constants;
import com.rentCarSystem.commons.JdbcUtil;
import com.rentCarSystem.commons.Page;
import com.rentCarSystem.commons.Tools;
import com.rentCarSystem.domain.Customers;
import com.rentCarSystem.domain.Logs;
import com.rentCarSystem.service.LogsManager;
import com.rentCarSystem.service.LogsManagerImpl;

public class LogsDaoImpl implements LogsDao {
	public static LogsDao ld=new LogsDaoImpl();
	private LogsDaoImpl(){
		
	}
	public static LogsDao getInstance(){
		return ld;
	}

	// 查询日志信息
	public Page findAllLogs(Logs logs, int pageIndex) {
		Connection conn = null;
		Page p = new Page();
		try {
			conn = JdbcUtil.getConnection();
			// 公式求起始页和结束页
			int from = (pageIndex - 1) * Constants.PAGE_NUMBER;
			int to = Constants.PAGE_NUMBER;
			// 获取查询SQL语句
			String sql = this.genSQL(logs, from, to);

			// 获取查询总条数的sql语句
			String countSql = this.countSQL(logs);

			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Logs l = new Logs();
				l.setAction(rs.getString("action"));
				l.setUserName(rs.getString("userName"));
				l.setActionTime(rs.getDate("actiontime"));
				l.setId(rs.getInt("id"));
				l.setFlag(rs.getInt("flag"));
				// 将查询到的结果集放到page的list属性里
				p.getResult().add(l);
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
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConnection(conn);
		}

		return p;
	}

	// sql语句操作↓↓↓
	// 拼接查询的sql语句
	private String genanSQl(Logs logs) {
		StringBuffer sb = new StringBuffer(
				"select id,username,action,actiontime,flag from  logs l where 1=1 ");

		if (logs.getAction() != null && logs.getAction().length() > 0) {
			sb.append(" and l.action like '%").append(logs.getAction()).append(
					"%'");
		}
		if (logs.getUserName() != null && logs.getUserName().length() > 0) {
			sb.append(" and l.username like '%").append(logs.getUserName())
					.append("%'");
		}
		if (logs.getActionTime() != null) {
			sb.append(" and l.actiontime like  '%").append(Tools.dateToString(logs.getActionTime(), "yyyy-MM-dd")).append("%'");
		}
		if (logs.getId()!= 0) {
			sb.append(" and l.id = ").append(logs.getId());
		}
		if(logs.getFlag() != 0){
			sb.append(" and l.flag =").append(logs.getFlag());
		}
		
		return sb.toString();
	}

	// 拼接查询码内建视图的sql语句
	private String genSQL(Logs logs, int from, int to) {
		StringBuffer sb = new StringBuffer("");
		sb.append(this.genanSQl(logs)).append(" limit ")
				.append(from).append(" , ").append(to);
		return sb.toString();
	}

	// 拼接查询总条数的sql语句
	private String countSQL(Logs logs) {
		StringBuffer sb = new StringBuffer(
				"select count(*) c from  logs u where 1=1 ");
		if (logs.getAction() != null && logs.getAction().length() > 0) {
			sb.append(" and u.action like '%").append(logs.getAction()).append(
					"%'");
		}
		if (logs.getUserName() != null && logs.getUserName().length() > 0) {
			sb.append(" and u.username like '%").append(logs.getUserName())
					.append("%'");
		}
		if (logs.getActionTime() != null) {
			sb.append(" and u.actiontime like  '%").append(Tools.dateToString(logs.getActionTime(), "yyyy-MM-dd")).append("%'");
		}
		if (logs.getId() != 0) {
			sb.append(" and u.id = ").append(logs.getId());
		}
		if(logs.getFlag() != 0){
			sb.append(" and u.flag =").append(logs.getFlag());
		}
		return sb.toString();
	}
	public void deleteLogs(int id) {
		Connection conn = null;
		String sql = "delete from logs where id = ?";
		try {
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			JdbcUtil.rollbackConnection(conn);
		} finally {
			JdbcUtil.closeConnection(conn);
		}
	}

}
