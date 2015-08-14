package com.hrclub.model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.hrclub.model.DAOObject;
import com.hrclub.to.CallingcomfTO;
import com.hrclub.to.CertificateComfTO;
import com.hrclub.to.Page;

public class CertificateComfDAO extends DAOObject {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
	.getLogger(com.hrclub.util.Logger.appender);
	public CertificateComfDAO() {
		super();
	}
	public HashMap certificateList() {
		Statement stmt = null;

		ResultSet rs = null;
		HashMap list = new HashMap();

		try {

			stmt = conn.createStatement();
			String sql = "select * from certificatecomf";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				CertificateComfTO to = new CertificateComfTO();
				list.put(rs.getInt("certificateID"), rs.getString("certificatename"));
//				to.setCertificateID(rs.getInt("certificateID"));
//				to.setCertificatename(rs.getString("certificatename"));
//				list.add(rs.getString("certificatename"));
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
	
	
	public List certList() {
		Statement stmt = null;
		ArrayList list = new ArrayList();
		ResultSet rs = null;
	

		try {

			stmt = conn.createStatement();
			String sql = "select * from certificatecomf";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				CertificateComfTO to = new CertificateComfTO();
				
			to.setCertificateID(rs.getInt("certificateID"));
			to.setCertificatename(rs.getString("certificatename"));
			to.setKind(rs.getInt("kind"));
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
		return list;
	}
	
	
	public CertificateComfTO findCertificateByID(int certificateID) {
		Statement stmt = null;
		ResultSet rs = null;
		CertificateComfTO to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from certificatecomf where certificateID='" + certificateID
					+ "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new CertificateComfTO();
				to.setCertificateID(rs.getInt("certificateID"));
				to.setCertificatename(rs.getString("certificatename"));
				to.setKind(rs.getInt("kind"));
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

	public Page findCertificateByPage(int pagenum, int pagelen) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from certificatecomf";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				CertificateComfTO to = new CertificateComfTO();
				to.setCertificateID(rs.getInt("certificateID"));
				to.setCertificatename(rs.getString("certificatename"));
				to.setKind(rs.getInt("kind"));
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
	
	
	public List findCertificateBykind(int kind) {
		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		CertificateComfTO to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from certificatecomf where kind='" + kind
					+ "'";
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				to = new CertificateComfTO();
				to.setCertificateID(rs.getInt("certificateID"));
				to.setCertificatename(rs.getString("certificatename"));
				to.setKind(rs.getInt("kind"));
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
		return list;
	}


	public Page findCertificateByPage(int pagenum, int pagelen, String certificatename) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from certificatecomf where certificatename like '%"+certificatename+"%'";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				CertificateComfTO to = new CertificateComfTO();
				to.setCertificateID(rs.getInt("certificateID"));
				to.setCertificatename(rs.getString("certificatename"));
				to.setKind(rs.getInt("kind"));
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

	public int delete(int certificateID) {
		String sql = "delete from certificatecomf where certificateID='" + certificateID + "'";
		return this.executeUpdate(sql);
	}

	public int insert(CertificateComfTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into certificatecomf(certificateID,certificatename,kind) values('");

		sb.append(to.getCertificateID());
		sb.append("','");
		sb.append(to.getCertificatename());
		sb.append("','");
		sb.append(to.getKind());
		sb.append("');");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int update(CertificateComfTO to) {
		StringBuffer sb = new StringBuffer("update certificatecomf set certificateID='");

		sb.append(to.getCertificateID());
		sb.append("',certificatename='");
		sb.append(to.getCertificatename());
		sb.append("',kind='");
		sb.append(to.getKind());
		sb.append("' where certificateID='" + to.getCertificateID() + "';");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}



}
