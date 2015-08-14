package com.hrclub.model;

import java.util.List;

import com.hrclub.model.dao.DocumentDAO;
import com.hrclub.to.DocumentTO;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class DocumentManager {
        
	private static DocumentManager instance = null;
    
	static org.apache.log4j.Logger logger = Logger.getLogger();
	
	private DocumentManager() {

	}

	public static DocumentManager getInstance() {
		if (instance == null) {
			instance = new DocumentManager();
		}
		return instance;
	}
	
	public boolean insert(DocumentTO to) {
		DocumentDAO dao = DAOFactory.getInstance().getDocumentDAO();
		int c = dao.insert(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean delete(int documentID){
		DocumentDAO dao = DAOFactory.getInstance().getDocumentDAO();
		int c = dao.delete(documentID);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean update(DocumentTO to) {
		DocumentDAO dao = DAOFactory.getInstance().getDocumentDAO();
		int c = dao.update(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public DocumentTO findDocumentByID(int documentID) {
		DocumentDAO dao = DAOFactory.getInstance().getDocumentDAO();
		DocumentTO to = dao.findDocumentByID(documentID);
		dao.destroy();
		return to;
	}
	
	public Page findDocumentByPage(int pagenum, int pagelen) {
		DocumentDAO dao = DAOFactory.getInstance().getDocumentDAO();
		Page page = dao.findDocumentByPage(pagenum, pagelen);
		dao.destroy();
	    return page;
	}
	
	public Page findDocumentByPage(int pagenum, int pagelen, String nameID, String kind) {
		DocumentDAO dao = DAOFactory.getInstance().getDocumentDAO();
		Page page = dao.findDocumentByPage(pagenum, pagelen, nameID, kind);
		dao.destroy();
	    return page;
	}
	
	public Page findDocumentByPage(int pagenum, int pagelen, String hrID) {
		DocumentDAO dao = DAOFactory.getInstance().getDocumentDAO();
		Page page = dao.findDocumentByPage(pagenum, pagelen, hrID);
		dao.destroy();
	    return page;
	}
	

	public int totlesize(String hrID,String kind) {
		DocumentDAO dao = DAOFactory.getInstance().getDocumentDAO();
		int totlesize = dao.totlesize(hrID,kind);
		dao.destroy();
	    return totlesize;
	}
}
