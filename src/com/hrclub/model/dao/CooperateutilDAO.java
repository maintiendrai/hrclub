package com.hrclub.model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.hrclub.model.DAOObject;
import com.hrclub.to.Page;
import com.hrclub.to.CooperateutilTO;

public class CooperateutilDAO extends DAOObject {

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.hrclub.util.Logger.appender);

	public CooperateutilDAO() {
		super();
	}

	public CooperateutilTO findUtilByID(int utilID) {
		Statement stmt = null;
		ResultSet rs = null;
		CooperateutilTO to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from cooperateutil where utilID='" + utilID
					+ "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new CooperateutilTO();
				to.setUtilID(rs.getInt("utilID"));
				to.setUtilkind(rs.getInt("utilkind"));	
				to.setUtilname(rs.getString("utilname"));				
				to.setContactname(rs.getString("contactname"));	
				to.setTelephone(rs.getString("telephone"));				
				to.setAddress(rs.getString("address"));	
				to.setEmail(rs.getString("email"));			
				to.setUtilinfo(rs.getString("utilinfo"));
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

	public Page findUtilByPage(int pagenum, int pagelen) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from cooperateutil";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				CooperateutilTO to = new CooperateutilTO();
				to.setUtilID(rs.getInt("utilID"));
				to.setUtilkind(rs.getInt("utilkind"));	
				to.setUtilname(rs.getString("utilname"));				
				to.setContactname(rs.getString("contactname"));	
				to.setTelephone(rs.getString("telephone"));				
				to.setAddress(rs.getString("address"));	
				to.setEmail(rs.getString("email"));			
				to.setUtilinfo(rs.getString("utilinfo"));
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
	
	public Page findUtilByPage(int pagenum, int pagelen, String utilname, String utilkind) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from cooperateutil";
		if(null!=utilname) {
			sql = sql+" where utilname like '%"+utilname+"%'";
			if(null!=utilkind) 
				sql = sql+" and utilkind like '%"+utilkind+"%'";
		}
		else {
			if(null!=utilkind) 
				sql = sql+" where utilkind like '%"+utilkind+"%'";
		}
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				CooperateutilTO to = new CooperateutilTO();
				to.setUtilID(rs.getInt("utilID"));
				to.setUtilkind(rs.getInt("utilkind"));	
				to.setUtilname(rs.getString("utilname"));				
				to.setContactname(rs.getString("contactname"));	
				to.setTelephone(rs.getString("telephone"));				
				to.setAddress(rs.getString("address"));	
				to.setEmail(rs.getString("email"));			
				to.setUtilinfo(rs.getString("utilinfo"));
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

	public int delete(int utilID) {
		String sql = "delete from cooperateutil where utilID='" + utilID + "'";
		return this.executeUpdate(sql);
	}

	public int insert(CooperateutilTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into cooperateutil(utilkind,utilname,contactname,telephone,address,email,utilinfo) values('");

		sb.append(to.getUtilkind());
		sb.append("','");
		sb.append(to.getUtilname());
		sb.append("','");
		sb.append(to.getContactname());
		sb.append("','");
		sb.append(to.getTelephone());
		sb.append("','");
		sb.append(to.getAddress());
		sb.append("','");
		sb.append(to.getEmail());
		sb.append("','");
		sb.append(to.getUtilinfo());
		sb.append("');");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int update(CooperateutilTO to) {
		StringBuffer sb = new StringBuffer("update cooperateutil set utilID='");

		sb.append(to.getUtilID());
		sb.append("',utilkind='");
		sb.append(to.getUtilkind());
		sb.append("',utilname='");
		sb.append(to.getUtilname());
		sb.append("',contactname='");
		sb.append(to.getContactname());
		sb.append("',telephone='");
		sb.append(to.getTelephone());
		sb.append("',address='");
		sb.append(to.getAddress());
		sb.append("',email='");
		sb.append(to.getEmail());
		sb.append("',utilinfo='");
		sb.append(to.getUtilinfo());
		sb.append("' where utilID='" + to.getUtilID() + "';");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

}
