package com.hrclub.model;

import java.util.List;

import com.hrclub.model.dao.JobinfoDAO;
import com.hrclub.model.dao.JobletterDAO;
import com.hrclub.to.JobinfoTO;
import com.hrclub.to.JobletterTO;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class JobManager {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	private static JobManager instance = null;

	private JobManager() {

	}

	public static JobManager getInstance() {
		if (instance == null) {
			instance = new JobManager();
		}
		return instance;
	}
	
	public int insertJobinfo(JobinfoTO to){
		JobinfoDAO dao = DAOFactory.getInstance().getJobinfoDAO();
		int i=dao.insert(to);
		dao.destroy();
		return i;
	}
	public int admininsertJobinfo(JobinfoTO to){
		JobinfoDAO dao = DAOFactory.getInstance().getJobinfoDAO();
		int i=dao.admininsert(to);
		dao.destroy();
		return i;
	}
	
	public Page findJobByPage(int pagenum, int pagelen){
		JobinfoDAO dao = DAOFactory.getInstance().getJobinfoDAO();
		Page page=dao.findJobByPage(pagenum, pagelen);
		dao.destroy();
		return page;
	}
	
	public Page findJobByhrID(int pagenum, int pagelen,String hrID){
		JobinfoDAO dao = DAOFactory.getInstance().getJobinfoDAO();
		Page page=dao.findJobByhrID(pagenum, pagelen, hrID);
		dao.destroy();
		return page;
	}
	
	public int updateJobStatus(String jobID,int status) {
		JobinfoDAO dao = DAOFactory.getInstance().getJobinfoDAO();
		int i=dao.updateStatus(jobID, status);
		dao.destroy();
		return i;
	}
	public int deleteJob(String jobID) {
		JobinfoDAO dao = DAOFactory.getInstance().getJobinfoDAO();
		int i=dao.delete(jobID);
		dao.destroy();
		return i;
	}	

	public JobinfoTO findJobinfoByjobID(int jobID) {
		JobinfoDAO dao = DAOFactory.getInstance().getJobinfoDAO();
		JobinfoTO to = new JobinfoTO();
		to=dao.findJobinfoByjobID(jobID);
		dao.destroy();
		return to;
		
	}
	
	public Page findJobinfoByyCity(int pagenum, int pagelen,String city){
		JobinfoDAO dao = DAOFactory.getInstance().getJobinfoDAO();
		Page page=dao.findJobinfoByCity(pagenum, pagelen,city);
		dao.destroy();
		return page;
	}
	
	
	public int updateJobinfo(JobinfoTO to) {
		JobinfoDAO dao = DAOFactory.getInstance().getJobinfoDAO();
		int i=dao.update(to);
		dao.destroy();
		return i;
	}
	
	
	public List findJobByputdate(int n){
		JobinfoDAO dao = DAOFactory.getInstance().getJobinfoDAO();
		List list=dao.findJobByputdate(n);
		dao.destroy();
		return list;
	}
	
	public Page  findJobinfoBysim(int pagenum, int pagelen,String byjob,String byaddress,String bycalling){
	JobinfoDAO dao = DAOFactory.getInstance().getJobinfoDAO();
	Page page=dao.findJobinfoBysim(pagenum, pagelen, byjob, byaddress, bycalling);
	dao.destroy();
	return page;
   }

	public Page  findJobinfoByhigh(int pagenum, int pagelen,String byjob,String byaddress,String bycalling,String bytime,String bykind
			,String bydegree,String byyear, String bywage,String bycorpkind ,String keyname){
		
		JobinfoDAO dao = DAOFactory.getInstance().getJobinfoDAO();
		Page page=dao.findJobinfoByhigh(pagenum, pagelen, byjob, byaddress, bycalling, bytime, bykind, bydegree, byyear, bywage, bycorpkind, keyname);
		dao.destroy();
		return page;
	  
	}
	
	public Page findJobletterByjobID(int pagenum, int pagelen,String jobID){
		JobletterDAO dao=DAOFactory.getInstance().getJobletterDAO();
		Page page=dao.findJobletterByjobID(pagenum, pagelen, jobID);
		dao.destroy();
		return page;
	}
	
	public int insertJobletter(JobletterTO to){
		JobletterDAO dao=DAOFactory.getInstance().getJobletterDAO();
		int i=dao.insert(to);
		dao.destroy();
		return i;
	}
	
	public int deleteJobletter(String letterID) {
		JobletterDAO dao=DAOFactory.getInstance().getJobletterDAO();
		int i=dao.delete(letterID);
		dao.destroy();
		return i;
		
	}
	
	public Page findJobletterByuserID(int pagenum, int pagelen,String userID) {
		JobletterDAO dao=DAOFactory.getInstance().getJobletterDAO();
		Page page=dao.findJobletterByuserID(pagenum, pagelen, userID);
		dao.destroy();
		return page;
	}
	public JobletterTO findJobletterByID(String letterID) {
		JobletterDAO dao=DAOFactory.getInstance().getJobletterDAO();
		JobletterTO to=dao.findJobletterByID(letterID);
		dao.destroy();
		return to;
	}
	
	public int updateLetterStatus(String letterID,int status) {
		JobletterDAO dao=DAOFactory.getInstance().getJobletterDAO();
		int i=dao.updateStatus(letterID, status);
		dao.destroy();
		return i;
	}
	public int updateRestore(String letterID,String  restore) {
		JobletterDAO dao=DAOFactory.getInstance().getJobletterDAO();
		int i=dao.updateRestore(letterID, restore);
		dao.destroy();
		return i;
	}
	public int deleteLetter(String letterID) {
		JobletterDAO dao=DAOFactory.getInstance().getJobletterDAO();
		int i=dao.delete(letterID);
		dao.destroy();
		return i;	
	}
}
