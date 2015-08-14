package com.hrclub.model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hrclub.model.DAOObject;
import com.hrclub.to.ProjectTO;



public class ProjectDAO extends DAOObject {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.hrclub.util.Logger.appender);

	public ProjectDAO() {
		super();
	}

	public ProjectTO findITprojectByprojectID(int projectID) {
		Statement stmt = null;

		ResultSet rs = null;

		ProjectTO to = new ProjectTO();
		try {

			stmt = conn.createStatement();
			String sql = "select * from projectinfo where projectID='"
					+ projectID + "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {

				to.setProjectID(projectID);
				to.setEndtime(rs.getDate("endtime").toString());
				to.setStarttime(rs.getDate("starttime").toString());
				to.setHardware(rs.getString("hardware"));

				to.setPlace(rs.getString("place"));
				to.setProjectinfo(rs.getString("projectinfo"));
				to.setProjectname(rs.getString("projectname"));
				to.setProjectsize(rs.getInt("projectsize"));

				to.setStarttime(rs.getDate("starttime").toString());
				to.setSoftware(rs.getString("software"));
				to.setUserid(rs.getString("userid"));

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
	public List findITprojectByuserID(String userid) {
		List list = new ArrayList();
		Statement stmt = null;

		ResultSet rs = null;

		try {

			stmt = conn.createStatement();
			String sql = "select * from projectinfo where userID='" + userid
					+ "'";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				ProjectTO to = new ProjectTO();
				to.setProjectID(rs.getInt("projectID"));;
				to.setEndtime(rs.getDate("endtime").toString());
				to.setStarttime(rs.getDate("starttime").toString());
				to.setHardware(rs.getString("hardware"));

				to.setPlace(rs.getString("place"));
				to.setProjectinfo(rs.getString("projectinfo"));
				to.setProjectname(rs.getString("projectname"));
				to.setProjectsize(rs.getInt("projectsize"));

				to.setStarttime(rs.getDate("starttime").toString());
				to.setSoftware(rs.getString("software"));
				to.setUserid(rs.getString("userid"));
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
	
	
	public int insert(ProjectTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into projectinfo(userID,endtime,starttime,hardware,place,projectinfo" +
				",projectname,projectsize,software) values('");

		sb.append(to.getUserid());
		sb.append("','");
		sb.append(to.getEndtime());
		sb.append("','");
		sb.append(to.getStarttime());
		sb.append("','");
		sb.append(to.getHardware());
		sb.append("','");
		sb.append(to.getPlace());
		sb.append("','");
		sb.append(to.getProjectinfo());
		sb.append("','");
		sb.append(to.getProjectname());
		sb.append("','");
		sb.append(to.getProjectsize());
		sb.append("','");
		sb.append(to.getSoftware());
		sb.append("')");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public int update(ProjectTO to) {
		StringBuffer sb = new StringBuffer("update projectinfo set userID='");

		sb.append(to.getUserid());
		sb.append("',projectname='");
		sb.append(to.getProjectname());
		sb.append("',starttime='");
		sb.append(to.getStarttime());
		sb.append("',endtime='");
		sb.append(to.getEndtime());
		sb.append("',hardware='");
		sb.append(to.getHardware());
		sb.append("',software='");
		sb.append(to.getSoftware());
		sb.append("',projectinfo='");
		sb.append(to.getProjectinfo());
		sb.append("',place='");
		sb.append(to.getPlace());
		sb.append("',projectsize='");
		sb.append(to.getProjectsize());
		sb.append("' where projectID='" + to.getProjectID() + "'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	public int delete(int projectID) {
		String sql = "delete from projectinfo where projectID='" + projectID + "'";
		return this.executeUpdate(sql);
	}

}
