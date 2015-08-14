package com.hrclub.model.dao;

import com.hrclub.to.*;

import java.util.*;
import java.sql.*;

import com.hrclub.model.DAOObject;

public class IntegralDAO extends DAOObject {

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.hrclub.util.Logger.appender);

	public IntegralDAO() {
		super();
	}

	public IntegralTO findHrByID(String hrID) {
		Statement stmt = null;
		ResultSet rs = null;
		IntegralTO to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from integral where hrID='" + hrID + "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new IntegralTO();
				to.setHrID(rs.getString("hrID"));
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

	public Page findHrByPage(int pagenum, int pagelen) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select *,(select name from hrinfo t2 where t2.hrID=t1.hrID)as name from integral t1";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				IntegralTO to = new IntegralTO();
				to.setHrID(rs.getString("hrID"));
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
			page.setRecordNum(this.countResultSizeSimple("select * from integral"));
		}
		return page;
	}
	
	public Page findHrByPage(int pagenum, int pagelen, String hrID) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select *,(select name from hrinfo t2 where t2.hrID=t1.hrID)as name from integral t1";
		if(null!=hrID)
			sql = sql+" where hrID like '%"+hrID+"%'";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				IntegralTO to = new IntegralTO();
				to.setHrID(rs.getString("hrID"));
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
			page.setRecordNum(this.countResultSizeSimple("select * from integral"));
		}
		return page;
	}

	public int delete(String hrID) {
		String sql = "delete from integral where hrID='" + hrID + "'";
		return this.executeUpdate(sql);
	}

	public int insert(IntegralTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into integral(hrID,num) values('");

		sb.append(to.getHrID());
		sb.append("',");
		sb.append(to.getNum());
		sb.append(");");
		logger.debug(sb.toString());
		System.out.print("Successfully Insert!");
		System.out.print(sb);
		return this.executeUpdate(sb.toString());
	}

	public int update(IntegralTO to) {
		StringBuffer sb = new StringBuffer("update integral set hrID='");

		sb.append(to.getHrID());
		sb.append("',num=");
		sb.append(to.getNum());
		sb.append(" where hrID='" + to.getHrID() + "';");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int increase(String ID, int role, int mun) { // role=1 为HR role=2为IT人才
															
		Statement stmt = null;
		ResultSet rs = null;
		IntegralTO to = null;
		int flag = 0;
		try {
			if (role == 1) {
				stmt = conn.createStatement();
				String sql = "select * from integral where hrID='" + ID + "'";
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					to = new IntegralTO();
					to.setHrID(rs.getString("hrID"));
					to.setNum(rs.getInt("num"));
				}
				StringBuffer sb = new StringBuffer("update integral set hrID='");
                int newnum = to.getNum()+mun;
				sb.append(ID);
				sb.append("',num=");
				sb.append(newnum);
				sb.append(" where hrID='" + ID + "';");
				flag=this.executeUpdate(sb.toString());
			}
			if (role == 2) {
				stmt = conn.createStatement();
				String sql = "select * from integral where hrID='" + ID + "'";
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					to = new IntegralTO();
					to.setHrID(rs.getString("hrID"));
					to.setNum(rs.getInt("num"));
				}
				StringBuffer sb = new StringBuffer("update integral set hrID='");
                int newnum = to.getNum()+mun;
				sb.append(ID);
				sb.append("',num=");
				sb.append(newnum);
				sb.append(" where hrID='" + ID + "';");
				flag=this.executeUpdate(sb.toString());
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

		return flag;
	}
	
	public int reduce(String ID, int role, int mun) { // role=1 为HR role=2为IT人才
		
		Statement stmt = null;
		ResultSet rs = null;
		IntegralTO to = null;
		int flag = 0;
		try {
			if (role == 1) {
				stmt = conn.createStatement();
				String sql = "select * from integral where hrID='" + ID + "'";
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					to = new IntegralTO();
					to.setHrID(rs.getString("hrID"));
					to.setNum(rs.getInt("num"));
				}
				if(to.getNum()>=mun){  	
			    	StringBuffer sb = new StringBuffer("update integral set hrID='");
			    	int newnum = to.getNum()-mun;
			    	sb.append(ID);
			    	sb.append("',num=");
			    	sb.append(newnum);
			    	sb.append(" where hrID='" + ID + "';");
				    flag = this.executeUpdate(sb.toString());
				}
				else {
					flag = 0;
				}
			}
			if (role == 2) {
				stmt = conn.createStatement();
				String sql = "select * from integral where hrID='" + ID + "'";
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					to = new IntegralTO();
					to.setHrID(rs.getString("hrID"));
					to.setNum(rs.getInt("num"));
				}
				if(to.getNum()>=mun){  	
			    	StringBuffer sb = new StringBuffer("update integral set hrID='");
			    	int newnum = to.getNum()-mun;
			    	sb.append(ID);
			    	sb.append("',num=");
			    	sb.append(newnum);
			    	sb.append(" where hrID='" + ID + "';");
				    flag = this.executeUpdate(sb.toString());
				}
				else {
					flag = 0;
				}
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

		return flag;
	}

}