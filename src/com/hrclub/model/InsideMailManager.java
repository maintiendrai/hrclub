package com.hrclub.model;

import com.hrclub.model.dao.CooperateutilDAO;
import com.hrclub.model.dao.MailDAO;
import com.hrclub.to.CooperateutilTO;
import com.hrclub.to.MailTO;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class InsideMailManager {
        
	private static InsideMailManager instance = null;
    
	static org.apache.log4j.Logger logger = Logger.getLogger();
	
	private InsideMailManager() {

	}

	public static InsideMailManager getInstance() {
		if (instance == null) {
			instance = new InsideMailManager();
		}
		return instance;
	}
	
	public boolean insert(MailTO to) {
		MailDAO dao = DAOFactory.getInstance().getMailDAO();
		int c = dao.insert(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean delete(int mailID){
		MailDAO dao = DAOFactory.getInstance().getMailDAO();
		int c = dao.delete(mailID);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean update(MailTO to) {
		MailDAO dao = DAOFactory.getInstance().getMailDAO();
		int c = dao.update(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean updatestatus(int mailID,int status) {
		MailDAO dao = DAOFactory.getInstance().getMailDAO();
		int c = dao.updatestatus(mailID, status);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public MailTO findMailByID(int mailID) {
		MailDAO dao = DAOFactory.getInstance().getMailDAO();
		MailTO to = dao.findMailByID(mailID);
		dao.destroy();
		return to;
	}
	
	public Page findMailByPage(int pagenum, int pagelen, String revID, String revkind) {
		MailDAO dao = DAOFactory.getInstance().getMailDAO();
		Page page = dao.findMailByPage(pagenum, pagelen, revID, revkind);
		dao.destroy();
	    return page;
	}
	
	public Page findMailByPage(int pagenum, int pagelen) {
		MailDAO dao = DAOFactory.getInstance().getMailDAO();
		Page page = dao.findMailByPage(pagenum, pagelen);
		dao.destroy();
	    return page;
	}
	
	public Page findMailByRevID(int pagenum, int pagelen, String revID,int revkind) {
		MailDAO dao = DAOFactory.getInstance().getMailDAO();
		Page page = dao.findMailByRevID(pagenum, pagelen, revID, revkind);
		dao.destroy();
	    return page;
	}

}
