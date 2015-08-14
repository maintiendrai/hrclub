package com.hrclub.model;

import com.hrclub.model.dao.AdvertDAO;
import com.hrclub.to.AdvertTO;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class AdvertManager {
        
	private static AdvertManager instance = null;
    
	static org.apache.log4j.Logger logger = Logger.getLogger();
	
	private AdvertManager() {

	}

	public static AdvertManager getInstance() {
		if (instance == null) {
			instance = new AdvertManager();
		}
		return instance;
	}
	
	public boolean insert(AdvertTO to) {
		AdvertDAO dao = DAOFactory.getInstance().getAdvertDAO();
		int c = dao.insert(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean delete(int adID){
		AdvertDAO dao = DAOFactory.getInstance().getAdvertDAO();
		int c = dao.delete(adID);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean update(AdvertTO to) {
		AdvertDAO dao = DAOFactory.getInstance().getAdvertDAO();
		int c = dao.update(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public AdvertTO findAdvertByID(int adID) {
		AdvertDAO dao = DAOFactory.getInstance().getAdvertDAO();
		AdvertTO to = dao.findAdvertByID(adID);
		dao.destroy();
		return to;
	}
	
	public Page findAdvertByPage(int pagenum, int pagelen) {
		AdvertDAO dao = DAOFactory.getInstance().getAdvertDAO();
		Page page = dao.findAdvertByPage(pagenum, pagelen);
		dao.destroy();
	    return page;
	}
	
	public Page findAdvertByPage(int pagenum, int pagelen, String adname, String status) {
		AdvertDAO dao = DAOFactory.getInstance().getAdvertDAO();
		Page page = dao.findAdvertByPage(pagenum, pagelen, adname, status);
		dao.destroy();
	    return page;
	}
    
}
