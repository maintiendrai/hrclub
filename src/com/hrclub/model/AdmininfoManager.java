package com.hrclub.model;

import com.hrclub.model.dao.AdmininfoDAO;
import com.hrclub.to.AdmininfoTO;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class AdmininfoManager {

	private static AdmininfoManager instance = null;

	static org.apache.log4j.Logger logger = Logger.getLogger();

	private AdmininfoManager() {

	}

	public static AdmininfoManager getInstance() {
		if (instance == null) {
			instance = new AdmininfoManager();
		}
		return instance;
	}

	public boolean insert(AdmininfoTO to) {
		AdmininfoDAO dao = DAOFactory.getInstance().getAdmininfoDAO();
		int c = dao.insert(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean delete(String adminID) {
		AdmininfoDAO dao = DAOFactory.getInstance().getAdmininfoDAO();
		int c = dao.delete(adminID);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean update(AdmininfoTO to) {
		AdmininfoDAO dao = DAOFactory.getInstance().getAdmininfoDAO();
		int c = dao.update(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public AdmininfoTO findAdminByID(String adminID) {
		AdmininfoDAO dao = DAOFactory.getInstance().getAdmininfoDAO();
		AdmininfoTO to = dao.findAdminByID(adminID);
		dao.destroy();
		return to;
	}
	
	public AdmininfoTO findAdminByIDAndRole(String adminID,String role) {
		AdmininfoDAO dao = DAOFactory.getInstance().getAdmininfoDAO();
		AdmininfoTO to = dao.findAdminByIDAndRole(adminID,role);
		dao.destroy();
		return to;
	}

	public Page findAdminByPage(int pagenum, int pagelen) {
		AdmininfoDAO dao = DAOFactory.getInstance().getAdmininfoDAO();
		Page page = dao.findAdminByPage(pagenum, pagelen);
		dao.destroy();
		return page;
	}
}
