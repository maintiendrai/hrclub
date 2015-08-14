package com.hrclub.model;

import com.hrclub.model.DAOFactory;
import com.hrclub.model.dao.ItintegralDAO;
import com.hrclub.to.ItintegralTO;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class ItintegralManager {

	private static ItintegralManager instance = null;

	static org.apache.log4j.Logger logger = Logger.getLogger();

	private ItintegralManager() {

	}

	public static ItintegralManager getInstance() {
		if (instance == null) {
			instance = new ItintegralManager();
		}
		return instance;
	}

	public boolean insert(ItintegralTO to) {
		ItintegralDAO dao = DAOFactory.getInstance().getItintegralDAO();
		int c = dao.insert(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean delete(String itID) {
		ItintegralDAO dao = DAOFactory.getInstance().getItintegralDAO();
		int c = dao.delete(itID);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean update(ItintegralTO to) {
		ItintegralDAO dao = DAOFactory.getInstance().getItintegralDAO();
		int c = dao.update(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public ItintegralTO findItByID(String itID) {
		ItintegralDAO dao = DAOFactory.getInstance().getItintegralDAO();
		ItintegralTO to = dao.findItByID(itID);
		dao.destroy();
		return to;
	}

	public Page findItByPage(int pagenum, int pagelen) {
		ItintegralDAO dao = DAOFactory.getInstance().getItintegralDAO();
		Page page = dao.findItByPage(pagenum, pagelen);
		dao.destroy();
		return page;
	}
	
	public Page findItByPage(int pagenum, int pagelen, String itID) {
		ItintegralDAO dao = DAOFactory.getInstance().getItintegralDAO();
		Page page = dao.findItByPage(pagenum, pagelen, itID);
		dao.destroy();
		return page;
	}
	

}
