package com.hrclub.model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.hrclub.model.DAOObject;
import com.hrclub.to.MailTO;
import com.hrclub.to.Page;

public class MailDAO extends DAOObject {

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.hrclub.util.Logger.appender);

	public MailDAO() {
		super();
	}

	public MailTO findMailByID(int mailID) {
		Statement stmt = null;
		ResultSet rs = null;
		MailTO to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from mail where mailID='" + mailID
					+ "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new MailTO();
				to.setMailID(rs.getInt("mailID"));
				to.setSentID(rs.getString("sentID"));
				to.setSentkind(rs.getInt("sentkind"));
				to.setRevID(rs.getString("revID"));
				to.setRevkind(rs.getInt("revkind"));
				to.setSubject(rs.getString("subject"));
				to.setContext(rs.getString("context"));
				to.setTime(rs.getTimestamp("time").toString());
				to.setStatus(rs.getInt("status"));
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
	
	public Page findMailByRevID(int pagenum, int pagelen, String revID, int revkind) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from mail where revID='" + revID
					+ "' and revkind='"+revkind+"' and status<2";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				MailTO to = new MailTO();
				to.setMailID(rs.getInt("mailID"));
				to.setSentID(rs.getString("sentID"));
				to.setSentkind(rs.getInt("sentkind"));
				to.setRevID(rs.getString("revID"));
				to.setRevkind(rs.getInt("revkind"));
				to.setSubject(rs.getString("subject"));
				to.setContext(rs.getString("context"));
				to.setTime(rs.getTimestamp("time").toString());
				to.setStatus(rs.getInt("status"));
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

	public Page findMailByPage(int pagenum, int pagelen, String revID, String revkind) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from mail ";
		if(null!=revID){
			sql = sql+"where revID like'%"+revID+"%'";
		    if(null!=revkind)
		    	sql = sql+" and revkind like'%"+revkind+"%'";		    	
		}
		else {
			if(null!=revkind)
			sql = sql+"where revkind like'%"+revkind+"%'";	
		}
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				MailTO to = new MailTO();
				to.setMailID(rs.getInt("mailID"));
				to.setSentID(rs.getString("sentID"));
				to.setSentkind(rs.getInt("sentkind"));
				to.setRevID(rs.getString("revID"));
				to.setRevkind(rs.getInt("revkind"));
				to.setSubject(rs.getString("subject"));
				to.setContext(rs.getString("context"));
				to.setTime(rs.getTimestamp("time").toString());
				to.setStatus(rs.getInt("status"));
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
	
	public Page findMailByPage(int pagenum, int pagelen) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from mail ";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				MailTO to = new MailTO();
				to.setMailID(rs.getInt("mailID"));
				to.setSentID(rs.getString("sentID"));
				to.setSentkind(rs.getInt("sentkind"));
				to.setRevID(rs.getString("revID"));
				to.setRevkind(rs.getInt("revkind"));
				to.setSubject(rs.getString("subject"));
				to.setContext(rs.getString("context"));
				to.setTime(rs.getTimestamp("time").toString());
				to.setStatus(rs.getInt("status"));
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

	public int delete(int mailID) {
		String sql = "delete from mail where mailID='" + mailID + "'";
		return this.executeUpdate(sql);
	}

	public int insert(MailTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into mail(sentID,sentkind,revID,revkind,subject,context,time,status) values('");

		sb.append(to.getSentID());
		sb.append("','");
		sb.append(to.getSentkind());
		sb.append("','");
		sb.append(to.getRevID());
		sb.append("','");
		sb.append(to.getRevkind());
		sb.append("','");
		sb.append(to.getSubject());
		sb.append("','");
		sb.append(to.getContext());
		sb.append("','");
		sb.append(to.getTime());
		sb.append("','");
		sb.append(to.getStatus());
		sb.append("');");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int update(MailTO to) {
		StringBuffer sb = new StringBuffer("update mail set mailID='");

		sb.append(to.getMailID());
		sb.append("',sentID='");
		sb.append(to.getSentID());
		sb.append("',sentkind='");
		sb.append(to.getSentkind());
		sb.append("',revID='");
		sb.append(to.getRevID());
		sb.append("',revkind='");
		sb.append(to.getRevkind());
		sb.append("',subject='");
		sb.append(to.getSubject());
		sb.append("',context='");
		sb.append(to.getContext());
		sb.append("',time='");
		sb.append(to.getTime());
		sb.append("',status='");
		sb.append(to.getStatus());
		sb.append("' where mailID='" + to.getMailID() + "';");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public int updatestatus(int mailID,int status) {
		StringBuffer sb = new StringBuffer("update mail set status='");

		sb.append(status);
		sb.append("' where mailID='" + mailID + "';");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

}
