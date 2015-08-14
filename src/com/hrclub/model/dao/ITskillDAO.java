package com.hrclub.model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hrclub.model.DAOObject;

import com.hrclub.to.ITskillTO;

public class ITskillDAO extends DAOObject {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.hrclub.util.Logger.appender);

	boolean sign = false;


	public ITskillDAO() {
		super();
	}

	public boolean isITskillExist(String userid,int skillnameID) {
		Statement stmt = null;
		ResultSet rs = null; 
		try {

			stmt = conn.createStatement();
			String sql = "select * from skill where userID='" + userid + "' and skillnameID='"+skillnameID+"'";
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
	

	public boolean isITskillExisttwo(String userid,int skillnameID,int skillID) {
		Statement stmt = null;
		ResultSet rs = null; 
		try {

			stmt = conn.createStatement();
			String sql = "select * from skill where userID='" + userid + "' and skillnameID='"+skillnameID+"'"+ " and skillID!='"+skillID+"'";
		
			rs = stmt.executeQuery(sql);
			
			int i=0;
			if(rs.next()) {
			
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
	
	public ITskillTO findITskilleByITskillID(int skillID) {
		ITskillTO to = new ITskillTO();
		Statement stmt = null;

		ResultSet rs = null;
		try {
			
			stmt = conn.createStatement();
			String sql = "select * from skill where skillID='" + skillID + "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				
				to.setSkillID(skillID);
				to.setUserid(rs.getString("userID"));
				to.setSkillnameID(rs.getInt("skillnameID"));
				to.setDegree(rs.getInt("degree"));
				to.setTime(rs.getInt("time"));

			
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

	
	public List findITskillByID(String userid) {

		Statement stmt = null;

		ResultSet rs = null;
		List list = new ArrayList();
		
		try {
		
			stmt = conn.createStatement();
			String sql = "select * from skill where userID='" + userid + "'";
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				ITskillTO to = new ITskillTO();
				to.setSkillID(rs.getInt("skillID"));
				to.setUserid(userid);
				to.setSkillnameID(rs.getInt("skillnameID"));
				to.setDegree(rs.getInt("degree"));
				to.setTime(rs.getInt("time"));
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

	public int insert(ITskillTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into skill(userID,skillnameID,degree,time) values('");

		sb.append(to.getUserid());
		sb.append("','");
		sb.append(to.getSkillnameID());
		sb.append("','");
		sb.append(to.getDegree());
		sb.append("','");
		sb.append(to.getTime());
		sb.append("')");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int update(ITskillTO to) {
		StringBuffer sb = new StringBuffer("update skill set userID='");

		sb.append(to.getUserid());
		sb.append("',skillnameID='");
		sb.append(to.getSkillnameID());
		sb.append("',degree='");
		sb.append(to.getDegree());
		sb.append("',time='");
		sb.append(to.getTime());
		sb.append("' where skillID='" + to.getSkillID() + "'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int delete(int skillID) {
		String sql = "delete from skill where skillID='" + skillID + "'";
		return this.executeUpdate(sql);
	}

}
