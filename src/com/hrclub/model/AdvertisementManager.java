package com.hrclub.model;
import com.hrclub.model.dao.*;
import com.hrclub.to.*;
import com.hrclub.to.Page; 
public class AdvertisementManager {
	public static final int AD_TYPE_MAINPAGE = 0; 
	public static final int AD_TYPE_INDUSTRY = 1; 
	public static final int AD_TYPE_AREA = 2; 
	public static final int AD_TYPE_EXPERT = 3; 
	public static final int AD_TYPE_TRAINING = 4; 
	public static final int AD_TYPE_WORK = 5;  
    
	private static AdvertisementManager instance = null;

	private AdvertisementManager() {

	}

	public static AdvertisementManager getInstance() {
		if (instance == null) {
			instance = new AdvertisementManager();
		}
		return instance;
	}
	
	public boolean deleteAdvertise(int adID) {
		AdvertisementDAO dao = DAOFactory.getInstance().getAdvertisementDAO();
		int c = dao.delete(adID);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean updateAdvertise(AdvertisementTO to ) {
		AdvertisementDAO dao = DAOFactory.getInstance().getAdvertisementDAO();
		int c = dao.update(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	public boolean createAdvertise(AdvertisementTO to ) {
		AdvertisementDAO dao = DAOFactory.getInstance().getAdvertisementDAO();
		int c = dao.insert(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public Page findNoticeByPage(int pagenum, int pagelen) {
		AdvertisementDAO dao = DAOFactory.getInstance().getAdvertisementDAO();
		Page page = dao.findAdvertisementByPage(pagenum,   pagelen);
		dao.destroy();
		dao = null;
		return page;
	}
	public   AdvertisementTO findAdvertiseByID(int adID ){
		AdvertisementDAO dao = DAOFactory.getInstance().getAdvertisementDAO();
		AdvertisementTO to = dao.findAdvertisementByID(adID);
		dao.destroy();
		dao = null;
		return to;
	}
}
