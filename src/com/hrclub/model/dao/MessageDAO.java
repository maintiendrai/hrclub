package com.hrclub.model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hrclub.model.DAOObject;
import com.hrclub.to.MessageTO;
import com.hrclub.to.MovementTO;
import com.hrclub.to.Page;

public class MessageDAO extends DAOObject {

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.hrclub.util.Logger.appender);

	public MessageDAO() {
		super();
	}

	public MessageTO findMessByID(int messageID) {
		Statement stmt = null;
		ResultSet rs = null;
		MessageTO to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from message where messageID='" + messageID
					+ "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new MessageTO();
				to.setMessageID(rs.getInt("messageID"));
				to.setSubject(rs.getString("subject"));
				to.setKind(rs.getInt("kind"));
				to.setPuttime(rs.getTimestamp("puttime").toString());
				to.setStarttime(rs.getDate("starttime").toString());
				to.setEndtime(rs.getDate("endtime").toString());
				to.setContext(rs.getString("context"));
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

	public Page findMessByPage(int pagenum, int pagelen) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from message";
		sql = sql +" order by puttime desc";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				MessageTO to = new MessageTO();
				to.setMessageID(rs.getInt("messageID"));
				to.setSubject(rs.getString("subject"));
				to.setKind(rs.getInt("kind"));
				to.setPuttime(rs.getTimestamp("puttime").toString());
				to.setStarttime(rs.getDate("starttime").toString());
				to.setEndtime(rs.getDate("endtime").toString());
				to.setContext(rs.getString("context"));
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
	
	public Page findMessByPage(int pagenum, int pagelen, int kind) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from message where kind='"+kind+"'";
		sql = sql +" order by puttime desc";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				MessageTO to = new MessageTO();
				to.setMessageID(rs.getInt("messageID"));
				to.setSubject(rs.getString("subject"));
				to.setKind(rs.getInt("kind"));
				to.setPuttime(rs.getTimestamp("puttime").toString());
				to.setStarttime(rs.getDate("starttime").toString());
				to.setEndtime(rs.getDate("endtime").toString());
				to.setContext(rs.getString("context"));
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
	
	public Page findMessByPage(int pagenum, int pagelen, String puttime, String kind) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from message";
		if(null!=puttime) {
			sql = sql+" where puttime like '%"+puttime+"%'";
			if(null!=kind)
				sql = sql+" and kind like '%"+kind+"%'";
		}
		else {
			if(null!=kind)
				sql = sql+" where kind like '%"+kind+"%'";
		}
		sql = sql +" order by puttime desc";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				MessageTO to = new MessageTO();
				to.setMessageID(rs.getInt("messageID"));
				to.setSubject(rs.getString("subject"));
				to.setKind(rs.getInt("kind"));
				to.setPuttime(rs.getTimestamp("puttime").toString());
				to.setStarttime(rs.getDate("starttime").toString());
				to.setEndtime(rs.getDate("endtime").toString());
				to.setContext(rs.getString("context"));
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

	public int delete(int messageID) {
		String sql = "delete from message where messageID='" + messageID + "'";
		return this.executeUpdate(sql);
	}

	public int insert(MessageTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into message(subject,kind,puttime,starttime,endtime,context) values('");

		sb.append(to.getSubject());
		sb.append("','");
		sb.append(to.getKind());
		sb.append("','");
		sb.append(to.getPuttime());
		sb.append("','");
		sb.append(to.getStarttime());
		sb.append("','");
		sb.append(to.getEndtime());
		sb.append("','");
		sb.append(to.getContext());
		sb.append("');");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int update(MessageTO to) {
		StringBuffer sb = new StringBuffer("update message set messageID='");

		sb.append(to.getMessageID());
		sb.append("',subject='");
		sb.append(to.getSubject());
		sb.append("',kind='");
		sb.append(to.getKind());
		sb.append("',puttime='");
		sb.append(to.getPuttime());
		sb.append("',starttime='");
		sb.append(to.getStarttime());
		sb.append("',endtime='");
		sb.append(to.getEndtime());
		sb.append("',context='");
		sb.append(to.getContext());
		sb.append("' where messageID='" + to.getMessageID() + "';");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public List findMessageByputdate(int n,String kind) {
		Statement stmt = null;
		ResultSet rs = null;
	
		ArrayList list = new ArrayList();
		try {
           int i=0;
			stmt = conn.createStatement();
			String sql = "select * from message where kind='"+kind+"' order by puttime desc";
			rs = stmt.executeQuery(sql);
			while (rs.next()&&i<n) {
				MessageTO to = new MessageTO();
			
				to.setMessageID(rs.getInt("messageID"));
				to.setSubject(rs.getString("subject"));
				to.setKind(rs.getInt("kind"));
				list.add(to);
				i++;
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
		return list;
	}
}
