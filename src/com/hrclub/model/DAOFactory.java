package com.hrclub.model;

import com.hrclub.model.dao.AdmininfoDAO;
import com.hrclub.model.dao.AdvertisementDAO;
import com.hrclub.model.dao.CooperateutilDAO;
import com.hrclub.model.dao.*;
import com.hrclub.model.dao.MessageDAO;
import com.hrclub.model.dao.IntegralDAO;
import com.hrclub.model.dao.MovementDAO;
import com.hrclub.model.dao.ServerorderDAO;
import com.hrclub.model.dao.UserDAO;

public class DAOFactory {
	private static DAOFactory instance = null;

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.hrclub.util.Logger.appender);

	private DAOFactory() {

	}

	public static DAOFactory getInstance() {
		if (instance == null) {
			instance = new DAOFactory();
		}
		return instance;
	}

	public UserDAO getUserDAO() {
		logger.debug("getUserDAO...");
		return new UserDAO();
	}

	 

	public ExpertDAO getExpertDAO() {
		logger.debug("getExpertDAO...");
		return new ExpertDAO();
	}


	
	public ServerorderDAO getServerorderDAO()  {
		logger.debug("getServerorderDAO...");
		return new ServerorderDAO();   
	}
	
	public CooperateutilDAO getCooperateutilDAO()  {
		logger.debug("getCooperateutilDAO...");
		return new CooperateutilDAO();   
	}
	
	public AdmininfoDAO getAdmininfoDAO()  {
		logger.debug("getAdmininfoDAO...");
		return new AdmininfoDAO();
	}

	///////////////添加的DAO////////////////
	public IntegralDAO getIntegralDAO(){//积分的DAO
		logger.debug("getIntegralDAO...");
		return new IntegralDAO();
	}
	public MovementDAO getMovementDAO(){//活动的DAO
		logger.debug("getMovementDAO...");
		return new MovementDAO();
	}

	
	public MessageDAO getMessageDAO()  {
		logger.debug("getMessageDAO...");
		return new MessageDAO();
	}
	
	public AdvertisementDAO getAdvertisementDAO() {
		logger.debug("getAdvertisementDAO...");
		return new AdvertisementDAO();
	}
	
	public ITUserDAO getITUserDAO()  {
		logger.debug("getTUserDAO...");
		return new ITUserDAO();   
	}
	public WorkexperienceDAO getWorkexperienceDAO()  {
		logger.debug("getWorkexperienceDAO...");
		return new WorkexperienceDAO();   
	}
	public ProjectDAO getProjectDAO()  {
		logger.debug("getProjectDAO...");
		return new ProjectDAO();   
	}
	public LanguageDAO getLanguageDAO()  {
		logger.debug("getLanguageDAO...");
		return new LanguageDAO();   
	}
	public ITskillDAO getITskillDAO()  {
		logger.debug("getITskillDAO...");
		return new ITskillDAO();   
	}
	public CertificateDAO getCertificateDAO()  {
		logger.debug("getCertificateDAO...");
		return new CertificateDAO();   
	}
	
	public CallingcomfDAO getCallingcomfDAO()  {
		logger.debug("getCallingcomfDAO...");
		return new CallingcomfDAO();   
	}
	public CertificateComfDAO getCertificateComfDAO()  {
		logger.debug("getCertificateComfDAO...");
		return new CertificateComfDAO();   
	}
	public ITskillcomfDAO getITskillcomfDAO()  {
		logger.debug("getITskillcomfDAO...");
		return new ITskillcomfDAO();   
	}
	public SpecialitycomfDAO getSpecialitycomfDAO()  {
		logger.debug("getSpecialitycomfDAO...");
		return new SpecialitycomfDAO();   
	}
	public JobComfDAO getJobComfDAO()  {
		logger.debug("getJobComfDAO...");
		return new JobComfDAO();   
	}
	
	
	public ITUserSpecialityDAO getITUserSpecialityDAO()  {
		logger.debug("getJobComfDAO...");
		return new ITUserSpecialityDAO();   
	}
	
	public HRinfoDAO getHRinfoDAO()  {
		logger.debug("getHRinfoDAO...");
		return new HRinfoDAO();   
	}
	public JobinfoDAO getJobinfoDAO()  {
		logger.debug("getJobinfoDAO...");
		return new JobinfoDAO();   
	}
	
	public MailDAO getMailDAO() {
		logger.debug("getMailDAO...");
		return new MailDAO(); 
	}
	
	public MovementactorDAO getMovementactor() {
		logger.debug("getMovementactor...");
		return new MovementactorDAO(); 
	}
	
	public DocumentDAO getDocumentDAO() {
		logger.debug("getDocumentDAO...");
		return new DocumentDAO(); 
	}
	
	public JobletterDAO getJobletterDAO() {
		logger.debug("getJobletterDAO...");
		return new JobletterDAO(); 
	}
	
	public AdvertDAO getAdvertDAO() {
		logger.debug("getAdvertDAO...");
		return new AdvertDAO(); 
	}

	public ItintegralDAO getItintegralDAO(){
		logger.debug("getItintegralDAO...");
		return new ItintegralDAO();
	}
}