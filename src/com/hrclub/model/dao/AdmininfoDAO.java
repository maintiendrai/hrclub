package com.hrclub.model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.hrclub.model.DAOObject;
import com.hrclub.to.AdmininfoTO;
import com.hrclub.to.Page;

public class AdmininfoDAO extends DAOObject {

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.hrclub.util.Logger.appender);

	public AdmininfoDAO() {
		super();
	}

	public AdmininfoTO findAdminByID(String adminID) {
		Statement stmt = null;
		ResultSet rs = null;
		AdmininfoTO to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from admininfo where adminID='" + adminID
					+ "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new AdmininfoTO();
				to.setAdminID(rs.getString("adminID"));
				to.setPassword(rs.getString("password"));
				to.setAdminname(rs.getString("adminname"));
				to.setRole(rs.getInt("role"));
			}
		} catch (SQLException e) {
			logger.debug(e.toString());
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
		}
		return to;
	}
	
	public AdmininfoTO findAdminByIDAndRole(String adminID,String role) {
		Statement stmt = null;
		ResultSet rs = null;
		AdmininfoTO to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from admininfo where adminID='" + adminID
					+"' and role='"+role+ "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new AdmininfoTO();
				to.setAdminID(rs.getString("adminID"));
				to.setPassword(rs.getString("password"));
				to.setAdminname(rs.getString("adminname"));
				to.setRole(rs.getInt("role"));
			}
		} catch (SQLException e) {
			logger.debug(e.toString());
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
		}
		return to;
	}

	public Page findAdminByPage(int pagenum, int pagelen) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from admininfo where role='1'";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				AdmininfoTO to = new AdmininfoTO();
				to.setAdminID(rs.getString("adminID"));
				to.setPassword(rs.getString("password"));
				to.setAdminname(rs.getString("adminname"));
				to.setRole(rs.getInt("role"));
				list.add(to);
			}
		} catch (SQLException e) {
			logger.debug(e.toString());
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
		}

		page.setData(list);

		if (list.size() < pagelen) {
			page.setRecordNum((pagenum - 1) * pagelen + list.size());
		} else {
			page.setRecordNum(this.countResultSizeSimple(sql));
		}
		return page;
	}

	public int delete(String adminID) {
		String sql = "delete from admininfo where adminID='" + adminID + "'";
		return this.executeUpdate(sql);
	}

	public int insert(AdmininfoTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into admininfo(adminID,password,adminname,role) values('");

		sb.append(to.getAdminID());
		sb.append("','");
		sb.append(to.getPassword());
		sb.append("','");
		sb.append(to.getAdminname());
		sb.append("','");
		sb.append(to.getRole());
		sb.append("');");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int update(AdmininfoTO to) {
		StringBuffer sb = new StringBuffer("update admininfo set adminID='");

		sb.append(to.getAdminID());
		sb.append("',password='");
		sb.append(to.getPassword());
		sb.append("',adminname='");
		sb.append(to.getAdminname());
		sb.append("',role='");
		sb.append(to.getRole());
		sb.append("' where adminID='" + to.getAdminID() + "';");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

}
