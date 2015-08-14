package com.hrclub.model;

import java.util.List;

import com.hrclub.model.dao.HRinfoDAO;
import com.hrclub.to.HRinfoTO;
import com.hrclub.to.Page;

public class HRManager {

	private static HRManager instance = null;

	private HRManager() {

	}

	public static HRManager getInstance() {
		if (instance == null) {
			instance = new HRManager();
		}
		return instance;
	}

	// HR基本信息的操作
	public String getHRPassword(String hrID) {

		HRinfoDAO dao = DAOFactory.getInstance().getHRinfoDAO();
		String pw = dao.getHRPassword(hrID);
		dao.destroy();
		return pw;
	}

	public boolean isHRExist(String hrID) {
		HRinfoDAO dao = DAOFactory.getInstance().getHRinfoDAO();
		boolean flag = dao.isHRExist(hrID);
		dao.destroy();
		return flag;

	}

	public int updateHR(HRinfoTO to) {
		HRinfoDAO dao = DAOFactory.getInstance().getHRinfoDAO();
		int i = dao.update(to);
		dao.destroy();
		return i;
	}

	public List getAllHREmail() {

		HRinfoDAO dao = DAOFactory.getInstance().getHRinfoDAO();
		List list = dao.getAllHREmail();
		dao.destroy();
		return list;
	}

	public String getHREmail(String hrID) { 

		HRinfoDAO dao = DAOFactory.getInstance().getHRinfoDAO();
		String email = dao.getHREmail(hrID);
		dao.destroy();
		return email;
	}

	public int updateHRStatus(String hrID, int status) {
		HRinfoDAO dao = DAOFactory.getInstance().getHRinfoDAO();
		int i = dao.updateStatus(hrID, status);
		dao.destroy();
		return i;

	}

	public int insertHR(HRinfoTO to) {
		HRinfoDAO dao = DAOFactory.getInstance().getHRinfoDAO();
		int i = dao.insert(to);
		dao.destroy();
		return i;

	}

	public int deleteHR(String hrID) {
		HRinfoDAO dao = DAOFactory.getInstance().getHRinfoDAO();
		int i = dao.delete(hrID);
		dao.destroy();
		return i;
	}

	public HRinfoTO findHRByID(String hrID) {
		HRinfoDAO dao = DAOFactory.getInstance().getHRinfoDAO();
		HRinfoTO to = dao.findHRByID(hrID);
		dao.destroy();
		return to;
	}

	public int updateHRPassword(String hrID, String password) {
		HRinfoDAO dao = DAOFactory.getInstance().getHRinfoDAO();
		int i = dao.updatePassword(hrID, password);
		dao.destroy();
		return i;
	}

	public Page findHRByPage(int pagenum, int pagelen){
		HRinfoDAO dao = DAOFactory.getInstance().getHRinfoDAO();
		Page page = dao.findHRByPage(pagenum, pagelen);
		dao.destroy();
		return page;
	}
	
	public Page findHRByStatus(int pagenum, int pagelen){
		HRinfoDAO dao = DAOFactory.getInstance().getHRinfoDAO();
		Page page = dao.findHRByStatus(pagenum, pagelen);
		dao.destroy();
		return page;
	}
	public List getAllHrID() {

		HRinfoDAO dao = DAOFactory.getInstance().getHRinfoDAO();
		List list = dao.getAllHrID();
		dao.destroy();
		return list;
	}
}
