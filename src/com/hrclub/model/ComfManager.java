package com.hrclub.model;

import java.util.HashMap;
import java.util.List;

import com.hrclub.model.dao.*;
import com.hrclub.to.*;
import com.hrclub.util.Logger;

public class ComfManager  {

	
	static org.apache.log4j.Logger logger = Logger.getLogger();

	private static ComfManager instance = null;

	private ComfManager() {

	}

	public static ComfManager getInstance() {
		if (instance == null) {
			instance = new ComfManager();
		}
		return instance;
	}
	
	public HashMap callingcomfList(){
		CallingcomfDAO dao = DAOFactory.getInstance().getCallingcomfDAO();
		HashMap map=dao.callingcomfList();
		dao.destroy();
		return map;
 	}
	public HashMap certificateList(){
		CertificateComfDAO dao = DAOFactory.getInstance().getCertificateComfDAO();
		HashMap map=dao.certificateList();
		dao.destroy();
		return map;
 	}
	public HashMap ITskillcomfList(){
		ITskillcomfDAO dao = DAOFactory.getInstance().getITskillcomfDAO();
		HashMap map=dao.ITskillcomfList();
		dao.destroy();
		return map;
 	}
	public HashMap specialitycomfList(){
		SpecialitycomfDAO dao = DAOFactory.getInstance().getSpecialitycomfDAO();
		HashMap map=dao.specialitycomfList();
		dao.destroy();
		return map;
 	}
	public HashMap jobList(){
		JobComfDAO dao = DAOFactory.getInstance().getJobComfDAO();
		HashMap map=dao.jobList();
		dao.destroy();
		return map;
 	}
	
