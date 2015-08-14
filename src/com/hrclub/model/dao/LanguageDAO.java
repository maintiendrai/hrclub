package com.hrclub.model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hrclub.model.DAOObject;

import com.hrclub.to.LanguageTO;

public class LanguageDAO extends DAOObject {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.hrclub.util.Logger.appender);

	public LanguageDAO() {
		super();
	}

	public boolean isLangExist(String userid,int languagename) {
		Statement stmt = null;
		ResultSet rs = null; 
		try {

			stmt = conn.createStatement();
			String sql = "select * from language where userID='" + userid + "' and languagename='"+languagename+"'";
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
	public boolean isLangExisttwo(String userid,int languagename,int languageID) {
		Statement stmt = null;
		ResultSet rs = null; 
		try {

			stmt = conn.createStatement();
			String sql = "select * from language where userID='" + userid + "' and languagename='"+languagename+"'"+ " and languageID!='"+languageID+"'";
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

	public LanguageTO findLanguageBylanguageID(int languageID) {
		LanguageTO to = new LanguageTO();
		Statement stmt = null;

		ResultSet rs = null;
		try {
			
			stmt = conn.createStatement();
			String sql = "select * from language where languageID='" + languageID + "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				
				to.setLanguageID(languageID);
				to.setUserid(rs.getString("userID"));
				to.setLanguagename(rs.getInt("languagename"));
				to.setGrade(rs.getInt("grade"));

			
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

	
	public List findLanguageByID(String userid) {
		List list = new ArrayList();
		Statement stmt = null;

		ResultSet rs = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from language where userID='" + userid + "'";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				LanguageTO to = new LanguageTO();
				to.setLanguageID(rs.getInt("languageID"));
				to.setUserid(userid);
				to.setLanguagename(rs.getInt("languagename"));
				to.setGrade(rs.getInt("grade"));

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

	public int insert(LanguageTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into language(userID,languagename,grade) values('");

		sb.append(to.getUserid());
		sb.append("','");
		sb.append(to.getLanguagename());
		sb.append("','");
		sb.append(to.getGrade());
		sb.append("')");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int update(LanguageTO to) {
		StringBuffer sb = new StringBuffer("update language set userID='");

		sb.append(to.getUserid());
		sb.append("',languagename='");
		sb.append(to.getLanguagename());
		sb.append("',grade='");
		sb.append(to.getGrade());
		sb.append("' where languageID='" + to.getLanguageID() + "'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int delete(int languageID) {
		String sql = "delete from language where languageID='" + languageID
				+ "'";
		return this.executeUpdate(sql);
	}

}
