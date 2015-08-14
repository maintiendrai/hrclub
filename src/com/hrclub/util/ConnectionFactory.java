package com.hrclub.util;

import java.util.*;
import java.sql.*;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.mchange.v2.c3p0.DataSources;

public class ConnectionFactory {
	private static ConnectionFactory conFactory = null;
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
	.getLogger(com.hrclub.util.Logger.appender);
	private static ComboPooledDataSource cpds = new ComboPooledDataSource();
	private static ComboPooledDataSource cpdsBlog = new ComboPooledDataSource();
	private static String jdbcurl;
	private static String jdbcurlBlog;
	private static String drivername;
	private static String dbuser;
	private static String dbpassword;
	private static int MIN_CONN_SIZE = 10;
	private static int MAX_CONN_SIZE = 120;

	private ConnectionFactory() {
		logger.info("ConnectionFactory constructing...");
		try {
			initialize();
		} catch (Exception e) {
			Logger.error(e.toString());
		}
		logger.info("ConnectionFactory construct end.");
	}

	public static synchronized void initialize() throws Exception {
		Properties prop = ConfigManager.getProperties();
		jdbcurl = prop.getProperty("jdbcurl");
		jdbcurlBlog = prop.getProperty("jdbcurl_blog");
		drivername = prop.getProperty("drivername");
		dbuser = prop.getProperty("dbuser");
		dbpassword = prop.getProperty("dbpassword");
		logger.info(jdbcurl);
		logger.info(jdbcurlBlog);
		logger.info(drivername);
		logger.info(dbuser);
		logger.info(dbpassword);
		
		cpds.setDriverClass(drivername);
		cpds.setJdbcUrl(jdbcurl);
		cpds.setUser(dbuser);
		cpds.setPassword(dbpassword);
		cpds.setMaxStatements(280);
		
		cpds.setIdleConnectionTestPeriod(18000);
		cpds.setMaxIdleTime(25000);
		
		cpdsBlog.setDriverClass(drivername);
		cpdsBlog.setJdbcUrl(jdbcurlBlog);
		cpdsBlog.setUser(dbuser);
		cpdsBlog.setPassword(dbpassword);
		cpdsBlog.setMaxStatements(280);
		
		cpdsBlog.setIdleConnectionTestPeriod(18000);
		cpdsBlog.setMaxIdleTime(25000);

		String strMinConnSize = prop.getProperty("min_connection");
		if (strMinConnSize != null) {
			try {
				MIN_CONN_SIZE = Integer.parseInt(strMinConnSize);
			} catch (Exception e) {
				Logger.error(e.toString());
			}
		}
		cpds.setMinPoolSize(MIN_CONN_SIZE);
		cpdsBlog.setMinPoolSize(MIN_CONN_SIZE/4);

		String strMAXConnSize = prop.getProperty("max_connection");
		if (strMAXConnSize != null) {
			try {
				MAX_CONN_SIZE = Integer.parseInt(strMAXConnSize);
			} catch (Exception e) {
				Logger.error(e.toString());
			}
		}
		cpds.setMaxPoolSize(MAX_CONN_SIZE);
		cpdsBlog.setMaxPoolSize(MAX_CONN_SIZE/2);
		
		cpds.setInitialPoolSize(MIN_CONN_SIZE);
		cpdsBlog.setInitialPoolSize(MIN_CONN_SIZE/4);
		int acquireIncrement=(MAX_CONN_SIZE-MIN_CONN_SIZE)/20;
		
		cpds.setAcquireIncrement(acquireIncrement>1?acquireIncrement:1);
		cpdsBlog.setAcquireIncrement(1);
		
		 

	}

	public static  ConnectionFactory getFactory() {

		if (conFactory == null) {
			conFactory = new ConnectionFactory();
		}
		return conFactory;
	}
	
	public void showStatus() { 
		try {
			logger.debug("ConnectionPool: Busy " + cpds.getNumBusyConnections()
				+ ", Idle " + cpds.getNumIdleConnections() + ", Total:"
				+ cpds.getNumConnections());
		}catch(SQLException e) {
			logger.error(e.toString());
		}
	}

	public Connection getConnection() throws SQLException { 
		long begin=System.currentTimeMillis();
		
		Connection conn= cpds.getConnection();
		
		logger.debug("got connection cost: "+(System.currentTimeMillis()-begin)+" ms");
 
		return conn;
	}
	
	public Connection getConnectionBlog() throws SQLException {  
		Connection conn= cpdsBlog.getConnection(); 
		return conn;
	}

	public void destroy() throws SQLException {
		logger.debug("destory  ...");
		DataSources.destroy(cpds);
		DataSources.destroy(cpdsBlog);
	}
}
