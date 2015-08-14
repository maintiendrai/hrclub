package com.hrclub.model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import com.hrclub.model.DAOObject;
import com.hrclub.to.ITUserTO;
import com.hrclub.to.Page;


public class ITUserDAO extends DAOObject {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.hrclub.util.Logger.appender);

	boolean sign = false;

	Statement stmt = null;

	ResultSet rs = null;

	public ITUserDAO() {
		super();
	}

	
	public String getUserPassword(String userID){ 
		Statement stmt = null;

		ResultSet rs = null;
		 
		String pw=null;
		try {

			stmt = conn.createStatement();
			String sql = "select password from itbaseinfo where userID='" + userID
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
	
	public ITUserTO findUserByID(String userid) {
		Statement stmt = null;
		ResultSet rs = null;
		ITUserTO to = null;
		try {
		
			stmt = conn.createStatement();
			String sql = "select * from itbaseinfo where userID='" + userid + "'";
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				to = new ITUserTO();
				
				to.setUserid(userid);
			
				to.setName(rs.getString("name"));
				to.setAge(rs.getInt("age"));
				to.setSex(rs.getInt("sex"));
				
				to.setBorn(rs.getDate("born").toString());
				
				to.setTelephone(rs.getString("telephone"));
				to.setMobiletphone(rs.getString("mobiletphone"));
				to.setProvince(rs.getString("province"));
				to.setCity(rs.getString("city"));
				to.setAddress(rs.getString("address"));
				to.setPost(rs.getString("post"));
				to.setEmail(rs.getString("email"));
			

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

	
	public boolean isUserExist(String userid) {
		Statement stmt = null;
		ResultSet rs = null; 
		try {

			stmt = conn.createStatement();
			String sql = "select * from itbaseinfo where  status=0 and userID='" + userid + "'";
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
		String sql = "select * from itbaseinfo";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);
			
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				
				ITUserTO to = new ITUserTO();
				to.setUserid(rs.getString("userID"));
				to.setName(rs.getString("name"));
				to.setEmail(rs.getString("email"));
				to.setStatus(rs.getInt("status"));
				to.setCore(rs.getInt("core"));
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
	
	public Page findUserBycore(int pagenum, int pagelen) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from itbaseinfo where core=1";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);
			
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				
				ITUserTO to = new ITUserTO();
				to.setUserid(rs.getString("userID"));
				to.setName(rs.getString("name"));
				to.setEmail(rs.getString("email"));
				to.setStatus(rs.getInt("status"));
				to.setCore(rs.getInt("core"));
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
	
	public Page findUserByPage(int pagenum, int pagelen,String userID, String name,int status) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from itbaseinfo where 1=1 ";
		if(userID!=null) sql+=" and userID like '%"+userID+"%'";
		if(name!=null) sql+=" and name like '%"+name+"%'";
		if(status!=-1) sql+=" and status ="+status; 
		
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				ITUserTO to = new ITUserTO();
				to.setUserid(rs.getString("userID"));
				to.setName(rs.getString("name"));
				to.setPassword(rs.getString("password"));
				to.setAge(rs.getInt("age"));
				to.setAddress(rs.getString("address"));
				//to.setBorn(new SimpleDateFormat("yyyy-MM-dd").format(rs.getDate("born")));
				to.setBorn(rs.getDate("born").toString());
				to.setCity(rs.getString("city"));
				to.setEmail(rs.getString("email"));
				to.setPost(rs.getString("post"));
				to.setProvince(rs.getString("province"));
				to.setSex(rs.getInt("sex"));
				to.setStatus(rs.getInt("status"));
				
				to.setTelephone(rs.getString("telephone"));
			
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
		String sql = "delete from itbaseinfo where userID='"+userid+"'";
		return this.executeUpdate(sql);
	}
	
	public int insert(ITUserTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into itbaseinfo(userID,password,name,age,sex,born,telephone,mobiletphone,status,province,city,address,email) values('");
		// String sql = "insert into
		// users(userid,name,type,password,prov,city,identifyCard,identifyType,address,postcode,tel,mobile,fax,email,qqmsn,desc,status)
		// values('"
		sb.append(to.getUserid());
		sb.append("','");
		sb.append(to.getPassword());
		sb.append("','");
		sb.append(to.getName());
		sb.append("','");
		sb.append(to.getAge());
		sb.append("','");
		sb.append(to.getSex());
		sb.append("','");
		sb.append(to.getBorn());
		sb.append("','");
		sb.append(to.getTelephone());
		sb.append("','");
		sb.append(to.getMobiletphone());
		sb.append("','");
		sb.append(to.getStatus());
		sb.append("','");
		sb.append(to.getProvince());
		sb.append("','");
		sb.append(to.getCity());
		sb.append("','");
		sb.append(to.getAddress());
		sb.append("','");
		sb.append(to.getEmail());
		sb.append("')");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public int regedit(ITUserTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into itbaseinfo(userID,password,age,sex,email,name,province,city,address,post,telephone,mobiletphone,born) values('");

		sb.append(to.getUserid());
		sb.append("','");
		sb.append(to.getPassword());
		sb.append("','");
		sb.append(to.getAge());
		sb.append("','");
		sb.append(to.getSex());
		sb.append("','");
		sb.append(to.getEmail());
		sb.append("','");
		sb.append(to.getName());
		sb.append("','");
		sb.append(to.getProvince());
		sb.append("','");
		sb.append(to.getCity());
		sb.append("','");
		sb.append(to.getAddress());
		sb.append("','");
		sb.append(to.getPost());
		sb.append("','");
		sb.append(to.getTelephone());
		sb.append("','");
		sb.append(to.getMobiletphone());
		sb.append("','");
		sb.append(to.getBorn());
		sb.append("')");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public int update(ITUserTO to) {
		StringBuffer sb = new StringBuffer(
				"update itbaseinfo set name='");
		
		sb.append(to.getName());
		sb.append("',age='");
		sb.append(to.getAge());
		sb.append("',sex='");
		sb.append(to.getSex());
		sb.append("',born='"); 
		sb.append(to.getBorn());
		sb.append("',telephone='");
		sb.append(to.getTelephone());
		sb.append("',mobiletphone='");
		sb.append(to.getMobiletphone());
		sb.append("',province='");
		sb.append(to.getProvince());
		sb.append("',address='");
		sb.append(to.getAddress());
		sb.append("',post='");
		sb.append(to.getPost());
		sb.append("',city='");
		sb.append(to.getCity());

		sb.append("',email='");
		sb.append(to.getEmail());

		sb.append("' where userID='"+to.getUserid()+"'");
		
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public int updatePassword(String userid,String password) {
		StringBuffer sb = new StringBuffer(
				"update itbaseinfo set password='");
		 
		sb.append(password); 
		sb.append("' where userID='"+userid+"'"); 
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public int updateStatus(String userid,int status) {
		StringBuffer sb = new StringBuffer(
				"update itbaseinfo set status=");
		 
		sb.append(status); 
		sb.append(" where userID='"+userid+"'"); 
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	
	public int updateCore(String userid,int core) {
		StringBuffer sb = new StringBuffer(
				"update itbaseinfo set core=");
		 
		sb.append(core); 
		sb.append(" where userID='"+userid+"'"); 
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public List getAllUserEmail() {
		Statement stmt = null;
		ResultSet rs = null;
		List emails = new ArrayList();
		try {

			stmt = conn.createStatement();
			String sql = "select email from itbaseinfo";
					 
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
			String sql = "select email from itbaseinfo where userID='"
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

	
	
	//一下方法用来作例子调用的
	public ArrayList selectAll() {

		ArrayList list = new ArrayList();
		ITUserTO ituser = null;
		String sql = "select userid,email from itbaseinfo";
		try {
			stmt = conn.createStatement();

			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				ituser = new ITUserTO();
				ituser.setUserid(rs.getString("userid"));
				ituser.setEmail(rs.getString("email"));

				list.add(ituser);
				System.out.println("select");

			}

		} catch (SQLException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}

		return list;

	}

	
	

	public boolean addITUser(ITUserTO itUser) {

		String sql = "insert into itbaseinfo(userid,password,age,sex,email) values('"
				+ itUser.getUserid()
				+ "','"
				+ itUser.getPassword()
				+ "','"
				+ itUser.getAge()
				+ "','"
				+ itUser.getSex()
				+ "','"
				+ itUser.getEmail() + "')";
		try {
			stmt = conn.createStatement();
			if (stmt.executeUpdate(sql) == 1)
				sign = true;
		} catch (SQLException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
		return sign;
	}
	
	public int update(ITUserTO to,String userid) {
		System.out.println(userid);
		StringBuffer sb = new StringBuffer(
				"update itbaseinfo set userID='");
		sb.append(to.getUserid());
		sb.append("',password='");
		sb.append(to.getPassword());
		sb.append("',age='");
		sb.append(to.getAge());
		sb.append("',email='");
		sb.append(to.getEmail());
	
		sb.append("' where userID='"+userid+"'");
		try {
			stmt = conn.createStatement();
			
		} catch (SQLException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
		
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	public boolean delITUser(String userid) {

		String sql = "delete from itbaseinfo where userID='"+userid+"'";
				
		try {
			stmt = conn.createStatement();
			if (stmt.executeUpdate(sql) == 1)
				sign = true;
		} catch (SQLException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
		return sign;
	}
	
	public List getAllUserID() {
		Statement stmt = null;
		ResultSet rs = null;
		List userids = new ArrayList();
		try {

			stmt = conn.createStatement();
			String sql = "select * from itbaseinfo";
					 
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				
				ITUserTO to = new ITUserTO();
				to.setUserid(rs.getString("userID"));
				to.setName(rs.getString("name"));
				userids.add(to);
				
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
		return userids;
	}
	
}
