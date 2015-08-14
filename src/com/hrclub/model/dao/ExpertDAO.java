package com.hrclub.model.dao;

import com.hrclub.to.*;
import com.hrclub.model.*;
import java.util.*;
import java.sql.*;

public class ExpertDAO extends DAOObject {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.hrclub.util.Logger.appender);

	public ExpertDAO() {
		super();
	}

	public boolean isExpertExist(String expertID) {
		Statement stmt = null;
		ResultSet rs = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from experts where expertID='" + expertID
					+ "'";
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

	public float getValueRate(String expertid) {
		Statement stmt = null;
		ResultSet rs = null;
		float valuerate = UserManager.DEFAULT_VALUE_RATE;
		try {

			stmt = conn.createStatement();
			String sql = "select valuerate from expertlevel where expertID='"
					+ expertid + "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				valuerate = rs.getFloat(1);
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
		return valuerate;
	}

	public ExpertTO findExpertByID(String expertid) {
		Statement stmt = null;
		ResultSet rs = null;
		ExpertTO to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from experts where expertID='" + expertid
					+ "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new ExpertTO();
				to.setExpertid(expertid);
				to.setExpertname(rs.getString("name"));
				to.setType(rs.getInt("type"));
				to.setFace(rs.getString("face"));
				to.setIndustryID(rs.getInt("industryID"));
				to.setPassword(rs.getString("password"));
				to.setProv(rs.getString("prov"));
				to.setCity(rs.getString("city"));
				to.setStatus(rs.getInt("status"));
				to.setOpenType(rs.getInt("opentype"));
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

	public ExpertLevelTO findExpertLevelByID(String expertid) {
		Statement stmt = null;
		ResultSet rs = null;
		ExpertLevelTO to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from expertlevel where expertID='"
					+ expertid + "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new ExpertLevelTO();
				to.setExpertID(expertid);
				to.setCredit(rs.getInt("credit"));
				to.setPoint(rs.getInt("point"));
				to.setLevel(rs.getInt("level"));
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
	 

	public ExpertTO findExpertDetailByID(String expertid) {
		Statement stmt = null;
		ResultSet rs = null;
		ExpertTO to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from experts where expertID='" + expertid
					+ "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new ExpertTO();
				to.setExpertid(expertid);
				to.setExpertname(rs.getString("name"));
				to.setPassword(rs.getString("password"));
				to.setType(rs.getInt("type"));
				to.setFace(rs.getString("face"));
				to.setIndustryID(rs.getInt("industryID"));
				to.setBankAccount(rs.getString("bankaccount"));
				to.setBanktype(rs.getInt("banktype"));
				to.setKeywords(rs.getString("keywords"));
				to.setResume(rs.getString("resume"));
				to.setTimetype(rs.getInt("timetype"));
				to.setIdentifyCard(rs.getString("identifycard"));
				to.setIdentifyType(rs.getInt("identifytype"));
				to.setAddress(rs.getString("address"));
				to.setPostcode(rs.getString("postcode"));
				to.setTel(rs.getString("tel"));
				to.setMobile(rs.getString("mobile"));
				to.setFax(rs.getString("fax"));
				to.setEmail(rs.getString("email"));
				to.setQqmsn(rs.getString("qqmsn"));
				to.setWorkyears(rs.getInt("workyears"));
				to.setEducation(rs.getString("education"));
				to.setHistory(rs.getString("history"));
				to.setProxyType(rs.getString("proxytype"));

				to.setProv(rs.getString("prov"));
				to.setCity(rs.getString("city"));
				to.setStatus(rs.getInt("status"));
				to.setOpenType(rs.getInt("opentype"));
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

	public String getExpertEmail(String expertid) {
		Statement stmt = null;
		ResultSet rs = null;
		String email = "";
		try {

			stmt = conn.createStatement();
			String sql = "select email from experts where expertID='"
					+ expertid + "'";
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
	public List getAllExpertEmail( ) {
		Statement stmt = null;
		ResultSet rs = null;
		List emails = new ArrayList();
		try {

			stmt = conn.createStatement();
			String sql = "select email from experts where  status=1";
					 
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

	public List findExpert(String prov, String city, int industryID,
			String keyword) {
		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer(
				"select * from experts e, expertlevel el where e.expertID=el.expertID and status=1 ");
		if (prov != null)
			sb.append(" and prov='" + prov + "' ");
		if (city != null)
			sb.append(" and city='" + city + "' ");
		 
		if (keyword != null)
			sb.append(" and keywords like '%" + keyword + "%' ");
		sb.append(" order by isvip desc,point desc,level desc");
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sb.toString());
			while (rs.next()) {
				ExpertTO to = new ExpertTO();
				to.setExpertid(rs.getString("expertID"));
				to.setExpertname(rs.getString("name"));
				to.setFace(rs.getString("face"));
				to.setType(rs.getInt("type"));
				to.setIndustryID(rs.getInt("industryID"));
				to.setProv(rs.getString("prov"));
				to.setCity(rs.getString("city"));
				to.setStatus(rs.getInt("status"));
				to.setIsvip(rs.getInt("isvip"));

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

	public Page findExpertByPage(int pagenum, int pagelen, String prov,
			String city, int industryID, String expertID, String expertName,
			int status) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer("select * from experts where 1=1 ");
		if (prov != null)
			sb.append(" and prov='" + prov + "' ");
		if (city != null)
			sb.append(" and city='" + city + "' ");
		 
		if (expertID != null)
			sb.append(" and expertID like '%" + expertID + "%'  ");
		if (expertName != null)
			sb.append(" and name like '%" + expertName + "%'  ");
		if (status != -1)
			sb.append(" and status =" + status);
		String sql = "";
		try {
			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sb.toString());
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				ExpertTO to = new ExpertTO();
				to.setExpertid(rs.getString("expertID"));
				to.setExpertname(rs.getString("name"));
				to.setFace(rs.getString("face"));
				to.setType(rs.getInt("type"));
				to.setIndustryID(rs.getInt("industryID"));
				to.setProv(rs.getString("prov"));
				to.setCity(rs.getString("city"));
				to.setStatus(rs.getInt("status"));
				// to.setIsvip(rs.getInt("isvip"));

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

	public Page findExpertByPage(int pagenum, int pagelen, String prov,
			String city, int industryID, String keyword) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer(
				"select e.*,el.level,el.point,el.isvip from experts e, expertlevel el where e.expertID=el.expertID and status=1 ");
		if (prov != null)
			sb.append(" and prov='" + prov + "' ");
		if (city != null)
			sb.append(" and city='" + city + "' ");
		 
		if (keyword != null)
			sb.append(" and (keywords like '%" + keyword + "%' or name like '%"
					+ keyword + "%') ");
		sb.append(" order by isvip desc,point desc,level desc");

		String sql = "";
		try {
			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sb.toString());
			logger.debug(sql);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				ExpertTO to = new ExpertTO();
				to.setExpertid(rs.getString("expertID"));
				to.setExpertname(rs.getString("name"));
				to.setFace(rs.getString("face"));
				to.setType(rs.getInt("type"));
				to.setKeywords(rs.getString("keywords"));
				to.setIndustryID(rs.getInt("industryID"));
				to.setProv(rs.getString("prov"));
				to.setCity(rs.getString("city"));
				to.setStatus(rs.getInt("status"));
				to.setIsvip(rs.getInt("isvip"));
				to.setLevel(rs.getInt("level"));
				to.setPoint(rs.getInt("point"));
				String resume = rs.getString("resume");
				if (resume.length() <= 31) {
					to.setResume(resume);
				} else {
					to.setResume(resume.substring(0, 30) + "...");
				}

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

	public Page findExpertByPage(int pagenum, int pagelen) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from experts";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				ExpertTO to = new ExpertTO();
				to.setExpertid(rs.getString("expertID"));
				to.setExpertname(rs.getString("name"));
				to.setFace(rs.getString("face"));
				to.setType(rs.getInt("type"));
				to.setIndustryID(rs.getInt("industryID"));
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

	public int delete(String expertid) {
		String sql = "delete from experts where expertID='" + expertid + "'";
		return this.executeUpdate(sql);
	}

	public int insert(ExpertTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into experts(expertID,opentype,name,`type`,`password`,industryID,bankaccount,banktype,keywords,`resume`,timetype,prov,city,identifycard,identifytype,address,postcode,tel,mobile,fax,email,qqmsn,workyears,education,history,proxytype,`status`,face) values('");

		sb.append(to.getExpertid());
		sb.append("',");
		sb.append(to.getOpenType());
		sb.append(",'");
		sb.append(to.getExpertname());
		sb.append("',");
		sb.append(to.getType());
		sb.append(",'");
		sb.append(to.getPassword());
		sb.append("',");
		sb.append(to.getIndustryID());
		sb.append(",'");
		sb.append(to.getBankAccount());
		sb.append("',");
		sb.append(to.getBanktype());
		sb.append(",'");
		sb.append(to.getKeywords());
		sb.append("','");
		sb.append(this.transferStr(to.getResume()));
		sb.append("',");
		sb.append(to.getTimetype());
		sb.append(",'");
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
		sb.append("',");
		sb.append(to.getWorkyears());
		sb.append(",'");
		sb.append(this.transferStr(to.getEducation()));
		sb.append("','");
		sb.append(this.transferStr(to.getHistory()));
		sb.append("','");
		sb.append(this.transferStr(to.getProxyType()));
		sb.append("',");
		sb.append(to.getStatus());
		sb.append(",'");
		sb.append(to.getFace());
		sb.append("')");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int updateSimple(ExpertTO to) {
		StringBuffer sb = new StringBuffer("update experts set name='");

		sb.append(to.getExpertname());
		sb.append("',type=");
		sb.append(to.getType());
		sb.append(",opentype=");
		sb.append(to.getOpenType());
		sb.append(",bankaccount='");
		sb.append(to.getBankAccount());
		sb.append("',banktype=");
		sb.append(to.getBanktype());
		sb.append(",timetype=");
		sb.append(to.getTimetype());
		sb.append(",prov='");
		sb.append(to.getProv());
		sb.append("',city='");
		sb.append(to.getCity());
		sb.append("',address='");
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
		sb.append("',workyears=");
		sb.append(to.getWorkyears());
		sb.append(",keywords='");
		sb.append(to.getKeywords());

		sb.append("' where expertID='" + to.getExpertid() + "'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int updateFlexible(ExpertTO to) {
		StringBuffer sb = new StringBuffer("update experts set industryID=");

		sb.append(to.getIndustryID());
		sb.append(",resume='");
		sb.append(this.transferStr(to.getResume()));
		sb.append("',identifycard='");
		sb.append(to.getIdentifyCard());
		sb.append("',identifytype=");
		sb.append(to.getIdentifyType());
		sb.append(",education='");
		sb.append(this.transferStr(to.getEducation()));
		sb.append("',history='");
		sb.append(this.transferStr(to.getHistory()));
		sb.append("',proxytype='");
		sb.append(this.transferStr(to.getProxyType()));

		sb.append("' where expertID='" + to.getExpertid() + "'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public Page findExpertModifyByPage(int pagenum, int pagelen) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from expertmod";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				ExpertTO to = new ExpertTO();
				to.setExpertid(rs.getString("expertID"));
				to.setIndustryID(rs.getInt("industryID"));
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

	public ExpertTO findExpertModifyByID(String expertID) {
		Statement stmt = null;
		ResultSet rs = null;
		ExpertTO to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from expertmod where expertID='" + expertID
					+ "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new ExpertTO();
				to.setExpertid(expertID);
				to.setResume(rs.getString("resume"));
				to.setIdentifyType(rs.getInt("identifytype"));
				to.setIdentifyCard(rs.getString("identifycard"));
				to.setIndustryID(rs.getInt("industryID"));
				to.setEducation(rs.getString("education"));
				to.setHistory(rs.getString("history"));
				to.setProxyType(rs.getString("proxytype"));
				to.setStatus(rs.getInt("status"));
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

	public int insertExpertModify(ExpertTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into expertmod(expertid, industryID,resume, identifycard,identifytype, education,history,proxytype,`status`) values('");

		sb.append(to.getExpertid());
		sb.append("',");
		sb.append(to.getIndustryID());
		sb.append(",'");
		sb.append(this.transferStr(to.getResume()));
		sb.append("','");

		sb.append(to.getIdentifyCard());
		sb.append("',");
		sb.append(to.getIdentifyType());
		sb.append(",'");

		sb.append(this.transferStr(to.getEducation()));
		sb.append("','");
		sb.append(this.transferStr(to.getHistory()));
		sb.append("','");
		sb.append(this.transferStr(to.getProxyType()));
		sb.append("',");
		sb.append(to.getStatus());
		sb.append(")");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int updateExpertModify(ExpertTO to) {
		StringBuffer sb = new StringBuffer("update expertmod set industryID=");

		sb.append(to.getIndustryID());
		sb.append(",resume='");
		sb.append(this.transferStr(to.getResume()));
		sb.append("',identifycard='");
		sb.append(to.getIdentifyCard());
		sb.append("',identifytype=");
		sb.append(to.getIdentifyType());
		sb.append(",education='");
		sb.append(this.transferStr(to.getEducation()));
		sb.append("',history='");
		sb.append(this.transferStr(to.getHistory()));
		sb.append("',proxytype='");
		sb.append(this.transferStr(to.getProxyType()));

		sb.append("' where expertID='" + to.getExpertid() + "'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int updateExpertModifyStatus(ExpertTO to) {
		StringBuffer sb = new StringBuffer("update expertmod set status=");
		sb.append(to.getStatus());
		sb.append(" where expertID='" + to.getExpertid() + "'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int deleteExpertModify(String expertID) {
		String sql = "delete from expertmod where expertID='" + expertID + "'";
		return this.executeUpdate(sql);

	}

	public int updateStatus(String expertid, int status) {
		StringBuffer sb = new StringBuffer("update experts set status=");

		sb.append(status);
		sb.append(" where expertID='" + expertid + "'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int updateFace(String expertid, String face) {
		StringBuffer sb = new StringBuffer("update experts set face='");

		sb.append(face);
		sb.append("' where expertID='" + expertid + "'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public String getExpertPassword(String expertID) {

		Statement stmt = null;
		ResultSet rs = null;
		String pw = null;
		try {

			stmt = conn.createStatement();
			String sql = "select password from experts where expertID='"
					+ expertID + "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				pw = rs.getString(1);
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

	public String getExpertImage(String expertID) {

		Statement stmt = null;
		ResultSet rs = null;
		String face = null;
		try {

			stmt = conn.createStatement();
			String sql = "select face from experts where expertID='" + expertID
					+ "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				face = rs.getString(1);
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
		return face;
	}

	public int updatePassword(String expertid, String password) {
		StringBuffer sb = new StringBuffer("update experts set password='");

		sb.append(password);
		sb.append("' where expertID='" + expertid + "'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int insertExpertLevel(ExpertLevelTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into expertlevel(expertID,point,`level`,credit,isvip,valuerate) values('");

		sb.append(to.getExpertID());
		sb.append("',");
		sb.append(to.getPoint());
		sb.append(",");
		sb.append(to.getLevel());
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

	public int increaseExpertPoint(String expertID, int addpoint) {
		StringBuffer sb = new StringBuffer(
				"update expertlevel set point=point+");

		sb.append(addpoint);
		sb.append(" where expertID='" + expertID + "'");
		logger.debug(sb.toString());

		int c = this.executeUpdate(sb.toString());
		return c;
	}

	public int updateExpertLevel(ExpertLevelTO to) {
		StringBuffer sb = new StringBuffer("update expertlevel set point=");

		sb.append(to.getPoint());
		sb.append(",level=");
		sb.append(to.getLevel());
		sb.append(",credit=");
		sb.append(to.getCredit());
		sb.append(",isvip=");
		sb.append(to.getIsvip());
		sb.append(",valuerate=");
		sb.append(to.getValueRate());

		sb.append(" where expertID='" + to.getExpertID() + "'");
		logger.debug(sb.toString());

		int c = this.executeUpdate(sb.toString());
		if (c == 0) {
			this.insertExpertLevel(to);
		}

		return c;
	}

	public int insertExpertVisit(ExpertVisitTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into expertvisited(expertID,times,lastvisittime) values('");

		sb.append(to.getExpertID());
		sb.append("',");
		sb.append(to.getTimes());
		sb.append(",now())");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int updateExpertVisitIncrease(String expertID) {
		StringBuffer sb = new StringBuffer(
				"update expertvisited set times=times+1,lastvisittime=now() where expertID='"
						+ expertID + "'");

		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int getExpertVisitTimes(String expertID) {
		StringBuffer sb = new StringBuffer(
				"select times from expertvisited  where expertID='" + expertID
						+ "'");
		Statement stmt = null;
		ResultSet rs = null;
		int times = 0;
		try {

			stmt = conn.createStatement();

			rs = stmt.executeQuery(sb.toString());
			if (rs.next()) {
				times = rs.getInt(1);
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
		return times;
	}

	public int insertUserLogin(UserLoginTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into userlogin(userID,`type`,logintimes,lastlogintime) values('");

		sb.append(to.getUserID());
		sb.append("',1,");
		sb.append(to.getLoginTimes());
		sb.append(",now() )");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int updateUserLoginIncrease(String expertID) {
		StringBuffer sb = new StringBuffer(
				"update userlogin set logintimes=logintimes+1,lastlogintime=now() where type=1 and userID='"
						+ expertID + "'");

		logger.debug(sb.toString());
		int c = this.executeUpdate(sb.toString());
		if (c == 0) {
			UserLoginTO to = new UserLoginTO();
			to.setUserID(expertID);
			to.setLoginTimes(1);
			c = this.insertUserLogin(to);
		}
		return c;
	}
}
