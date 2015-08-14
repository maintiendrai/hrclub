package com.hrclub.model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.hrclub.model.DAOObject;
import com.hrclub.to.JobComfTO;
import com.hrclub.to.Page;

public class JobComfDAO extends DAOObject {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
	.getLogger(com.hrclub.util.Logger.appender);
	public JobComfDAO() {
		super();
	}
	public HashMap jobList() {
		Statement stmt = null;

		ResultSet rs = null;
		HashMap jobComfMap = new HashMap();
		//List list = new ArrayList();

		try {

			stmt = conn.createStatement();
			String sql = "select * from jobcomf";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				jobComfMap.put(rs.getInt("jobID"), rs.getString("jobame"));
//				to.setJobID(rs.getInt("jobID"));
//				to.setJobame(rs.getString("jobame"));
//				list.add(rs.getString("jobame"));
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
		return jobComfMap;
	}
	
	public JobComfTO findJobComfByID(int jobID) {
		Statement stmt = null;
		ResultSet rs = null;
		JobComfTO to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from jobcomf where jobID='" + jobID
					+ "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new JobComfTO();
				to.setJobID(rs.getInt("jobID"));
				to.setJobame(rs.getString("jobame"));
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

	public Page findJobComfByPage(int pagenum, int pagelen) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from jobcomf";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				JobComfTO to = new JobComfTO();
				to.setJobID(rs.getInt("jobID"));
				to.setJobame(rs.getString("jobame"));
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
	
	public Page findJobComfByPage(int pagenum, int pagelen, String jobame) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from jobcomf where jobame like '%"+jobame+"%'";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				JobComfTO to = new JobComfTO();
				to.setJobID(rs.getInt("jobID"));
				to.setJobame(rs.getString("jobame"));
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

	public int delete(int jobID) {
		String sql = "delete from jobcomf where jobID='" + jobID + "'";
		return this.executeUpdate(sql);
	}

	public int insert(JobComfTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into jobcomf(jobID,jobame) values('");

		sb.append(to.getJobID());
		sb.append("','");
		sb.append(to.getJobame());
		sb.append("');");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int update(JobComfTO to) {
		StringBuffer sb = new StringBuffer("update jobcomf set jobID='");

		sb.append(to.getJobID());
		sb.append("',jobame='");
		sb.append(to.getJobame());
		sb.append("' where jobID='" + to.getJobID() + "';");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}



}
