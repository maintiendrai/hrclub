package com.hrclub.model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.hrclub.model.DAOObject;
import com.hrclub.to.CertificateTO;
public class CertificateDAO extends DAOObject {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.hrclub.util.Logger.appender);

	boolean sign = false;

	
	public CertificateDAO() {
		super();
	}

	
	public boolean isCertExist(String userid,String crertname) {
		Statement stmt = null;
		ResultSet rs = null; 
		try {

			stmt = conn.createStatement();
			String sql = "select * from certificate where userID='" + userid + "' and crertname='"+crertname+"'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			logger.debug(e.toString());
		}finally {
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
	
	
	
	public boolean isCertExisttwo(String userid,String crertname,int certificateID) {
		Statement stmt = null;
		ResultSet rs = null; 
		try {

			stmt = conn.createStatement();
			String sql = "select * from certificate where userID='" + userid + "' and crertname='"+crertname+"'"+ " and certificateID!='"+certificateID+"'";
	
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			logger.debug(e.toString());
		}finally {
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
	public CertificateTO findCertificateByID(int certificateID) {
		Statement stmt = null;

		ResultSet rs = null;

		CertificateTO to = new CertificateTO();
		try {

			stmt = conn.createStatement();
			String sql = "select * from certificate where certificateID='"
					+ certificateID + "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to.setUserid(rs.getString("userID"));
				to.setCertificateID(certificateID);
				to.setKind(rs.getInt("kind"));
				to.setCrertname(rs.getString("crertname"));
				to.setNumber(rs.getString("number"));
				to.setGrade(rs.getFloat("grade"));
				
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
	
	public List findCertificateByID(String userid) {
		List list  = new ArrayList();
		Statement stmt = null;

		ResultSet rs = null;

		try {
		
			stmt = conn.createStatement();
			String sql = "select * from certificate where userID='" + userid + "'";
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				CertificateTO to = new CertificateTO();
				to.setUserid(userid);
				to.setCertificateID(rs.getInt("certificateID"));
				to.setKind(rs.getInt("kind"));
				to.setCrertname(rs.getString("crertname"));
				to.setNumber(rs.getString("number"));
				to.setGrade(rs.getFloat("grade"));
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

	public int insert(CertificateTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into certificate(userID,kind,crertname,number,grade) values('");

		sb.append(to.getUserid());
		sb.append("','");
		sb.append(to.getKind());
		sb.append("','");
		sb.append(to.getCrertname());
		sb.append("','");
		sb.append(to.getNumber());
		sb.append("','");
		sb.append(to.getGrade());
		sb.append("')");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int update(CertificateTO to) {
		StringBuffer sb = new StringBuffer("update certificate set certificateID='");

		sb.append(to.getCertificateID());
		sb.append("',userID='");
		sb.append(to.getUserid());
		sb.append("',kind=");
		sb.append(to.getKind());
		sb.append(",crertname='");
		sb.append(to.getCrertname());
		sb.append("',number='");
		sb.append(to.getNumber());
		sb.append("',grade='");
		sb.append(to.getGrade());
		sb.append("' where certificateID='" + to.getCertificateID() + "'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int delete(int certificateID) {
		String sql = "delete from certificate where certificateID='" + certificateID + "'";
		return this.executeUpdate(sql);
	}

}