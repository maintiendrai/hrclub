package com.hrclub.model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.hrclub.model.DAOObject;
import com.hrclub.to.DocumentTO;
import com.hrclub.to.MovementactorTO;
import com.hrclub.to.Page;

public class DocumentDAO extends DAOObject {

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.hrclub.util.Logger.appender);

	public DocumentDAO() {
		super();
	}

	public DocumentTO findDocumentByID(int documentID) {
		Statement stmt = null;
		ResultSet rs = null;
		DocumentTO to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from document where documentID='"
					+ documentID + "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new DocumentTO();
				to.setDocumentID(rs.getInt("documentID"));
				to.setDocumentname(rs.getString("documentname"));
				to.setNameID(rs.getString("nameID"));
				to.setKind(rs.getInt("kind"));
				to.setIntegral(rs.getInt("integral"));
				to.setUrl(rs.getString("url"));
				to.setSize(rs.getString("size"));
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

	public Page findDocumentByPage(int pagenum, int pagelen) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from document";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				DocumentTO to = new DocumentTO();
				to.setDocumentID(rs.getInt("documentID"));
				to.setDocumentname(rs.getString("documentname"));
				to.setNameID(rs.getString("nameID"));
				to.setKind(rs.getInt("kind"));
				to.setIntegral(rs.getInt("integral"));
				to.setUrl(rs.getString("url"));
				to.setSize(rs.getString("size"));
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

	public Page findDocumentByPage(int pagenum, int pagelen, String nameID,
			String kind) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from document";
		if (null != nameID) {
			sql = sql + " where nameID like '%" + nameID + "%'";
			if (null != kind)
				sql = sql + " and kind like '%" + kind + "%'";
		} else {
			if (null != kind)
				sql = sql + " and kind like '%" + kind + "%'";
		}
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				DocumentTO to = new DocumentTO();
				to.setDocumentID(rs.getInt("documentID"));
				to.setDocumentname(rs.getString("documentname"));
				to.setNameID(rs.getString("nameID"));
				to.setKind(rs.getInt("kind"));
				to.setIntegral(rs.getInt("integral"));
				to.setUrl(rs.getString("url"));
				to.setSize(rs.getString("size"));
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

	public Page findDocumentByPage(int pagenum, int pagelen, String hrID) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from document where nameID='" + hrID
				+ "' and kind=1";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				DocumentTO to = new DocumentTO();
				to.setDocumentID(rs.getInt("documentID"));
				to.setDocumentname(rs.getString("documentname"));
				to.setNameID(rs.getString("nameID"));
				to.setKind(rs.getInt("kind"));
				to.setIntegral(rs.getInt("integral"));
				to.setUrl(rs.getString("url"));
				to.setSize(rs.getString("size"));
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

	public int delete(int documentID) {
		String sql = "delete from document where documentID='" + documentID
				+ "'";
		return this.executeUpdate(sql);
	}

	public int insert(DocumentTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into document(documentname,nameID,kind,integral,url,size) values('");

		sb.append(to.getDocumentname());
		sb.append("','");
		sb.append(to.getNameID());
		sb.append("','");
		sb.append(to.getKind());
		sb.append("','");
		sb.append(to.getIntegral());
		sb.append("','");
		sb.append(to.getUrl());
		sb.append("','");
		sb.append(to.getSize());
		sb.append("');");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int update(DocumentTO to) {
		StringBuffer sb = new StringBuffer("update document set documentID='");

		sb.append(to.getDocumentID());
		sb.append("',documentname='");
		sb.append(to.getDocumentname());
		sb.append("',nameID='");
		sb.append(to.getNameID());
		sb.append("',kind='");
		sb.append(to.getKind());
		sb.append("',integral='");
		sb.append(to.getIntegral());
		sb.append("',url='");
		sb.append(to.getUrl());
		sb.append("',size='");
		sb.append(to.getSize());
		sb.append("' where documentID='" + to.getDocumentID() + "';");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int totlesize(String hrID,String kind) {

		Statement stmt = null;
		ResultSet rs = null;
		int totlesize = 0;
		String sql ="select size from document where nameID='" + hrID +"' and kind='"+kind+"'";

		logger.debug(sql);
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				totlesize = totlesize+Integer.parseInt(rs.getString("size"));
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
		return totlesize;
	}

}
