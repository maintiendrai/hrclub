package com.hrclub.model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hrclub.model.DAOObject;
import com.hrclub.to.MovementTO;
import com.hrclub.to.Page;

public class MovementDAO extends DAOObject {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.hrclub.util.Logger.appender);

	public MovementDAO() {
		super();
	}

	public MovementTO findMovementByID(Integer moveID) {
		Statement stmt = null;
		ResultSet rs = null;
		MovementTO to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from movement where moveID='" + moveID + "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new MovementTO();
				to.setMoveID(rs.getInt("moveID"));
				to.setIntegral(rs.getInt("integral"));
				to.setSubject(rs.getString("subject"));
				to.setContext(rs.getString("context"));
				to.setStatus(rs.getInt("status"));
				to.setPuttime(rs.getTimestamp("puttime").toString());
				to.setStarttime(rs.getDate("starttime").toString());
				to.setEndtime(rs.getDate("endtime").toString());

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

	public Page findMoveByPage(int pagenum, int pagelen) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from movement";
		sql = sql +" order by puttime desc";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				MovementTO to = new MovementTO();
				to = new MovementTO();
				to.setMoveID(rs.getInt("moveID"));
				to.setIntegral(rs.getInt("integral"));
				to.setSubject(rs.getString("subject"));
				to.setContext(rs.getString("context"));
				to.setStatus(rs.getInt("status"));
				to.setPuttime(rs.getTimestamp("puttime").toString());//
				to.setStarttime(rs.getDate("starttime").toString());
				to.setEndtime(rs.getDate("endtime").toString());
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
	
	public Page findMoveByPage2(int pagenum, int pagelen) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from movement where status<2";
		sql = sql +" order by puttime desc";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				MovementTO to = new MovementTO();
				to = new MovementTO();
				to.setMoveID(rs.getInt("moveID"));
				to.setIntegral(rs.getInt("integral"));
				to.setSubject(rs.getString("subject"));
				to.setContext(rs.getString("context"));
				to.setStatus(rs.getInt("status"));
				to.setPuttime(rs.getTimestamp("puttime").toString());//
				to.setStarttime(rs.getDate("starttime").toString());
				to.setEndtime(rs.getDate("endtime").toString());
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
	
	public Page findMoveByPage(int pagenum, int pagelen, String puttime, String status) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from movement";
		if(null!=puttime) {
			sql = sql+" where puttime like '%"+puttime+"%'";
			if(null!=status)
				sql = sql+" and status like '%"+status+"%'";
		}
		else {
			if(null!=status)
				sql = sql+" where status '%"+status+"%'";
		}
		sql = sql +" order by puttime desc";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				MovementTO to = new MovementTO();
				to = new MovementTO();
				to.setMoveID(rs.getInt("moveID"));
				to.setIntegral(rs.getInt("integral"));
				to.setSubject(rs.getString("subject"));
				to.setContext(rs.getString("context"));
				to.setStatus(rs.getInt("status"));
				to.setPuttime(rs.getTimestamp("puttime").toString());//
				to.setStarttime(rs.getDate("starttime").toString());
				to.setEndtime(rs.getDate("endtime").toString());
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
	

	public int delete(Integer moveID) {
		String sql = "delete from movement where moveID='" + moveID + "'";
		return this.executeUpdate(sql);
	}

	public int insert(MovementTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into movement(moveID,integral,subject,context,status,puttime,starttime,endtime) values('");

		sb.append(to.getMoveID());
		sb.append("','");
		sb.append(to.getIntegral());
		sb.append("','");
		sb.append(to.getSubject());
		sb.append("','");
		sb.append(to.getContext());
		sb.append("','");
		sb.append(to.getStatus());
		sb.append("','");
		sb.append(to.getPuttime());
		sb.append("','");
		sb.append(to.getStarttime());
		sb.append("','");
		sb.append(to.getEndtime());
		sb.append("');");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int update(MovementTO to) {
		StringBuffer sb = new StringBuffer("update movement set moveID='");

		sb.append(to.getMoveID());
		sb.append("',integral='");
		sb.append(to.getIntegral());
		sb.append("',subject='");
		sb.append(to.getSubject());
		sb.append("',context='");
		sb.append(to.getContext());
		sb.append("',status='");
		sb.append(to.getStatus());
		sb.append("',puttime='");
		sb.append(to.getPuttime());
		sb.append("',starttime='");
		sb.append(to.getStarttime());
		sb.append("',endtime='");
		sb.append(to.getEndtime());
		sb.append("' where moveID='" + to.getMoveID() + "';");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	public List findMovementByputdate(int n) {
		Statement stmt = null;
		ResultSet rs = null;
	
		ArrayList list = new ArrayList();
		try {
           int i=0;
			stmt = conn.createStatement();
			String sql = "select * from movement where status<2 order by puttime desc limit 0,"+n;
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				MovementTO to = new MovementTO();
			
				to.setMoveID(rs.getInt("moveID"));
				to.setSubject(rs.getString("subject"));
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
