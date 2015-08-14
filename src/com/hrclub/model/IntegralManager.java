package com.hrclub.model;

import com.hrclub.model.DAOFactory;
import com.hrclub.model.dao.IntegralDAO;
import com.hrclub.to.IntegralTO;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class IntegralManager {

	private static IntegralManager instance = null;

	static org.apache.log4j.Logger logger = Logger.getLogger();

	private IntegralManager() {

	}

	public static IntegralManager getInstance() {
		if (instance == null) {
			instance = new IntegralManager();
		}
		return instance;
	}

	public boolean insert(IntegralTO to) {
		IntegralDAO dao = DAOFactory.getInstance().getIntegralDAO();
		int c = dao.insert(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean delete(String hrID) {
		IntegralDAO dao = DAOFactory.getInstance().getIntegralDAO();
		int c = dao.delete(hrID);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean update(IntegralTO to) {
		IntegralDAO dao = DAOFactory.getInstance().getIntegralDAO();
		int c = dao.update(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public IntegralTO findHrByID(String hrID) {
		IntegralDAO dao = DAOFactory.getInstance().getIntegralDAO();
		IntegralTO to = dao.findHrByID(hrID);
		dao.destroy();
		return to;
	}

	public Page findHrByPage(int pagenum, int pagelen) {
		IntegralDAO dao = DAOFactory.getInstance().getIntegralDAO();
		Page page = dao.findHrByPage(pagenum, pagelen);
		dao.destroy();
		return page;
	}
	
	public Page findHrByPage(int pagenum, int pagelen, String hrID) {
		IntegralDAO dao = DAOFactory.getInstance().getIntegralDAO();
		Page page = dao.findHrByPage(pagenum, pagelen, hrID);
		dao.destroy();
		return page;
	}
	
	public boolean increase(String ID, int role, int mun) {
		IntegralDAO dao = DAOFactory.getInstance().getIntegralDAO();
		int c = dao.increase(ID, role, mun);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean reduce(String ID, int role, int mun) {
		IntegralDAO dao = DAOFactory.getInstance().getIntegralDAO();
		int c = dao.reduce(ID, role, mun);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

}
