package com.hrclub.model.dao;

import com.hrclub.to.*; 

import java.util.*;
import java.sql.*;

import com.hrclub.model.DAOObject;
public class UserDAO extends DAOObject {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.hrclub.util.Logger.appender);

	public UserDAO() {
		super();
	}
	public String getUserPassword(String userID){ 
		 
		Statement stmt = null;
		ResultSet rs = null;  
		String pw=null;
		try {

			stmt = conn.createStatement();
			String sql = "select password from users where userID='" + userID
					+ "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				pw=rs.getString(1);
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

	public UserTO findUserByID(String userid) {
		Statement stmt = null;
		ResultSet rs = null;
		UserTO to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from users where userID='" + userid + "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new UserTO();
				to.setUserid(userid);
				to.setUsername(rs.getString("name"));
				to.setType(rs.getInt("type"));
				to.setPassword(rs.getString("password"));
				to.setProv(rs.getString("prov"));
				to.setCity(rs.getString("city"));
				to.setStatus(rs.getInt("status"));
				to.setIdentifyCard(rs.getString("identifycard"));
				to.setIdentifyType(rs.getInt("identifytype"));
				to.setAddress(rs.getString("address"));
				to.setPostcode(rs.getString("postcode"));
				to.setTel(rs.getString("tel"));
				to.setMobile(rs.getString("mobile"));
				to.setFax(rs.getString("fax"));
				to.setEmail(rs.getString("email"));
				to.setQqmsn(rs.getString("qqmsn"));
				to.setDesc(rs.getString("desc")); 
				to.setBankAccount(rs.getString("bankaccount"));
				to.setBanktype(rs.getInt("banktype"));
				to.setOpenType(rs.getInt("opentype"));
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
		return to;
	}
	
	public boolean isUserExist(String userid) {
		Statement stmt = null;
		ResultSet rs = null; 
		try {

			stmt = conn.createStatement();
			String sql = "select * from users where userID='" + userid + "'";
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

	public Page findUserByPage(int pagenum, int pagelen) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from users";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				UserTO to = new UserTO();
				to.setUserid(rs.getString("userID"));
				to.setUsername(rs.getString("name"));
				to.setType(rs.getInt("type"));
				to.setPassword(rs.getString("password"));
				to.setProv(rs.getString("prov"));
				to.setCity(rs.getString("city"));
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
	
	public Page findUserByPage(int pagenum, int pagelen,String userID, String userName,int status) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from users where 1=1 ";
		if(userID!=null) sql+=" and userID like '%"+userID+"%'";
		if(userName!=null) sql+=" and name like '%"+userName+"%'";
		if(status!=-1) sql+=" and status ="+status; 
		
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				UserTO to = new UserTO();
				to.setUserid(rs.getString("userID"));
				to.setUsername(rs.getString("name"));
				to.setType(rs.getInt("type"));
				to.setPassword(rs.getString("password"));
				to.setProv(rs.getString("prov"));
				to.setCity(rs.getString("city"));
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
	
	public int delete(String userid){
		String sql = "delete from users where userID='"+userid+"'";
		return this.executeUpdate(sql);
	}

	public int insert(UserTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into users(userID,opentype,name,`type`,`password`,prov,city,identifycard,identifytype,address,postcode,tel,mobile,fax,email,qqmsn,`desc`,bankaccount,banktype,`status`) values('");
		// String sql = "insert into
		// users(userid,name,type,password,prov,city,identifyCard,identifyType,address,postcode,tel,mobile,fax,email,qqmsn,desc,status)
		// values('"
		sb.append(to.getUserid());
		sb.append("',");
		sb.append(to.getOpenType());
		sb.append(",'");
		sb.append(to.getUsername());
		sb.append("',");
		sb.append(to.getType());
		sb.append(",'");
		sb.append(to.getPassword());
		sb.append("','");
		sb.append(to.getProv());
		sb.append("','");
		sb.append(to.getCity());
		sb.append("','");
		sb.append(to.getIdentifyCard());
		sb.append("',");
		sb.append(to.getIdentifyType());
		sb.append(",'");
		sb.append(to.getAddress());
		sb.append("','");
		sb.append(to.getPostcode());
		sb.append("','");
		sb.append(to.getTel());
		sb.append("','");
		sb.append(to.getMobile());
		sb.append("','");
		sb.append(to.getFax());
		sb.append("','");
		sb.append(to.getEmail());
		sb.append("','");
		sb.append(to.getQqmsn());
		sb.append("','");
		sb.append(this.transferStr(to.getDesc()));
		sb.append("','");
		sb.append(to.getBankAccount());
		sb.append("',");
		sb.append(to.getBanktype());
		sb.append(",");
		sb.append(to.getStatus());
		sb.append(")");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public int update(UserTO to) {
		StringBuffer sb = new StringBuffer(
				"update users set name='");
		 
		sb.append(to.getUsername());
		sb.append("',type=");
		sb.append(to.getType());
		sb.append(",opentype=");
		sb.append(to.getOpenType());
		sb.append(",prov='"); 
		sb.append(to.getProv());
		sb.append("',city='");
		sb.append(to.getCity());
		sb.append("',identifycard='");
		sb.append(to.getIdentifyCard());
		sb.append("',identifytype=");
		sb.append(to.getIdentifyType());
		sb.append(",address='");
		sb.append(to.getAddress());
		sb.append("',postcode='");
		sb.append(to.getPostcode());
		sb.append("',tel='");
		sb.append(to.getTel());
		sb.append("',mobile='");
		sb.append(to.getMobile());
		sb.append("',fax='");
		sb.append(to.getFax());
		sb.append("',email='");
		sb.append(to.getEmail());
		sb.append("',qqmsn='");
		sb.append(to.getQqmsn());
		sb.append("',`desc`='");
		sb.append(this.transferStr(to.getDesc())); 
		sb.append("',bankaccount='");
		sb.append(to.getBankAccount());
		sb.append("',banktype=");
		sb.append(to.getBanktype());
		sb.append(" where userID='"+to.getUserid()+"'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public int updatePassword(String userid,String password) {
		StringBuffer sb = new StringBuffer(
				"update users set password='");
		 
		sb.append(password); 
		sb.append("' where userID='"+userid+"'"); 
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public int updateStatus(String userid,int status) {
		StringBuffer sb = new StringBuffer(
				"update users set status=");
		 
		sb.append(status); 
		sb.append(" where userID='"+userid+"'"); 
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public UserLevelTO findUserLevelByID(String userID) {
		Statement stmt = null;
		ResultSet rs = null;
		UserLevelTO to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from userlevel where userID='" + userID
					+ "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new UserLevelTO();
				to.setUserID(userID);
				to.setCredit(rs.getInt("credit"));
				to.setPoint(rs.getInt("point")); 
				to.setIsvip(rs.getInt("isvip"));
				to.setValueRate(rs.getFloat("valuerate")); 
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
	
	public int insertUserLevel(UserLevelTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into userlevel(userID,point,credit,isvip,valuerate) values('");

		sb.append(to.getUserID());
		sb.append("',");
		sb.append(to.getPoint());
		sb.append(","); 
		sb.append(to.getCredit());
		sb.append(",");
		sb.append(to.getIsvip());
		sb.append(",");
		sb.append(to.getValueRate()); 
		sb.append(")");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int updateUserLevel(UserLevelTO to) {
		StringBuffer sb = new StringBuffer("update userlevel set point=");

		sb.append(to.getPoint()); 
		sb.append(",credit=");
		sb.append(to.getCredit());
		sb.append(",isvip=");
		sb.append(to.getIsvip());
		sb.append(",valuerate=");
		sb.append(to.getValueRate());

		sb.append(" where userID='" + to.getUserID() + "'");
		logger.debug(sb.toString());
		
		int c= this.executeUpdate(sb.toString());
		if(c==0) {
			this.insertUserLevel(to);
		}
		
		return c;
	}
	
	public int insertUserLogin(UserLoginTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into userlogin(userID,`type`,logintimes,lastlogintime) values('");

		sb.append(to.getUserID());
		sb.append("',2,"); 
		sb.append(to.getLoginTimes());
		sb.append(",now() )");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public int updateUserLoginIncrease(String userID) {
		StringBuffer sb = new StringBuffer(
				"update userlogin set logintimes=logintimes+1,lastlogintime=now() where type=2 and userID='"
						+ userID + "'");

		logger.debug(sb.toString());
		int c= this.executeUpdate(sb.toString());
		if(c==0){
			UserLoginTO to =new UserLoginTO();
			to.setUserID(userID);
			to.setLoginTimes(1);
			c=this.insertUserLogin(to);
		}
		return c;
	} 
	
	public List getAllUserEmail( ) {
		Statement stmt = null;
		ResultSet rs = null;
		List emails = new ArrayList();
		try {

			stmt = conn.createStatement();
			String sql = "select email from users";
					 
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
	
	public String getUserEmail(String userID) {
		Statement stmt = null;
		ResultSet rs = null;
		String email = "";
		try {

			stmt = conn.createStatement();
			String sql = "select email from users where userID='"
					+ userID + "'";
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

}
