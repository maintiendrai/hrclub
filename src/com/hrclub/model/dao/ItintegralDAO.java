package com.hrclub.model.dao;

import com.hrclub.to.*;

import java.util.*;
import java.sql.*;

import com.hrclub.model.DAOObject;

public class ItintegralDAO extends DAOObject {

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.hrclub.util.Logger.appender);

	public ItintegralDAO() {
		super();
	}

	public ItintegralTO findItByID(String itID) {
		Statement stmt = null;
		ResultSet rs = null;
		ItintegralTO to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from itintegral where itID='" + itID + "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new ItintegralTO();
				to.setItID(rs.getString("itID"));
				to.setNum(rs.getInt("num"));

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

	public Page findItByPage(int pagenum, int pagelen) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select *,(select name from itbaseinfo t2 where t2.userID=t1.itID)as name from itintegral t1";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				ItintegralTO to = new ItintegralTO();
				to.setItID(rs.getString("itID"));
				to.setNum(rs.getInt("num"));
				to.setName(rs.getString("name"));
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
			page.setRecordNum(this.countResultSizeSimple("select * from itintegral"));
		}
		return page;
	}
	
	public Page findItByPage(int pagenum, int pagelen, String itID) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select *,(select name from itbaseinfo t2 where t2.userID=t1.itID)as name from itintegral t1";
		if(null!=itID)
			sql = sql+" where itID like '%"+itID+"%'";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				ItintegralTO to = new ItintegralTO();
				to.setItID(rs.getString("itID"));
				to.setNum(rs.getInt("num"));
				to.setName(rs.getString("name"));
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
			page.setRecordNum(this.countResultSizeSimple("select * from itintegral"));
		}
		return page;
	}

	public int delete(String itID) {
		String sql = "delete from itintegral where itID='" + itID + "'";
		return this.executeUpdate(sql);
	}

	public int insert(ItintegralTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into itintegral(itID,num) values('");

		sb.append(to.getItID());
		sb.append("',");
		sb.append(to.getNum());
		sb.append(");");
		logger.debug(sb.toString());
		System.out.print("Successfully Insert!");
		System.out.print(sb);
		return this.executeUpdate(sb.toString());
	}

	public int update(ItintegralTO to) {
		StringBuffer sb = new StringBuffer("update itintegral set itID='");

		sb.append(to.getItID());
		sb.append("',num=");
		sb.append(to.getNum());
		sb.append(" where itID='" + to.getItID() + "';");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

}