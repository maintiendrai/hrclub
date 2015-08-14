package com.hrclub.model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hrclub.model.DAOObject;
import com.hrclub.to.HRinfoTO;

import com.hrclub.to.Page;

public class HRinfoDAO extends DAOObject {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.hrclub.util.Logger.appender);



	public HRinfoDAO() {
		super();
	}

	public String getHRPassword(String hrID) {
		Statement stmt = null;

		ResultSet rs = null;

		String pw = null;
		try {

			stmt = conn.createStatement();
			String sql = "select password from hrinfo where hrID='"
					+ hrID + "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				pw = rs.getString(1);
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
		return pw;
	}

	public HRinfoTO findHRByID(String hrID) {
		Statement stmt = null;
		ResultSet rs = null;
		HRinfoTO to = null;
		try {
			
			stmt = conn.createStatement();
			String sql = "select * from hrinfo where hrID='" + hrID
					+ "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new HRinfoTO();

				to.setName(rs.getString("name"));
				to.setProvince(rs.getString("province"));
				to.setCity(rs.getString("city"));
				to.setCalling(rs.getInt("calling"));
				to.setTelephone(rs.getString("telephone"));
				to.setMobilephone(rs.getString("mobilephone"));
				to.setEmail(rs.getString("email"));
				
				to.setAddress(rs.getString("address"));
				to.setCorporation(rs.getString("corporation"));
				to.setCorpkind(rs.getInt("corpkind"));
				to.setCorinfo(rs.getString("corinfo"));			
				to.setWebsite(rs.getString("website"));
				to.setBorn(rs.getString("born"));
				to.setSex(rs.getInt("sex"));
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

	public boolean isHRExist(String hrID) {
		Statement stmt = null;
		ResultSet rs = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from hrinfo where (status=0 or status=1) and hrID='" + hrID
					+ "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				return true;
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
		return false;
	}

	public Page findHRByPage(int pagenum, int pagelen) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from hrinfo";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				HRinfoTO to = new HRinfoTO();
				to.setHrID(rs.getString("hrID"));
				to.setName(rs.getString("name"));
				to.setProvince(rs.getString("province"));
				to.setCity(rs.getString("city"));
				to.setCalling(rs.getInt("calling"));
				to.setTelephone(rs.getString("telephone"));
				to.setMobilephone(rs.getString("mobilephone"));
				to.setEmail(rs.getString("email"));
				
				to.setAddress(rs.getString("address"));
				to.setCorporation(rs.getString("corporation"));
				to.setCorpkind(rs.getInt("corpkind"));
				to.setCorinfo(rs.getString("corinfo"));			
				to.setWebsite(rs.getString("website"));
				to.setBorn(rs.getString("born"));
				to.setSex(rs.getInt("sex"));
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

	
	
	public Page findHRByStatus(int pagenum, int pagelen) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from hrinfo where status=0";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				HRinfoTO to = new HRinfoTO();
				to.setHrID(rs.getString("hrID"));
				to.setName(rs.getString("name"));
				to.setProvince(rs.getString("province"));
				to.setCity(rs.getString("city"));
				to.setCalling(rs.getInt("calling"));
				to.setTelephone(rs.getString("telephone"));
				to.setMobilephone(rs.getString("mobilephone"));
				to.setEmail(rs.getString("email"));
				
				to.setAddress(rs.getString("address"));
				to.setCorporation(rs.getString("corporation"));
				to.setCorpkind(rs.getInt("corpkind"));
				to.setCorinfo(rs.getString("corinfo"));			
				to.setWebsite(rs.getString("website"));
				to.setBorn(rs.getString("born"));
				to.setSex(rs.getInt("sex"));
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
	
	
	public Page findUserByPage(int pagenum, int pagelen, String userID,
			String name, int status) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from hrinfo where 1=1 ";
		if (userID != null)
			sql += " and hrID like '%" + userID + "%'";
		if (name != null)
			sql += " and name like '%" + name + "%'";
		if (status != -1)
			sql += " and status =" + status;

		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				HRinfoTO to = new HRinfoTO();
				to.setHrID(rs.getString("hrID"));
				to.setName(rs.getString("name"));
				to.setProvince(rs.getString("province"));
				to.setCity(rs.getString("city"));
				to.setCalling(rs.getInt("calling"));
				to.setTelephone(rs.getString("telephone"));
				to.setMobilephone(rs.getString("mobilephone"));
				to.setEmail(rs.getString("email"));
				
				to.setAddress(rs.getString("address"));
				to.setCorporation(rs.getString("corporation"));
				to.setCorpkind(rs.getInt("corpkind"));
				to.setCorinfo(rs.getString("corinfo"));			
				to.setWebsite(rs.getString("website"));
				to.setBorn(rs.getString("born"));
				to.setSex(rs.getInt("sex"));
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

	public int delete(String hrID) {
		String sql = "delete from hrinfo where hrID='" + hrID + "'";
		return this.executeUpdate(sql);
	}

	public int insert(HRinfoTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into hrinfo(hrID,password,name,province,city,calling,telephone," +
				"mobilephone,email,address,corporation,corpkind," +
				"corinfo,website,sex,born) values('");
		sb.append(to.getHrID());
		sb.append("','");
		sb.append(to.getPassword());
		sb.append("','");
		sb.append(to.getName());
		sb.append("','");
		sb.append(to.getProvince());
		sb.append("','");
		sb.append(to.getCity());
		sb.append("','");
		sb.append(to.getCalling());
		sb.append("','");
		sb.append(to.getTelephone());
		sb.append("','");
		sb.append(to.getMobilephone());
		sb.append("','");
		sb.append(to.getEmail());
		sb.append("','");
		sb.append(to.getAddress());
		sb.append("','");
		sb.append(to.getCorporation());
		sb.append("','");
		sb.append(to.getCorpkind());
		sb.append("','");
		sb.append(to.getCorinfo());
		sb.append("','");
		sb.append(to.getWebsite());
		sb.append("','");
		sb.append(to.getSex());
        sb.append("','");
		sb.append(to.getBorn());
		sb.append("'");
		sb.append(")");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int update(HRinfoTO to) {
		StringBuffer sb = new StringBuffer("update hrinfo set name='");

	
		
		sb.append(to.getName());
		sb.append("',province='");
		sb.append(to.getProvince());
		sb.append("',city='");
		sb.append(to.getCity());
		sb.append("',calling='");
		sb.append(to.getCalling());
		sb.append("',telephone='");
		sb.append(to.getTelephone());
		sb.append("',mobilephone='");
		sb.append(to.getMobilephone());
		sb.append("',email='");
		sb.append(to.getEmail());
		sb.append("',address='");
		sb.append(to.getAddress());
		sb.append("',corporation='");
		sb.append(to.getCorporation());

		sb.append("',corpkind='");
		sb.append(to.getCorpkind());
		sb.append("',corinfo='");
		sb.append(to.getCorinfo());
		sb.append("',website='");
		sb.append(to.getWebsite());
		sb.append("',born='");
		sb.append(to.getBorn());
		sb.append("',sex='");
		sb.append(to.getSex());

		sb.append("' where hrID='" + to.getHrID() + "'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int updatePassword(String hrID, String password) {
		StringBuffer sb = new StringBuffer("update hrinfo set password='");

		sb.append(password);
		sb.append("' where hrID='" + hrID + "'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int updateStatus(String hrID, int status) {
		StringBuffer sb = new StringBuffer("update hrinfo set status=");

		sb.append(status);
		sb.append(" where hrID='" + hrID + "'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public List getAllHREmail() {
		Statement stmt = null;
		ResultSet rs = null;
		List emails = new ArrayList();
		try {

			stmt = conn.createStatement();
			String sql = "select email from hrinfo";

			rs = stmt.executeQuery(sql);
			while (rs.next()) {

				emails.add(rs.getString("email"));

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
		return emails;
	}

	public String getHREmail(String hrID) {
		Statement stmt = null;
		ResultSet rs = null;
		String email = "";
		try {

			stmt = conn.createStatement();
			String sql = "select email from hrinfo where hrID='" + hrID
					+ "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {

				email = rs.getString("email");

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
		return email;
	}
	
	public List getAllHrID() {
		Statement stmt = null;
		ResultSet rs = null;
		List HrIds = new ArrayList();
		try {

			stmt = conn.createStatement();
			String sql = "select * from hrinfo";

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
                
				HRinfoTO to = new HRinfoTO();
				to.setHrID(rs.getString("hrID"));
				to.setName(rs.getString("name"));
				HrIds.add(to);

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
		return HrIds;
	}

}
