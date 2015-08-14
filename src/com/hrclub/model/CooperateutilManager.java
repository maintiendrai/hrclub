package com.hrclub.model;

import com.hrclub.model.dao.CooperateutilDAO;
import com.hrclub.to.CooperateutilTO;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class CooperateutilManager {
        
	private static CooperateutilManager instance = null;
    
	static org.apache.log4j.Logger logger = Logger.getLogger();
	
	private CooperateutilManager() {

	}

	public static CooperateutilManager getInstance() {
		if (instance == null) {
			instance = new CooperateutilManager();
		}
		return instance;
	}
	
	public boolean insert(CooperateutilTO to) {
		CooperateutilDAO dao = DAOFactory.getInstance().getCooperateutilDAO();
		int c = dao.insert(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean delete(int utilID){
		CooperateutilDAO dao = DAOFactory.getInstance().getCooperateutilDAO();
		int c = dao.delete(utilID);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean update(CooperateutilTO to) {
		CooperateutilDAO dao = DAOFactory.getInstance().getCooperateutilDAO();
		int c = dao.update(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public CooperateutilTO findUtilByID(int utilID) {
		CooperateutilDAO dao = DAOFactory.getInstance().getCooperateutilDAO();
		CooperateutilTO to = dao.findUtilByID(utilID);
		dao.destroy();
		return to;
	}
	
	public Page findUtilByPage(int pagenum, int pagelen) {
		CooperateutilDAO dao = DAOFactory.getInstance().getCooperateutilDAO();
		Page page = dao.findUtilByPage(pagenum, pagelen);
		dao.destroy();
	    return page;
	}
	
	public Page findUtilByPage(int pagenum, int pagelen, String utilname, String utilkind) {
		CooperateutilDAO dao = DAOFactory.getInstance().getCooperateutilDAO();
		Page page = dao.findUtilByPage(pagenum, pagelen, utilname, utilkind);
		dao.destroy();
	    return page;
	}

}
