package com.hrclub.model;

import java.util.List;

import com.hrclub.model.DAOFactory;
import com.hrclub.model.dao.IntegralDAO;
import com.hrclub.model.dao.MovementDAO;
import com.hrclub.model.dao.ServerorderDAO;
import com.hrclub.to.IntegralTO;
import com.hrclub.to.MovementTO;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class MovementManager {

	private static MovementManager instance = null;

	static org.apache.log4j.Logger logger = Logger.getLogger();

	private MovementManager() {

	}

	public static MovementManager getInstance() {
		if (instance == null) {
			instance = new MovementManager();
		}
		return instance;
	}

	public boolean insert(MovementTO to) {
		MovementDAO dao = DAOFactory.getInstance().getMovementDAO();
		int c = dao.insert(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean delete(int moveID) {
		MovementDAO dao = DAOFactory.getInstance().getMovementDAO();
		int c = dao.delete(moveID);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean update(MovementTO to) {
		MovementDAO dao = DAOFactory.getInstance().getMovementDAO();
		int c = dao.update(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public MovementTO findMovementByID(Integer moveID) {
		MovementDAO dao = DAOFactory.getInstance().getMovementDAO();
        MovementTO to = dao.findMovementByID(moveID);
        dao.destroy();
		return to;
	}

	public Page findMoveByPage(int pagenum, int pagelen) {
		MovementDAO dao = DAOFactory.getInstance().getMovementDAO();
		Page page = dao.findMoveByPage(pagenum, pagelen);
		dao.destroy();
		return page;
	}
	
	public Page findMoveByPage2(int pagenum, int pagelen) {
		MovementDAO dao = DAOFactory.getInstance().getMovementDAO();
		Page page = dao.findMoveByPage2(pagenum, pagelen);
		dao.destroy();
		return page;
	}

	public Page findMoveByPage(int pagenum, int pagelen, String puttime, String status) {
		MovementDAO dao = DAOFactory.getInstance().getMovementDAO();
		Page page = dao.findMoveByPage(pagenum, pagelen, puttime, status);
		dao.destroy();
		return page;
	}
	
	public List findMovementByputdate(int n) 
	{
		MovementDAO dao = DAOFactory.getInstance().getMovementDAO();
		List list = dao.findMovementByputdate(n);
        dao.destroy();
		return list;
	}
}
