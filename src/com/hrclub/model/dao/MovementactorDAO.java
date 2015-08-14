package com.hrclub.model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hrclub.model.DAOObject;
import com.hrclub.to.MovementactorTO;
import com.hrclub.to.Page;

public class MovementactorDAO extends DAOObject {

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.hrclub.util.Logger.appender);

	public MovementactorDAO() {
		super();
	}

	public MovementactorTO findActorByID(int maID) {
		Statement stmt = null;
		ResultSet rs = null;
		MovementactorTO to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from movementactor where maID='" + maID
					+ "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new MovementactorTO();
				to.setMaID(rs.getInt("maID"));
				to.setMoveID(rs.getInt("moveID"));
				to.setMemberID(rs.getString("memberID"));
				to.setKind(rs.getInt("kind"));
				to.setStarttime(rs.getTimestamp("starttime").toString());
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
	
	public MovementactorTO findActorByID(String moveID, String memberID, String kind) {
		Statement stmt = null;
		ResultSet rs = null;
		MovementactorTO to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from movementactor where moveID='"+moveID+"' and memberID='"+memberID+"' and kind='"+kind+"'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new MovementactorTO();
				to.setMaID(rs.getInt("maID"));
				to.setMoveID(rs.getInt("moveID"));
				to.setMemberID(rs.getString("memberID"));
				to.setKind(rs.getInt("kind"));
				to.setStarttime(rs.getTimestamp("starttime").toString());
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

	public Page findActorByPage(int pagenum, int pagelen) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select *,(select subject from movement t2 where t2.moveID=t1.moveID)as title from movementactor t1";
		sql = sql +" order by starttime desc";
		String sql2 = "select * from movementactor t1";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				MovementactorTO to = new MovementactorTO();
				to.setMaID(rs.getInt("maID"));
				to.setMoveID(rs.getInt("moveID"));
				to.setMemberID(rs.getString("memberID"));
				to.setKind(rs.getInt("kind"));
				to.setStarttime(rs.getTimestamp("starttime").toString());
				to.setStatus(rs.getInt("status"));
				to.setTitle(rs.getString("title"));
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
			page.setRecordNum(this.countResultSizeSimple(sql2));
		}
		return page;
	}
	
	public Page findActorByPage(int pagenum, int pagelen, String memberID, String kind, String status) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select *,(select subject from movement t2 where t2.moveID=t1.moveID)as title from movementactor t1";
		if(null!=memberID) {
			sql = sql+" where memberID like '%"+memberID+"%'";
			if(null!=kind) {
				sql = sql+" and kind like'%"+kind+"%'";
				if(null!=status)
					sql = sql+" and status like'%"+status+"%'";
			}
			else {
				if(null!=status)
					sql = sql+" and status like'%"+status+"%'";
			}
		}
		else {
			if(null!=kind) {
				sql = sql+" where kind like'%"+kind+"%'";
				if(null!=status)
					sql = sql+" and status like'%"+status+"%'";
			}
			else {
				if(null!=status)
					sql = sql+" where status like'%"+status+"%'";
			}
		}
		sql = sql +" order by starttime desc";
		String sql2 = "select * from movementactor t1";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				MovementactorTO to = new MovementactorTO();
				to.setMaID(rs.getInt("maID"));
				to.setMoveID(rs.getInt("moveID"));
				to.setMemberID(rs.getString("memberID"));
				to.setKind(rs.getInt("kind"));
				to.setStarttime(rs.getTimestamp("starttime").toString());
				to.setStatus(rs.getInt("status"));
				to.setTitle(rs.getString("title"));
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
			page.setRecordNum(this.countResultSizeSimple(sql2));
		}
		return page;
	}
	
	public Page findActorByMovID(int pagenum, int pagelen, int movID) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from movementactor where moveID='" + movID
					+ "'";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				MovementactorTO to = new MovementactorTO();
				to.setMaID(rs.getInt("maID"));
				to.setMoveID(rs.getInt("moveID"));
				to.setMemberID(rs.getString("memberID"));
				to.setKind(rs.getInt("kind"));
				to.setStarttime(rs.getTimestamp("starttime").toString());
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
	
	public Page findMovByUserID(int pagenum, int pagelen, String userID, String kind) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from movementactor where memberID='" + userID
					+ "' and kind='"+kind+"'";
		
		String sql2 ="select *,(select subject from movement t2 where t2.moveID=t1.moveID) as title from movementactor t1 where memberID='"+userID+"' and kind='"+kind+"'";
		sql2 = sql2 +" order by starttime desc";
		try {

			stmt = conn.createStatement();
			sql2 = this.genMySQLPagesql(pagenum, pagelen, sql2);

			rs = stmt.executeQuery(sql2);
			while (rs.next()) {
				MovementactorTO to = new MovementactorTO();
				to.setMaID(rs.getInt("maID"));
				to.setMoveID(rs.getInt("moveID"));
				to.setMemberID(rs.getString("memberID"));
				to.setKind(rs.getInt("kind"));
				to.setStarttime(rs.getTimestamp("starttime").toString());
				to.setStatus(rs.getInt("status"));
				to.setTitle(rs.getString("title"));
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
	
	public List findActorByMovID(int movID) {
		
		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from movementactor where moveID='" + movID
					+ "'";
		try {

			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				MovementactorTO to = new MovementactorTO();
				to.setMaID(rs.getInt("maID"));
				to.setMoveID(rs.getInt("moveID"));
				to.setMemberID(rs.getString("memberID"));
				to.setKind(rs.getInt("kind"));
				to.setStarttime(rs.getTimestamp("starttime").toString());
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

	public int delete(int maID) {
		String sql = "delete from movementactor where maID='" + maID + "'";
		return this.executeUpdate(sql);
	}

	public int insert(MovementactorTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into movementactor(moveID,memberID,kind,starttime,status) values('");

		sb.append(to.getMoveID());
		sb.append("','");
		sb.append(to.getMemberID());
		sb.append("','");
		sb.append(to.getKind());
		sb.append("','");
		sb.append(to.getStarttime());
		sb.append("','");
		sb.append(to.getStatus());
		sb.append("');");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int update(MovementactorTO to) {
		StringBuffer sb = new StringBuffer("update movementactor set maID='");

		sb.append(to.getMaID());
		sb.append("',moveID='");
		sb.append(to.getMoveID());
		sb.append("',memberID='");
		sb.append(to.getMemberID());
		sb.append("',kind='");
		sb.append(to.getKind());
		sb.append("',starttime='");
		sb.append(to.getStarttime());
		sb.append("',status='");
		sb.append(to.getStatus());
		sb.append("' where maID='" + to.getMaID() + "';");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public int changestatus(String maID,int status) {
		StringBuffer sb = new StringBuffer("update movementactor set status='");
		sb.append(status);
		sb.append("' where maID='" + maID + "';");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

}
