package com.hrclub.model.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hrclub.model.DAOObject;
import com.hrclub.to.MovementTO;
import com.hrclub.to.Page;
import com.hrclub.to.ServerorderTO;

public class ServerorderDAO extends DAOObject {
  
		static org.apache.log4j.Logger logger = org.apache.log4j.Logger
				.getLogger(com.hrclub.util.Logger.appender);

		public ServerorderDAO() {
			super();
		}

		public ServerorderTO findOderByID(Integer oderID) { 
			Statement stmt = null;
			ResultSet rs = null;
			ServerorderTO to = null;
			try {

				stmt = conn.createStatement();
				String sql = "select * from serverorder where oderID='" + oderID + "'";
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					to = new ServerorderTO();
					to.setOderID(rs.getInt("oderID"));
					to.setHrID(rs.getString("hrID"));
					to.setKind(rs.getInt("kind"));
					to.setOrdertitle(rs.getString("ordertitle"));
					to.setOderinfo(rs.getString("oderinfo"));
					to.setStatus(rs.getInt("status"));
					to.setBuytime(new String(""+rs.getTimestamp("buytime")));
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

		public Page findOderByPage(int pagenum, int pagelen) {
			Page page = new Page();
			page.setPageNum(pagenum);
			page.setPageLength(pagelen);

			ArrayList list = new ArrayList();
			Statement stmt = null;
			ResultSet rs = null;
			String sql = "select *,(select name from hrinfo t2 where t2.hrID=t1.hrID)as name from serverorder t1";
			sql = sql +" order by buytime desc";
			try {

				stmt = conn.createStatement();
				sql = this.genMySQLPagesql(pagenum, pagelen, sql);

				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					ServerorderTO to = new ServerorderTO();
					to.setOderID(rs.getInt("oderID"));
					to.setHrID(rs.getString("hrID"));
					to.setKind(rs.getInt("kind"));
					to.setOrdertitle(rs.getString("ordertitle"));
					to.setOderinfo(rs.getString("oderinfo"));
					to.setStatus(rs.getInt("status"));
					to.setBuytime(new String(""+rs.getTimestamp("buytime")));
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
				page.setRecordNum(this.countResultSizeSimple("select * from serverorder"));
			}
			return page;
		}
		
		public Page findOderByPage(int pagenum, int pagelen, String hrID, String kind, String status) {
			Page page = new Page();
			page.setPageNum(pagenum);
			page.setPageLength(pagelen);

			ArrayList list = new ArrayList();
			Statement stmt = null;
			ResultSet rs = null;
			String sql = "select *,(select name from hrinfo t2 where t2.hrID=t1.hrID)as name from serverorder t1";
			if(null!=hrID) {
				sql = sql+" where hrID like '%"+hrID+"%'";
				if(null!=kind) {
					sql = sql + " and kind like '%"+kind+"%'";
					if(null!=status) 
						sql = sql + " and status like '%"+status+"%'";
				}
				else {
					if(null!=status) 
					    sql = sql + " and status like '%"+status+"%'";
				}
			}
			else {
				if(null!=kind) {
					sql = sql + " where like '%"+kind+"%'";
					if(null!=status) 
						sql = sql + " and status like '%"+status+"%'";
				}
				else {
					if(null!=status) 
					    sql = sql + " where status like '%"+status+"%'";
				}
			}
			sql = sql +" order by buytime desc";
			try {

				stmt = conn.createStatement();
				sql = this.genMySQLPagesql(pagenum, pagelen, sql);

				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					ServerorderTO to = new ServerorderTO();
					to.setOderID(rs.getInt("oderID"));
					to.setHrID(rs.getString("hrID"));
					to.setKind(rs.getInt("kind"));
					to.setOrdertitle(rs.getString("ordertitle"));
					to.setOderinfo(rs.getString("oderinfo"));
					to.setStatus(rs.getInt("status"));
					to.setBuytime(new String(""+rs.getTimestamp("buytime")));
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
				page.setRecordNum(this.countResultSizeSimple("select * from serverorder"));
			}
			return page;
		}
		
		public Page findOderByPage(int pagenum, int pagelen, String hrID) {
			Page page = new Page();
			page.setPageNum(pagenum);
			page.setPageLength(pagelen);

			ArrayList list = new ArrayList();
			Statement stmt = null;
			ResultSet rs = null;
			String sql = "select *,(select name from hrinfo t2 where t2.hrID=t1.hrID)as name from serverorder t1 where t1.hrID='"+hrID+"'";
			sql = sql +" order by buytime desc";
			try {

				stmt = conn.createStatement();
				sql = this.genMySQLPagesql(pagenum, pagelen, sql);

				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					ServerorderTO to = new ServerorderTO();
					to.setOderID(rs.getInt("oderID"));
					to.setHrID(rs.getString("hrID"));
					to.setKind(rs.getInt("kind"));
					to.setOrdertitle(rs.getString("ordertitle"));
					to.setOderinfo(rs.getString("oderinfo"));
					to.setStatus(rs.getInt("status"));
					to.setBuytime(new String(""+rs.getTimestamp("buytime")));
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
				page.setRecordNum(this.countResultSizeSimple("select * from serverorder"));
			}
			return page;
		}
		
		public int delete(Integer oderID){
			String sql = "delete from serverorder where oderID='"+oderID+"'";
			return this.executeUpdate(sql);
		}

		public int insert(ServerorderTO to) {
			StringBuffer sb = new StringBuffer(
					"insert into serverorder(hrID,kind,ordertitle,oderinfo,status,buytime) values('");
			
			sb.append(to.getHrID());
			sb.append("','");
			sb.append(to.getKind());
			sb.append("','");
			sb.append(to.getOrdertitle());
			sb.append("','");
			sb.append(to.getOderinfo());
			sb.append("','");
			sb.append(to.getStatus());
			sb.append("','");
			sb.append(to.getBuytime());
			sb.append("');");
			logger.debug(sb.toString());
			return this.executeUpdate(sb.toString());
		}
		
		public int update(ServerorderTO to) {
			StringBuffer sb = new StringBuffer(
					"update serverorder set hrID='");
			 
			sb.append(to.getHrID());
			sb.append("',kind='");
			sb.append(to.getKind());
			sb.append("',ordertitle='");
			sb.append(to.getOrdertitle());
			sb.append("',oderinfo='"); 
			sb.append(to.getOderinfo());
			sb.append("',status='");
			sb.append(to.getStatus());
			sb.append("',buytime='");
			sb.append(to.getBuytime());
			sb.append("' where oderID='"+to.getOderID()+"';");
			logger.debug(sb.toString());
			return this.executeUpdate(sb.toString());
		}
		
		
		public List findServerByputdate(int n) {
			Statement stmt = null;
			ResultSet rs = null;
		
			ArrayList list = new ArrayList();
			try {
	           int i=0;
				stmt = conn.createStatement();
				String sql = "select * from serverorder order by buytime desc";
				rs = stmt.executeQuery(sql);
				while (rs.next()&&i<n) {
					ServerorderTO to = new ServerorderTO();
				
					to.setOderID(rs.getInt("oderID"));
					to.setOrdertitle(rs.getString("ordertitle"));
					list.add(to);
					i++;
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
}