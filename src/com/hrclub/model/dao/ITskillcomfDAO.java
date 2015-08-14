package com.hrclub.model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import com.hrclub.model.DAOObject;
import com.hrclub.to.CertificateComfTO;
import com.hrclub.to.ITskillcomfTO;
import com.hrclub.to.Page;

public class ITskillcomfDAO extends DAOObject {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
     .getLogger(com.hrclub.util.Logger.appender);
	public ITskillcomfDAO() {
		super();
	}
	public HashMap ITskillcomfList() {
		Statement stmt = null;
		HashMap ITskillcomfMap = new HashMap();
		ResultSet rs = null;
		List list = new ArrayList();

		try {

			stmt = conn.createStatement();
			String sql = "select * from skillcomf";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
//				ITskillcomfTO to = new ITskillcomfTO();
//				to.setSkilID(rs.getInt("skilID"));
//				to.setSkillame(rs.getString("skillame"));
//				
//				list.add(rs.getString("skillame"));
				ITskillcomfMap.put(rs.getInt("skilID"),rs.getString("skillame"));
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
		return ITskillcomfMap;
	}
	
	public ITskillcomfTO findITskillByID(int skilID) {
		Statement stmt = null;
		ResultSet rs = null;
		ITskillcomfTO to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from skillcomf where skilID='" + skilID
					+ "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new ITskillcomfTO();
				to.setSkilID(rs.getInt("skilID"));
				to.setSkillame(rs.getString("skillame"));
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

	public Page findITskillByPage(int pagenum, int pagelen) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from skillcomf";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				ITskillcomfTO to = new ITskillcomfTO();
				to.setSkilID(rs.getInt("skilID"));
				to.setSkillame(rs.getString("skillame"));
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
	
	public Page findITskillByPage(int pagenum, int pagelen, String skillame) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from skillcomf where skillame like '%"+skillame+"%'";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				ITskillcomfTO to = new ITskillcomfTO();
				to.setSkilID(rs.getInt("skilID"));
				to.setSkillame(rs.getString("skillame"));
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


	public int delete(int skilID) {
		String sql = "delete from skillcomf where skilID='" + skilID + "'";
		return this.executeUpdate(sql);
	}

	public int insert(ITskillcomfTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into skillcomf(skilID,skillame) values('");

		sb.append(to.getSkilID());
		sb.append("','");
		sb.append(to.getSkillame());
		sb.append("');");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int update(ITskillcomfTO to) {
		StringBuffer sb = new StringBuffer("update skillcomf set skilID='");

		sb.append(to.getSkilID());
		sb.append("',skillame='");
		sb.append(to.getSkillame());
		sb.append("' where skilID='" + to.getSkilID() + "';");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
}


