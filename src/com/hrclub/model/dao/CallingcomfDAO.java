package com.hrclub.model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import com.hrclub.model.DAOObject;
import com.hrclub.to.CallingcomfTO;
import com.hrclub.to.Page;
public class CallingcomfDAO extends DAOObject {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
	.getLogger(com.hrclub.util.Logger.appender);
	public CallingcomfDAO() {
		super();
	}
	public HashMap callingcomfList() {
		Statement stmt = null;
		HashMap callingcomfMap = new HashMap();
		ResultSet rs = null;
		//List list = new ArrayList();

		try {

			stmt = conn.createStatement();
			String sql = "select * from callingcomf";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				
				callingcomfMap.put(rs.getInt("callingID"), rs.getString("callingname"));
				//list.add(commands);
//				CallingcomfTO to = new CallingcomfTO();
//				to.setCallingID(rs.getInt("callingID"));
//				to.setCallingname(rs.getString("callingname"));
//				list.add(rs.getString("callingname"));
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
		return callingcomfMap;
	}
	
	public CallingcomfTO findCallingByID(int callingID) {
		Statement stmt = null;
		ResultSet rs = null;
		CallingcomfTO to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from callingcomf where callingID='" + callingID
					+ "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new CallingcomfTO();
				to.setCallingID(rs.getInt("callingID"));
				to.setCallingname(rs.getString("callingname"));
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

	public Page findCallingByPage(int pagenum, int pagelen) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from callingcomf";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				CallingcomfTO to = new CallingcomfTO();
				to.setCallingID(rs.getInt("callingID"));
				to.setCallingname(rs.getString("callingname"));
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

	public Page findCallingByPage(int pagenum, int pagelen, String callingname) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from callingcomf where callingname like '%"+callingname+"%'";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				CallingcomfTO to = new CallingcomfTO();
				to.setCallingID(rs.getInt("callingID"));
				to.setCallingname(rs.getString("callingname"));
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

	public int delete(int callingID) {
		String sql = "delete from callingcomf where callingID='" + callingID + "'";
		return this.executeUpdate(sql);
	}

	public int insert(CallingcomfTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into callingcomf(callingID,callingname) values('");

		sb.append(to.getCallingID());
		sb.append("','");
		sb.append(to.getCallingname());
		sb.append("');");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int update(CallingcomfTO to) {
		StringBuffer sb = new StringBuffer("update callingcomf set callingID='");

		sb.append(to.getCallingID());
		sb.append("',callingname='");
		sb.append(to.getCallingname());
		sb.append("' where callingID='" + to.getCallingID() + "';");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}



}