	/*
	 * 行业类型配置操作
	 */
	public boolean insertCalling(CallingcomfTO to) {
		CallingcomfDAO dao = DAOFactory.getInstance().getCallingcomfDAO();
		int c = dao.insert(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean deleteCalling(int callingID) {
		CallingcomfDAO dao = DAOFactory.getInstance().getCallingcomfDAO();
		int c = dao.delete(callingID);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean updateCalling(CallingcomfTO to) {
		CallingcomfDAO dao = DAOFactory.getInstance().getCallingcomfDAO();
		int c = dao.update(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public CallingcomfTO findCallingByID(int callingID) {
		CallingcomfDAO dao = DAOFactory.getInstance().getCallingcomfDAO();
		CallingcomfTO to = dao.findCallingByID(callingID);
		dao.destroy();
		return to;
	}

	public Page findCallingByPage(int pagenum, int pagelen) {
		CallingcomfDAO dao = DAOFactory.getInstance().getCallingcomfDAO();
		Page page = dao.findCallingByPage(pagenum, pagelen);
		dao.destroy();
		return page;
	}
	
	public Page findCallingByPage(int pagenum, int pagelen, String callingname) {
		CallingcomfDAO dao = DAOFactory.getInstance().getCallingcomfDAO();
		Page page = dao.findCallingByPage(pagenum, pagelen, callingname);
		dao.destroy();
		return page;
	}
	
	/*
	 * 证书类型配置操作
	 */
	public boolean insertCertificate(CertificateComfTO to) {
		CertificateComfDAO dao = DAOFactory.getInstance().getCertificateComfDAO();
		int c = dao.insert(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean deleteCertificate(int certificateID) {
		CertificateComfDAO dao = DAOFactory.getInstance().getCertificateComfDAO();
		int c = dao.delete(certificateID);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean updateCertificate(CertificateComfTO to) {
		CertificateComfDAO dao = DAOFactory.getInstance().getCertificateComfDAO();
		int c = dao.update(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public CertificateComfTO findCertificateByID(int certificateID) {
		CertificateComfDAO dao = DAOFactory.getInstance().getCertificateComfDAO();
		CertificateComfTO to = dao.findCertificateByID(certificateID);
		dao.destroy();
		return to;
	}

	public Page findCertificateByPage(int pagenum, int pagelen) {
		CertificateComfDAO dao = DAOFactory.getInstance().getCertificateComfDAO();
		Page page = dao.findCertificateByPage(pagenum, pagelen);
		dao.destroy();
		return page;
	}
	
	public Page findCertificateByPage(int pagenum, int pagelen, String certificatename) {
		CertificateComfDAO dao = DAOFactory.getInstance().getCertificateComfDAO();
		Page page = dao.findCertificateByPage(pagenum, pagelen, certificatename);
		dao.destroy();
		return page;
	}
	
	/*
	 * 技能类型配置操作
	 */
	public boolean insertITskill(ITskillcomfTO to) {
		ITskillcomfDAO dao = DAOFactory.getInstance().getITskillcomfDAO();
		int c = dao.insert(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean deleteITskill(int skilID) {
		ITskillcomfDAO dao = DAOFactory.getInstance().getITskillcomfDAO();
		int c = dao.delete(skilID);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean updateITskill(ITskillcomfTO to) {
		ITskillcomfDAO dao = DAOFactory.getInstance().getITskillcomfDAO();
		int c = dao.update(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public ITskillcomfTO findITskillByID(int skilID) {
		ITskillcomfDAO dao = DAOFactory.getInstance().getITskillcomfDAO();
		ITskillcomfTO to = dao.findITskillByID(skilID);
		dao.destroy();
		return to;
	}

	public Page findITskillByPage(int pagenum, int pagelen) {
		ITskillcomfDAO dao = DAOFactory.getInstance().getITskillcomfDAO();
		Page page = dao.findITskillByPage(pagenum, pagelen);
		dao.destroy();
		return page;
	}
	
	public Page findITskillByPage(int pagenum, int pagelen, String skillame) {
		ITskillcomfDAO dao = DAOFactory.getInstance().getITskillcomfDAO();
		Page page = dao.findITskillByPage(pagenum, pagelen, skillame);
		dao.destroy();
		return page;
	}
	
	/*
	 * 职位类型配置操作
	 */
	public boolean insertJob(JobComfTO to) {
		JobComfDAO dao = DAOFactory.getInstance().getJobComfDAO();
		int c = dao.insert(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean deleteJob(int jobID) {
		JobComfDAO dao = DAOFactory.getInstance().getJobComfDAO();
		int c = dao.delete(jobID);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean updateJob(JobComfTO to) {
		JobComfDAO dao = DAOFactory.getInstance().getJobComfDAO();
		int c = dao.update(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public JobComfTO findJobByID(int jobID) {
		JobComfDAO dao = DAOFactory.getInstance().getJobComfDAO();
		JobComfTO to = dao.findJobComfByID(jobID);
		dao.destroy();
		return to;
	}

	public Page findJobByPage(int pagenum, int pagelen) {
		JobComfDAO dao = DAOFactory.getInstance().getJobComfDAO();
		Page page = dao.findJobComfByPage(pagenum, pagelen);
		dao.destroy();
		return page;
	}
	
	public Page findJobByPage(int pagenum, int pagelen, String jobame) {
		JobComfDAO dao = DAOFactory.getInstance().getJobComfDAO();
		Page page = dao.findJobComfByPage(pagenum, pagelen, jobame);
		dao.destroy();
		return page;
	}
	
	/*
	 * 专业类型配置操作
	 */
	public boolean insertSpeciality(SpecialitycomfTO to) {
		SpecialitycomfDAO dao = DAOFactory.getInstance().getSpecialitycomfDAO();
		int c = dao.insert(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean deleteSpeciality(int specialityID) {
		SpecialitycomfDAO dao = DAOFactory.getInstance().getSpecialitycomfDAO();
		int c = dao.delete(specialityID);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean updateSpeciality(SpecialitycomfTO to) {
		SpecialitycomfDAO dao = DAOFactory.getInstance().getSpecialitycomfDAO();
		int c = dao.update(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public SpecialitycomfTO findSpecialityByID(int specialityID) {
		SpecialitycomfDAO dao = DAOFactory.getInstance().getSpecialitycomfDAO();
		SpecialitycomfTO to = dao.findSpecialitycomfByID(specialityID);
		dao.destroy();
		return to;
	}

	public Page findSpecialityByPage(int pagenum, int pagelen) {
		SpecialitycomfDAO dao = DAOFactory.getInstance().getSpecialitycomfDAO();
		Page page = dao.findSpecialitycomfByPage(pagenum, pagelen);
		dao.destroy();
		return page;
	}
	
	public Page findSpecialityByPage(int pagenum, int pagelen, String specialityname) {
		SpecialitycomfDAO dao = DAOFactory.getInstance().getSpecialitycomfDAO();
		Page page = dao.findSpecialitycomfByPage(pagenum, pagelen,specialityname);
		dao.destroy();
		return page;
	}

	public List findCertificateBykind(int kind) {
		CertificateComfDAO dao = DAOFactory.getInstance().getCertificateComfDAO();
		List list=dao.findCertificateBykind(kind);
		dao.destroy();
		return list;
		
	}
	public List certList() {
		CertificateComfDAO dao = DAOFactory.getInstance().getCertificateComfDAO();
		List list=dao.certList();
		dao.destroy();
		return list;
	}

}
