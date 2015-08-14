package com.hrclub.model;


import java.util.List;

import com.hrclub.model.dao.MovementactorDAO;
import com.hrclub.to.MovementactorTO;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class MovementactorManager {
        
	private static MovementactorManager instance = null;
    
	static org.apache.log4j.Logger logger = Logger.getLogger();
	
	private MovementactorManager() {

	}

	public static MovementactorManager getInstance() {
		if (instance == null) {
			instance = new MovementactorManager();
		}
		return instance;
	}
	
	public boolean insert(MovementactorTO to) {
		MovementactorDAO dao = DAOFactory.getInstance().getMovementactor();
		int c = dao.insert(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean delete(int maID){
		MovementactorDAO dao = DAOFactory.getInstance().getMovementactor();
		int c = dao.delete(maID);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean update(MovementactorTO to) {
		MovementactorDAO dao = DAOFactory.getInstance().getMovementactor();
		int c = dao.update(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean changestatus(String maID,int status) {
		MovementactorDAO dao = DAOFactory.getInstance().getMovementactor();
		int c = dao.changestatus(maID, status);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public MovementactorTO findActorByID(int maID) {
		MovementactorDAO dao = DAOFactory.getInstance().getMovementactor();
		MovementactorTO to = dao.findActorByID(maID);
		dao.destroy();
		return to;
	}
	
	public MovementactorTO findActorByID(String moveID, String memberID, String kind) {
		MovementactorDAO dao = DAOFactory.getInstance().getMovementactor();
		MovementactorTO to = dao.findActorByID(moveID,memberID,kind);
		dao.destroy();
		return to;
	}
	
	public Page findActorByPage(int pagenum, int pagelen) {
		MovementactorDAO dao = DAOFactory.getInstance().getMovementactor();
		Page page = dao.findActorByPage(pagenum, pagelen);
		dao.destroy();
	    return page;
	}
	
	public Page findActorByPage(int pagenum, int pagelen, String memberID, String kind, String status) {
		MovementactorDAO dao = DAOFactory.getInstance().getMovementactor();
		Page page = dao.findActorByPage(pagenum, pagelen, memberID, kind, status);
		dao.destroy();
	    return page;
	}
	
	public Page findActorByMovID(int pagenum, int pagelen, int movID) {
		MovementactorDAO dao = DAOFactory.getInstance().getMovementactor();
		Page page = dao.findActorByMovID(pagenum, pagelen, movID);
		dao.destroy();
	    return page;
	}
	
	public Page findMovByUserID(int pagenum, int pagelen, String userID, String kind) {
		MovementactorDAO dao = DAOFactory.getInstance().getMovementactor();
		Page page = dao.findMovByUserID(pagenum, pagelen, userID, kind);
		dao.destroy();
	    return page;
	}

	public List findActorByMovID(int movID) {
		MovementactorDAO dao = DAOFactory.getInstance().getMovementactor();
		List actor = dao.findActorByMovID(movID);
		dao.destroy();
	    return actor;
	}

}
