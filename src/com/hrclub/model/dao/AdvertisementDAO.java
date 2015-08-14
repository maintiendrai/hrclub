package com.hrclub.model.dao;

import com.hrclub.to.*;

import java.util.*;
import java.sql.*;
import com.hrclub.model.*;

public class AdvertisementDAO extends DAOObject {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.hrclub.util.Logger.appender);

	public AdvertisementDAO() {
		super();
	}

	public int delete(int adID) {
		String sql = "delete from advertisement where adID=" + adID;
		return this.executeUpdate(sql);
	}

	public int insert(AdvertisementTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into advertisement(`type`,adname,industryID,areaID,expertID,trainID,workID,adurl,clickurl,`status`) values(");
		sb.append(to.getType());
		sb.append(",'");
		sb.append(to.getAdName());
		sb.append("',");
		sb.append(to.getIndustryID());
		sb.append(",'");
		sb.append(to.getAreaID());
		sb.append("','");
		sb.append(to.getExpertID());
		sb.append("',");
		sb.append(to.getTrainID());
		sb.append(",");
		sb.append(to.getWorkID());
		sb.append(",'");
		sb.append(to.getAdurl());
		sb.append("','");
		sb.append(to.getClickurl());
		sb.append("',");
		sb.append(to.getStatus());
		sb.append(")");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int update(AdvertisementTO to) {
		StringBuffer sb = new StringBuffer("update advertisement set type=");
		sb.append(to.getType());
		sb.append(",adname='");
		sb.append(to.getAdName());
		sb.append("',industryID=");
		sb.append(to.getIndustryID());
		sb.append(",areaID='");
		sb.append(to.getAreaID());
		sb.append("',expertID='");
		sb.append(to.getExpertID());
		sb.append("',trainID=");
		sb.append(to.getTrainID());
		sb.append(",workID=");
		sb.append(to.getWorkID());
		sb.append(",adurl='");
		sb.append(to.getAdurl());
		sb.append("',clickurl='");
		sb.append(to.getClickurl());
		sb.append("',status=");
		sb.append(to.getStatus());
		sb.append(" where adID=" + to.getAdID());
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public AdvertisementTO findAdvertisementByID(int adID) {
		Statement stmt = null;
		ResultSet rs = null;
		AdvertisementTO to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from advertisement where adID=" + adID;
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new AdvertisementTO();
				to.setAdID(adID);
				to.setAdName(rs.getString("adname"));
				to.setAdurl(rs.getString("adurl"));
				to.setClickurl(rs.getString("clickurl"));
				to.setType(rs.getInt("type"));
				to.setIndustryID(rs.getInt("industryID"));
				to.setAreaID(rs.getString("areaID"));
				to.setTrainID(rs.getInt("trainID"));
				to.setWorkID(rs.getInt("workID"));
				to.setExpertID(rs.getString("expertID"));
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

	public List getAdvertisementIndustrypage(int industryID) {
		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from advertisement where status=1 and (type="
				+ AdvertisementManager.AD_TYPE_INDUSTRY + " and industryID="
				+ industryID + ") or type=-1";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				AdvertisementTO to = new AdvertisementTO();
				to.setAdID(rs.getInt("adID"));
				to.setAdName(rs.getString("adname"));
				to.setAdurl(rs.getString("adurl"));
				to.setClickurl(rs.getString("clickurl"));
				to.setType(rs.getInt("type"));
				to.setIndustryID(rs.getInt("industryID"));
				to.setAreaID(rs.getString("areaID"));
				to.setTrainID(rs.getInt("trainID"));
				to.setWorkID(rs.getInt("workID"));
				to.setExpertID(rs.getString("expertID"));
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
		return list;
	}

	public List getAdvertisementExpertpage(String expertID) {
		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from advertisement where status=1 and  (type="
				+ AdvertisementManager.AD_TYPE_EXPERT + " and expertID='"
				+ expertID + "')  or type=-1";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				AdvertisementTO to = new AdvertisementTO();
				to.setAdID(rs.getInt("adID"));
				to.setAdName(rs.getString("adname"));
				to.setAdurl(rs.getString("adurl"));
				to.setClickurl(rs.getString("clickurl"));
				to.setType(rs.getInt("type"));
				to.setIndustryID(rs.getInt("industryID"));
				to.setAreaID(rs.getString("areaID"));
				to.setTrainID(rs.getInt("trainID"));
				to.setWorkID(rs.getInt("workID"));
				to.setExpertID(rs.getString("expertID"));
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
		return list;
	}

	public List getAdvertisementTrainpage(int trainID) {
		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from advertisement where  status=1 and (type="
				+ AdvertisementManager.AD_TYPE_TRAINING + " and trainID="
				+ trainID + ") or type=-1";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				AdvertisementTO to = new AdvertisementTO();
				to.setAdID(rs.getInt("adID"));
				to.setAdName(rs.getString("adname"));
				to.setAdurl(rs.getString("adurl"));
				to.setClickurl(rs.getString("clickurl"));
				to.setType(rs.getInt("type"));
				to.setIndustryID(rs.getInt("industryID"));
				to.setAreaID(rs.getString("areaID"));
				to.setTrainID(rs.getInt("trainID"));
				to.setWorkID(rs.getInt("workID"));
				to.setExpertID(rs.getString("expertID"));
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
		return list;
	}

	public List getAdvertisementWorkpage(int workID) {
		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from advertisement where  status=1 and (type="
				+ AdvertisementManager.AD_TYPE_WORK + " and workID=" + workID
				+ ") or type=-1";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				AdvertisementTO to = new AdvertisementTO();
				to.setAdID(rs.getInt("adID"));
				to.setAdName(rs.getString("adname"));
				to.setAdurl(rs.getString("adurl"));
				to.setClickurl(rs.getString("clickurl"));
				to.setType(rs.getInt("type"));
				to.setIndustryID(rs.getInt("industryID"));
				to.setAreaID(rs.getString("areaID"));
				to.setTrainID(rs.getInt("trainID"));
				to.setWorkID(rs.getInt("workID"));
				to.setExpertID(rs.getString("expertID"));
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
		return list;
	}

	public List getAdvertisementMainpage() {
		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from advertisement where  status=1 and type="
				+ AdvertisementManager.AD_TYPE_MAINPAGE + " or type=-1";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				AdvertisementTO to = new AdvertisementTO();
				to.setAdID(rs.getInt("adID"));
				to.setAdName(rs.getString("adname"));
				to.setAdurl(rs.getString("adurl"));
				to.setClickurl(rs.getString("clickurl"));
				to.setType(rs.getInt("type"));
				to.setIndustryID(rs.getInt("industryID"));
				to.setAreaID(rs.getString("areaID"));
				to.setTrainID(rs.getInt("trainID"));
				to.setWorkID(rs.getInt("workID"));
				to.setExpertID(rs.getString("expertID"));
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
		return list;
	}

	public Page findAdvertisementByPage(int pagenum, int pagelen) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from advertisement ";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				AdvertisementTO to = new AdvertisementTO();
				to.setAdID(rs.getInt("adID"));
				to.setAdName(rs.getString("adname"));
				to.setAdurl(rs.getString("adurl"));
				to.setClickurl(rs.getString("clickurl"));
				to.setType(rs.getInt("type"));
				to.setIndustryID(rs.getInt("industryID"));
				to.setAreaID(rs.getString("areaID"));
				to.setTrainID(rs.getInt("trainID"));
				to.setWorkID(rs.getInt("workID"));
				to.setExpertID(rs.getString("expertID"));
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

}
