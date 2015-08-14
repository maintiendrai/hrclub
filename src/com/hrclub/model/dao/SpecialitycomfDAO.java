package com.hrclub.model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.hrclub.model.DAOObject;
import com.hrclub.to.JobComfTO;
import com.hrclub.to.Page;
import com.hrclub.to.SpecialitycomfTO;

public class SpecialitycomfDAO extends DAOObject {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
	.getLogger(com.hrclub.util.Logger.appender);
	public SpecialitycomfDAO() {
		super();
	}
	public HashMap specialitycomfList() {
		Statement stmt = null;
		HashMap specialitycomfMap = new HashMap();
		ResultSet rs = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from specialitycomf";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				
				specialitycomfMap.put(rs.getInt("specialityID"), rs.getString("specialityname"));
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
		return specialitycomfMap;
	}
	
	public SpecialitycomfTO findSpecialitycomfByID(int specialityID) {
		Statement stmt = null;
		ResultSet rs = null;
		SpecialitycomfTO to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from specialitycomf where specialityID='" + specialityID
					+ "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new SpecialitycomfTO();
				to.setSpecialityID(rs.getInt("specialityID"));
				to.setSpecialityname(rs.getString("specialityname"));
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

	public Page findSpecialitycomfByPage(int pagenum, int pagelen) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from specialitycomf";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				SpecialitycomfTO to = new SpecialitycomfTO();
				to.setSpecialityID(rs.getInt("specialityID"));
				to.setSpecialityname(rs.getString("specialityname"));
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
	
	public Page findSpecialitycomfByPage(int pagenum, int pagelen, String specialityname) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from specialitycomf where specialityname like '%"+specialityname+"%'";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				SpecialitycomfTO to = new SpecialitycomfTO();
				to.setSpecialityID(rs.getInt("specialityID"));
				to.setSpecialityname(rs.getString("specialityname"));
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

	public int delete(int specialityID) {
		String sql = "delete from specialitycomf where specialityID='" + specialityID + "'";
		return this.executeUpdate(sql);
	}

	public int insert(SpecialitycomfTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into specialitycomf(specialityID,specialityname) values('");

		sb.append(to.getSpecialityID());
		sb.append("','");
		sb.append(to.getSpecialityname());
		sb.append("');");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int update(SpecialitycomfTO to) {
		StringBuffer sb = new StringBuffer("update specialitycomf set specialityID='");

		sb.append(to.getSpecialityID());
		sb.append("',specialityname='");
		sb.append(to.getSpecialityname());
		sb.append("' where specialityID='" + to.getSpecialityID() + "';");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}



}