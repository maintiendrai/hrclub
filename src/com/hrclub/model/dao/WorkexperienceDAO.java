package com.hrclub.model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hrclub.model.DAOObject;

import com.hrclub.to.WorkexperienceTO;

public class WorkexperienceDAO extends DAOObject {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.hrclub.util.Logger.appender);

	boolean sign = false;

	
	public WorkexperienceDAO() {
		super();
	}

	public WorkexperienceTO findITworkBywordID(int workID) {
		Statement stmt = null;

		ResultSet rs = null;

		
		WorkexperienceTO to = new WorkexperienceTO();
		try {
           
			stmt = conn.createStatement();
			String sql = "select * from workexperience where workID='" + workID
					+ "'";
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
              
				to.setWorkID(workID); 
				to.setAddress(rs.getString("address"));
				to.setStarttime(rs.getDate("starttime").toString());
				to.setLevertime(rs.getDate("levertime").toString());
				to.setCompname(rs.getString("compname"));
				to.setComkind(rs.getInt("comkind"));
				to.setInfo(rs.getString("info"));
				to.setPlace(rs.getString("place"));

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

	public List findITworkByID(String userid) {
		List list = new ArrayList();
		Statement stmt = null;

		ResultSet rs = null;

		try {

			stmt = conn.createStatement();
			String sql = "select * from workexperience where userID='" + userid
					+ "'";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				WorkexperienceTO to = new WorkexperienceTO();
				to.setWorkID(rs.getInt("workID"));
				to.setUserid(userid);
				to.setAddress(rs.getString("address"));
				to.setStarttime(rs.getDate("starttime").toString());
				to.setLevertime(rs.getDate("levertime").toString());
				to.setCompname(rs.getString("compname"));
				to.setComkind(rs.getInt("comkind"));
				to.setInfo(rs.getString("info"));
				to.setPlace(rs.getString("place"));
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

	public int insert(WorkexperienceTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into workexperience(userID,address,starttime,levertime,compname,comkind,info,place) values('");

		sb.append(to.getUserid());
		sb.append("','");
		sb.append(to.getAddress());
		sb.append("','");
		sb.append(to.getStarttime());
		sb.append("','");
		sb.append(to.getLevertime());
		sb.append("','");
		sb.append(to.getCompname());
		sb.append("','");
		sb.append(to.getComkind());
		sb.append("','");
		sb.append(to.getInfo());
		sb.append("','");
		sb.append(to.getPlace());
		sb.append("')");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int update(WorkexperienceTO to) {
		StringBuffer sb = new StringBuffer("update workexperience set userID='");

		sb.append(to.getUserid());
		sb.append("',address='");
		sb.append(to.getAddress());
		sb.append("',starttime='");
		sb.append(to.getStarttime());
		sb.append("',levertime='");
		sb.append(to.getLevertime());
		sb.append("',compname='");
		sb.append(to.getCompname());
		sb.append("',comkind='");
		sb.append(to.getComkind());
		sb.append("',info='");
		sb.append(to.getInfo());
		sb.append("',place='");
		sb.append(to.getPlace());
		sb.append("' where workID='" + to.getWorkID() + "'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int delete(int workID) {
		String sql = "delete from workexperience where workID='" + workID + "'";
		return this.executeUpdate(sql);
	}

}
