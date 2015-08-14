package com.hrclub.model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.hrclub.model.DAOObject;
import com.hrclub.to.ITUserSpecialityTO;
import com.hrclub.to.Page;
import com.hrclub.util.SqlUtil;

public class ITUserSpecialityDAO extends DAOObject {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.hrclub.util.Logger.appender);

	public ITUserSpecialityDAO() {
		super();
	}

	public boolean isUserExistSpec(String userid) {
		Statement stmt = null;
		ResultSet rs = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from itspecialityinfo where userID='"
					+ userid + "'";
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

	public int insert(ITUserSpecialityTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into itspecialityinfo(userID,specialityID,degree,educate,school,province,city,"
						+ "hortation,positiontype,selfvalue,train,namekey,workyear,kind) values('");
		// String sql = "insert into
		// users(userid,name,type,password,prov,city,identifyCard,identifyType,address,postcode,tel,mobile,fax,email,qqmsn,desc,status)
		// values('"
		sb.append(to.getUserid());
		sb.append("','");
		sb.append(to.getSpecialityID());
		sb.append("','");
		sb.append(to.getDegree());
		sb.append("','");
		sb.append(to.getEducate());
		sb.append("','");
		sb.append(to.getSchool());
		sb.append("','");
		sb.append(to.getProvince());
		sb.append("','");
		sb.append(to.getCity());
		sb.append("','");
		sb.append(to.getHortation());
		sb.append("','");
		sb.append(to.getPositiontype());
		sb.append("','");
		sb.append(to.getSelfvalue());
		sb.append("','");
		sb.append(to.getTrain());
		sb.append("','");
		sb.append(to.getNamekey());
		sb.append("','");
		sb.append(to.getWorkyear());
		sb.append("','");
		sb.append(to.getKind());
		sb.append("')");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public Page findUserBysim(int pagenum, int pagelen, String spech,
			String byjobh, String byaddressh, String finkey) {
		
		  logger.debug("start find IT....");
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select  distinct itbase.name,it.userID,it.specialityID,it.positiontype from itbaseinfo itbase,itspecialityinfo it where itbase.userID=it.userID and itbase.status=0 ";
		if(!spech.equals("no"))
		sql=SqlUtil.toSql(sql,spech,",","it.specialityID","and");
		if(!byjobh.equals("no"))
		sql=SqlUtil.toCitySql(sql,byjobh,",","it.positiontype","and");
		if(!byaddressh.equals("no"))
		sql=SqlUtil.toCitySql(sql,byaddressh,",","it.city","and");

		if (!finkey.equals(""))
			sql += "and namekey like '%" + finkey + "%'";

		System.out.println(sql);
		logger.debug(sql);
        Long finditstart=System.currentTimeMillis();
        logger.debug("start find:"+finditstart);
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				ITUserSpecialityTO to = new ITUserSpecialityTO();
				to.setUserid(rs.getString("userID"));
				to.setName(rs.getString("name"));
				to.setSpecialityID(rs.getString("specialityID"));
				to.setPositiontype(rs.getString("positiontype"));
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
		   Long finditend=System.currentTimeMillis();
		   System.out.println("findITtiem:"+(finditend-finditstart));
	       logger.debug("findIT end:"+(finditend-finditstart));
		page.setData(list);

		if (list.size() < pagelen) {
			page.setRecordNum((pagenum - 1) * pagelen + list.size());
		} else {
			page.setRecordNum(this.countResultSizeSimple(sql));
		}
		
		  logger.debug("end find IT....");
		return page;
	}
	
	
	public Page findUserByshigh(int pagenum, int pagelen, String spech,
			String byjobh, String byaddressh, String finkey,String byitskillh,
			String bykind,String degree,String crertname,String workyear,
			String bywage,String school,String languagename,String core) {
		
		  logger.debug("start find IT....");
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;

		String ssql="select  distinct itbase.name,it.userID,it.specialityID,it.positiontype from ";
		String table=" itspecialityinfo it,itbaseinfo itbase ";
		String and=" where itbase.userID=it.userID and itbase.status=0  ";
		String where="";
		if(!spech.equals("no"))
		{

		where=SqlUtil.toSql(where,spech,",","it.specialityID","and");
		}
	    if(!byjobh.equals("no")){
	
		where=SqlUtil.toSql(where,byjobh,",","it.positiontype","and");
		}
	    if(!byaddressh.equals("no")){
	    	

		where=SqlUtil.toSql(where,byaddressh,",","it.city","and");
	    }
		
		if (!finkey.equals("")){
	
			where+=  "and namekey like '%" + finkey + "%'";
			
		}
		if (!degree.equals("")&&!degree.equals("no")){
		
			where+= " and it.degree='" + degree + "'";
		}
		if (!school.equals("")){
		
			where+= " and it.school='" + school + "'";
		}
		if (!bykind.equals("")&&!bykind.equals("no"))
		{
		
			where+= " and it.kind='" + bykind + "'";
		}
		if (!workyear.equals("")&&!workyear.equals("no")){
			
			where+= " and it.workyear='" + workyear + "'";
		}
		if (!bywage.equals("")&&!bywage.equals("no"))
		{
	
			where += " and it.wage='" + bywage + "'";
		}
		if(!byitskillh.equals("no"))
		{
			
			where=SqlUtil.toSql(where,byitskillh,",","s.skillnameID","and");
			table+=",skill s";
			and+=" and it.userID=s.userID ";
		}
		
		if (!crertname.equals("")&&!crertname.equals("no"))
			{
		
			
			where += " and (ce.crertname = '" + crertname + "')";
			table+=",certificate ce";
			and+=" and it.userID=ce.userID ";
			}
		if (!languagename.equals("")&&!languagename.equals("no"))
		{
		
			where += " and (l.languagename = '" + languagename + "')";
			table+=",language l";
			and+=" and it.userID=l.userID ";
			
		}

		where += " and itbase.core='" + core + "'";
		ssql+=table+and+where;
		System.out.println(ssql);
		//System.out.println(sql);
		logger.debug(ssql);
		
		   Long finditstart=System.currentTimeMillis();
	        logger.debug("start find:"+finditstart);
		try {

			stmt = conn.createStatement();
			ssql = this.genMySQLPagesql(pagenum, pagelen, ssql);

			rs = stmt.executeQuery(ssql);
			while (rs.next()) {
				ITUserSpecialityTO to = new ITUserSpecialityTO();
				to.setUserid(rs.getString("userID"));
				to.setSpecialityID(rs.getString("specialityID"));
				to.setPositiontype(rs.getString("positiontype"));
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

		Long finditend=System.currentTimeMillis();
		   System.out.println("findITtiem:"+(finditend-finditstart));
	       logger.debug("findITend:"+(finditend-finditstart));
		page.setData(list);

		if (list.size() < pagelen) {
			page.setRecordNum((pagenum - 1) * pagelen + list.size());
		} else {
			page.setRecordNum(this.countResultSizeSimple(ssql));
		}
		logger.debug("end find IT....");
		return page;
	}
	
	

	public ITUserSpecialityTO findUserSpecialityByID(String userid) {
		Statement stmt = null;
		ResultSet rs = null;
		ITUserSpecialityTO to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from itspecialityinfo where userID='"
					+ userid + "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new ITUserSpecialityTO();
				to.setUserid(userid);
				to.setSpecialityID(rs.getString("specialityID"));

				to.setDegree(rs.getInt("degree"));
				to.setEducate(rs.getString("educate"));
				to.setSchool(rs.getString("school"));
				to.setProvince(rs.getString("province"));
				to.setCity(rs.getString("city"));
				to.setHortation(rs.getString("hortation"));
				to.setPositiontype(rs.getString("positiontype"));

				to.setWage(rs.getInt("wage"));
				to.setWorkyear(rs.getInt("workyear"));
				to.setSelfvalue(rs.getString("selfvalue"));
				to.setTrain(rs.getString("train"));
				to.setNamekey(rs.getString("namekey"));
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

	public int update(ITUserSpecialityTO to) {
		StringBuffer sb = new StringBuffer(
				"update itspecialityinfo set specialityID='");

		sb.append(to.getSpecialityID());
		sb.append("',degree='");
		sb.append(to.getDegree());
		sb.append("',educate='");
		sb.append(to.getEducate());
		sb.append("',school='");
		sb.append(to.getSchool());
		sb.append("',province='");
		sb.append(to.getProvince());
		sb.append("',city='");
		sb.append(to.getCity());
		sb.append("',wage='");
		sb.append(to.getWage());
		sb.append("',hortation='");
		sb.append(to.getHortation());
		sb.append("',positiontype='");
		sb.append(to.getPositiontype());
		sb.append("',selfvalue='");
		sb.append(to.getSelfvalue());
		sb.append("',train='");
		sb.append(to.getTrain());
		sb.append("',namekey='");
		sb.append(to.getNamekey());
		sb.append("',workyear='");
		sb.append(to.getWorkyear());
		sb.append("',kind='");
		sb.append(to.getKind());

		sb.append("' where userID='" + to.getUserid() + "'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int updateStatus(String userid, int core) {
		StringBuffer sb = new StringBuffer("update itspecialityinfo set core=");

		sb.append(core);
		sb.append(" where userID='" + userid + "'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

}
