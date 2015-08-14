package com.hrclub.model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.hrclub.model.DAOObject;
import com.hrclub.to.JobletterTO;
import com.hrclub.to.Page;

public class JobletterDAO extends DAOObject {

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.hrclub.util.Logger.appender);

	public JobletterDAO() {
		super();
	}

	public int insert(JobletterTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into jobletter(status,content,restore,userID,jobID,jobtitle,jobtime) values('");

		sb.append(to.getStatus());
		sb.append("','");
		sb.append(to.getContent());
		sb.append("','");
		sb.append(to.getRestore());
		sb.append("','");
		sb.append(to.getUserID());
		sb.append("','");
		sb.append(to.getJobID());
		sb.append("','");
		sb.append(to.getJobtitle());
		sb.append("',now())");
	
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public JobletterTO findJobletterByID(String letterID) {
		Statement stmt = null;
		ResultSet rs = null;
		JobletterTO to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from jobletter where letterID='" + letterID
					+ "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new JobletterTO();
				to.setContent(rs.getString("content"));
				to.setJobID(rs.getString("jobID"));
				to.setLetterID(Integer.parseInt(letterID));
				to.setRestore(rs.getString("restore"));
				to.setStatus(rs.getInt("status"));
				to.setUserID(rs.getString("userID"));
				if(rs.getTimestamp("jobtime")!=null)
					to.setJobtime(rs.getTimestamp("jobtime").toString());
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
	
	public Page findJobletterByjobID(int pagenum, int pagelen,String jobID) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from jobletter where jobID='"+jobID+"' order by jobtime desc";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				JobletterTO	to = new JobletterTO();
				to.setContent(rs.getString("content"));
			    to.setJobID(jobID);
				to.setLetterID(rs.getInt("letterID"));
				to.setRestore(rs.getString("restore"));
				to.setStatus(rs.getInt("status"));
				to.setUserID(rs.getString("userID"));
				to.setJobtime(rs.getTimestamp("jobtime").toString());
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
	
	public Page findJobletterByuserID(int pagenum, int pagelen,String userID) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from jobletter where userID='"+userID+"' order by jobtime desc";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				JobletterTO	to = new JobletterTO();
				to.setContent(rs.getString("content"));
			    to.setJobID(rs.getString("jobID"));
				to.setLetterID(rs.getInt("letterID"));
				to.setRestore(rs.getString("restore"));
				to.setStatus(rs.getInt("status"));
				to.setUserID(rs.getString("userID"));
				to.setJobtitle(rs.getString("jobtitle"));
				to.setJobtime(rs.getTimestamp("jobtime").toString());
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
	
	public int updateRestore(String letterID,String  restore) {
		StringBuffer sb = new StringBuffer(
				"update jobletter set restore='");
		 
		sb.append(restore); 
		sb.append("' where letterID='"+letterID+"'"); 
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public int updateStatus(String letterID,int status) {
		StringBuffer sb = new StringBuffer(
				"update jobletter set status=");
		 
		sb.append(status); 
		sb.append(" where letterID='"+letterID+"'"); 
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public int delete(String letterID) {
		String sql = "delete from jobletter where letterID='" + letterID
				+ "'";
		return this.executeUpdate(sql);
	}
}
