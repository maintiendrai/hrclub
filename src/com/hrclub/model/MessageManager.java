package com.hrclub.model;

import java.util.List;

import com.hrclub.model.dao.MessageDAO;
import com.hrclub.to.MessageTO;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class MessageManager {
        
	private static MessageManager instance = null;
    
	static org.apache.log4j.Logger logger = Logger.getLogger();
	
	private MessageManager() {

	}

	public static MessageManager getInstance() {
		if (instance == null) {
			instance = new MessageManager();
		}
		return instance;
	}
	
	public boolean insert(MessageTO to) {
		MessageDAO dao = DAOFactory.getInstance().getMessageDAO();
		int c = dao.insert(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean delete(int messageID){
		MessageDAO dao = DAOFactory.getInstance().getMessageDAO();
		int c = dao.delete(messageID);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean update(MessageTO to) {
		MessageDAO dao = DAOFactory.getInstance().getMessageDAO();
		int c = dao.update(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public MessageTO findMessByID(int utilID) {
		MessageDAO dao = DAOFactory.getInstance().getMessageDAO();
		MessageTO to = dao.findMessByID(utilID);
		dao.destroy();
		return to;
	}
	
	public Page findMessByPage(int pagenum, int pagelen) {
		MessageDAO dao = DAOFactory.getInstance().getMessageDAO();
		Page page = dao.findMessByPage(pagenum, pagelen);
		dao.destroy();
	    return page;
	}
	
	public Page findMessByPage(int pagenum, int pagelen, String puttime, String kind) {
		MessageDAO dao = DAOFactory.getInstance().getMessageDAO();
		Page page = dao.findMessByPage(pagenum, pagelen, puttime, kind);
		dao.destroy();
	    return page;
	}
    
	public Page findMessByPage(int pagenum, int pagelen, int kind) {
		MessageDAO dao = DAOFactory.getInstance().getMessageDAO();
		Page page = dao.findMessByPage(pagenum, pagelen,kind);
		dao.destroy();
	    return page;
	}
	
	public List findMessageByputdate(int n ,String kind){
		MessageDAO dao = DAOFactory.getInstance().getMessageDAO();
		List list = dao.findMessageByputdate(n,kind);
		dao.destroy(); 
	    return list;
	}
}
