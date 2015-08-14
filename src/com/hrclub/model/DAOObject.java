package com.hrclub.model;

import java.sql.*;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Level;

import com.hrclub.util.*;

public abstract class DAOObject {
	protected Connection conn;

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.hrclub.util.Logger.appender);
	
	private long createTime=System.currentTimeMillis();

	public DAOObject() {
		init();
	}

	private void init() {
		try {
			conn = ConnectionFactory.getFactory().getConnection();
			logger.debug("DAOObject log: init : " + conn.toString());
		} catch (Exception e) {
			logger.error("DAOObject log: init error: " + e.toString());
		}

	}

	public void destroy() {
		
		try { 
			if (conn != null) {
				
				conn.close();
				logger.debug("DAOObject log: close connection("+conn.toString()+"): Total: "+(System.currentTimeMillis()-this.createTime)+" ms."  );
				 
			}else {
				logger.error("DAOObject log: conn is null." );
			}
			
		} catch (Exception e) {
			logger.error("DAOObject log: "+e.toString());
		}
	}
	
	public void setAutoCommit(boolean autoCommit) throws SQLException{
		this.conn.setAutoCommit(autoCommit);
	}
	public void commit() throws SQLException{
		this.conn.commit();
	}
	public void rollback() throws SQLException{
		this.conn.rollback();
	}

	public int getResultCount(String strSql) {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(strSql);
			if (rs.next()) {
				return rs.getInt(1);
			} else {
				return 0;
			}
		} catch (SQLException e) {
			//System.out.println(e.toString());
			logger.debug(e.toString());
		} finally {
			try {
				rs.close();
			} catch (Exception e) {
				logger.debug(e.toString());
			}
			try {
				stmt.close();
			} catch (Exception e) {
				logger.debug(e.toString());
			}

		}
		return 0;

	}

	public int max(String tableName, String columnName) {
		long begin = System.currentTimeMillis();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select max(" + columnName + ") from "
					+ tableName);
			if (rs.next()) {
				return rs.getInt(1);
			} else {
				return 0;
			}
		} catch (SQLException e) {
			//System.out.println(e.toString());
			logger.debug(e.toString());
		} finally {
			try {
				rs.close();
			} catch (Exception e) {
			}
			try {
				stmt.close();
			} catch (Exception e) {
			}
			logger.debug("Max end. Cost: "
					+ (System.currentTimeMillis() - begin) + " ms");
		}

		return 0;
	}

	public int countResultSize(String strSql) {
		long begin = System.currentTimeMillis();
		logger.debug("countResultSize : " + strSql);
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from (" + strSql + ")");
			if (rs.next()) {
				return rs.getInt(1);
			} else {
				return 0;
			}
		} catch (SQLException e) {
			//System.out.println(e.toString());
			logger.debug(e.toString());
		} finally {
			try {
				rs.close();
			} catch (Exception e) {
			}
			try {
				stmt.close();
			} catch (Exception e) {
			}
			logger.debug("Counting end. Cost: "
					+ (System.currentTimeMillis() - begin) + " ms");
		}

		return 0;

	}

	public String transferStr(String str) {
		return str.replace("'", "\\'");
	}

	public int countResultSizeSimple(String strSql) {
		long begin = System.currentTimeMillis();
		logger.debug("Counting simple: " + strSql);
		Statement stmt = null;
		ResultSet rs = null;
		
		int indexLimit=strSql.indexOf("LIMIT");
		String countSql = "select count(1) ";
		if(indexLimit>0) {
			countSql+= strSql.substring(strSql.indexOf("from"),indexLimit);
		}else {
			countSql+= strSql.substring(strSql.indexOf("from") );
		}
				

		try {
			stmt = conn.createStatement();
			logger.debug(countSql);
			rs = stmt.executeQuery(countSql);
			if (rs.next()) {
				return rs.getInt(1);
			} else {
				return 0;
			}
		} catch (SQLException e) {
			//System.out.println(e.toString());
			logger.debug(e.toString());
		} finally {
			try {
				rs.close();
			} catch (Exception e) {
			}
			try {
				stmt.close();
			} catch (Exception e) {
			}
			logger.debug("Counting simple end. Cost: "
					+ (System.currentTimeMillis() - begin) + " ms");

		}
		return 0;

	}

	protected int executeUpdate(String sql) {
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			int count = stmt.executeUpdate(sql);
			return count;
		} catch (SQLException e) {
			// System.out.println(e.toString() + "\n出错的SQL语句：" + sql);
			logger.error(e.toString() + "\n出错的SQL语句：" + sql);
		} finally {
			try {
				stmt.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
		}
		return 0;

	}

	protected ResultSet executeQuery(Statement stmt, String sql)
			throws SQLException {

		ResultSet rs = null;

		rs = stmt.executeQuery(sql);

		return rs;

	}

	protected void executeQuery(Statement stmt, ResultSet rs, String sql)
			throws SQLException {
		long begin = System.currentTimeMillis();
		rs = stmt.executeQuery(sql);
		long end =System.currentTimeMillis();
		logger.debug("SQL: "+ sql);
		logger.debug("The query id "+end+" cost "+(end-begin)+" ms.");
		//logger.getLevel().toInt()==Level.DEBUG_INT
	}

	public String genRowLimitedSql(int rownum, String strsql) {
		// 可以避免order by在rownum后执行的错误
		String pagesqlhead = "SELECT A. *, rownum r  FROM (";
		String pagesqltail = ") A WHERE rownum <= " + rownum;
		return pagesqlhead + strsql + pagesqltail;

	}

	public String genOraclePagesql(int pagenum, int pagelen, String strsql) {
		int rowstart = (pagenum - 1) * pagelen + 1;
		int rowend = rowstart + pagelen - 1;
		String pagesqlhead = "SELECT * FROM ( SELECT row_.*, rownum rownum_ FROM (";
		String pagesqltail = ") row_ WHERE rownum <= " + rowend
				+ ") WHERE rownum_ > " + (rowstart - 1);
		return pagesqlhead + strsql + pagesqltail;
	}

	public String genMySQLPagesql(int pagenum, int pagelen, String strsql) {
		int rowstart = (pagenum - 1) * pagelen;
		String sql = strsql + " LIMIT " + rowstart + "," + pagelen;
		logger.debug(sql);
		return sql;
	}

	 
	
	public static void main(String[] args) {
		String str="福大'fdsafd'fdsafds''''";
		System.out.println(str.replace("'", "\\'"));
	}

}
