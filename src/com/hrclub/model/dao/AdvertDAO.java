package com.hrclub.model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.hrclub.model.DAOObject;
import com.hrclub.to.AdvertTO;
import com.hrclub.to.Page;

public class AdvertDAO extends DAOObject {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.hrclub.util.Logger.appender);

	public AdvertDAO() {
		super();
	}

	public int delete(int adID) {
		String sql = "delete from advertisement where adID=" + adID;
		return this.executeUpdate(sql);
	}

	public int insert(AdvertTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into advertisement(adname,adpurl,weburl,type,status) values('");
		sb.append(to.getAdname());
		sb.append("','");
		sb.append(to.getAdpurl());
		sb.append("','");
		sb.append(to.getWeburl());
		sb.append("','");
		sb.append(to.getType());
		sb.append("','");
		sb.append(to.getStatus());
		sb.append("')");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int update(AdvertTO to) {
		StringBuffer sb = new StringBuffer("update advertisement set adname='");
		sb.append(to.getAdname());
		sb.append("',adpurl='");
		sb.append(to.getAdpurl());
		sb.append("',weburl='");
		sb.append(to.getWeburl());
		sb.append("',type='");
		sb.append(to.getType());
		sb.append("',status='");
		sb.append(to.getStatus());
	
		sb.append("' where adID=" + to.getAdID());
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	
	public AdvertTO findAdvertByID(int adID) {
		Statement stmt = null;
		ResultSet rs = null;
		AdvertTO to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from advertisement where adID=" + adID;
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new AdvertTO();
				to.setAdID(adID);
				to.setAdname(rs.getString("adname"));
				to.setAdpurl(rs.getString("adpurl"));
				to.setWeburl(rs.getString("weburl"));
				to.setType(rs.getInt("type"));
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
	
	public Page findAdvertByPage(int pagenum, int pagelen) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from advertisement";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				AdvertTO to = new AdvertTO();
				to.setAdID(Integer.parseInt(rs.getString("adID")));
				to.setAdname(rs.getString("adname"));
				to.setAdpurl(rs.getString("adpurl"));
				to.setWeburl(rs.getString("weburl"));
				to.setType(rs.getInt("type"));
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
	
	public Page findAdvertByPage(int pagenum, int pagelen, String adname, String status) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from advertisement";
		if(null!=adname) {
			sql = sql+" where adname like '%"+adname+"%'";
			if(null!=status) {
				sql = sql+" and status like '%"+status+"%'";
			}
		}
		else {
			if(null!=status)
				sql = sql+" where status like '%"+status+"%'";
		}
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				AdvertTO to = new AdvertTO();
				to.setAdID(Integer.parseInt(rs.getString("adID")));
				to.setAdname(rs.getString("adname"));
				to.setAdpurl(rs.getString("adpurl"));
				to.setWeburl(rs.getString("weburl"));
				to.setType(rs.getInt("type"));
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
}
