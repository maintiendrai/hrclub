package com.hrclub.model;

import java.util.List;

import com.hrclub.model.dao.CertificateDAO;
import com.hrclub.model.dao.ITUserDAO;
import com.hrclub.model.dao.ITUserSpecialityDAO;
import com.hrclub.model.dao.ITskillDAO;
import com.hrclub.model.dao.ItintegralDAO;
import com.hrclub.model.dao.LanguageDAO;
import com.hrclub.model.dao.ProjectDAO;
import com.hrclub.model.dao.WorkexperienceDAO;
import com.hrclub.to.CertificateTO;
import com.hrclub.to.ITUserSpecialityTO;
import com.hrclub.to.ITUserTO;
import com.hrclub.to.ITskillTO;
import com.hrclub.to.ItintegralTO;
import com.hrclub.to.LanguageTO;
import com.hrclub.to.Page;
import com.hrclub.to.ProjectTO;
import com.hrclub.to.WorkexperienceTO;
import com.hrclub.util.Logger;

public class ITUserManager {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	private static ITUserManager instance = null;

	private ITUserManager() {

	}

	public static ITUserManager getInstance() {
		if (instance == null) {
			instance = new ITUserManager();
		}
		return instance;
	}
//	IT基本信息的操作
	public String getUserPassword(String userID) {

		ITUserDAO dao = DAOFactory.getInstance().getITUserDAO();
		String pw = dao.getUserPassword(userID);
		dao.destroy();
		return pw;
	}

	public boolean isUserExist(String userid) {
		ITUserDAO dao = DAOFactory.getInstance().getITUserDAO();
		boolean flag = dao.isUserExist(userid);
		dao.destroy();
		return flag;

	}

	
	public int updateITUser(ITUserTO to) {
		ITUserDAO dao = DAOFactory.getInstance().getITUserDAO();
		int i = dao.update(to);
		dao.destroy();
		return i;
	}

	public List getAllUserEmail() {

		ITUserDAO dao = DAOFactory.getInstance().getITUserDAO();
		List list = dao.getAllUserEmail();
		dao.destroy();
		return list;
	}

	public String getUserEmail(String userID) {

		ITUserDAO dao = DAOFactory.getInstance().getITUserDAO();
		String email = dao.getUserEmail(userID);
		dao.destroy();
		return email;
	}

	public int updateStatus(String userid, int status) {
		ITUserDAO dao = DAOFactory.getInstance().getITUserDAO();
		int i = dao.updateStatus(userid, status);
		dao.destroy();
		return i;

	}
	
	public int updateCore(String userid,int core)
	{
		ITUserDAO dao = DAOFactory.getInstance().getITUserDAO();
		int i = dao.updateCore(userid, core);
		dao.destroy();
		return i;
	}

	public int regeditITUser(ITUserTO to) {
		ITUserDAO dao = DAOFactory.getInstance().getITUserDAO();
		int i = dao.regedit(to);
		dao.destroy();
		ItintegralDAO itdao = DAOFactory.getInstance().getItintegralDAO();
		ItintegralTO itto = new ItintegralTO();
		itto.setItID(to.getUserid());
		itto.setNum(100);
		itdao.insert(itto);
		itdao.destroy();
		return i;

	}
	public int insertITUser(ITUserTO to) {
		ITUserDAO dao = DAOFactory.getInstance().getITUserDAO();
		int i = dao.insert(to);
		dao.destroy();
		return i;

	}


	public int deleteITUser(String userid) {
		ITUserDAO dao = DAOFactory.getInstance().getITUserDAO();
		int i = dao.delete(userid);
		dao.destroy();
		return i;
	}

	public ITUserTO findUserByID(String userid) {
		ITUserDAO dao = DAOFactory.getInstance().getITUserDAO();
		
		ITUserTO to = dao.findUserByID(userid);
		dao.destroy();
		return to;
	}
	public int updatePassword(String userid,String password){
		ITUserDAO dao = DAOFactory.getInstance().getITUserDAO();
		int i=dao.updatePassword(userid, password);
		dao.destroy();
		return i;
	}
	public Page findUserByPage(int pagenum, int pagelen)
	{
		ITUserDAO dao = DAOFactory.getInstance().getITUserDAO();
		Page page=dao.findUserByPage(pagenum, pagelen);
		dao.destroy();
		return page;
	}

	public Page findUserBycore(int pagenum, int pagelen)
	{
		ITUserDAO dao = DAOFactory.getInstance().getITUserDAO();
		Page page=dao.findUserBycore(pagenum, pagelen);
		dao.destroy();
		return page;
	}

	
	
public Page findUserBysim(int pagenum, int pagelen,String spech, String byjobh,String byaddressh ,String finkey){
	ITUserSpecialityDAO dao = DAOFactory.getInstance().getITUserSpecialityDAO();
	Page page=dao.findUserBysim(pagenum, pagelen, spech, byjobh, byaddressh, finkey);
	dao.destroy();
	return page;	
	}
	
public Page findUserByshigh(int pagenum, int pagelen, String spech,
		String byjobh, String byaddressh, String finkey,String byitskillh,
		String bykind,String degree,String crertname,String workyear,
		String bywage,String school,String languagename,String core) {
	ITUserSpecialityDAO dao = DAOFactory.getInstance().getITUserSpecialityDAO();
	Page page=dao.findUserByshigh(pagenum, pagelen, spech, byjobh, byaddressh, finkey, byitskillh, 
			 bykind,degree, crertname, workyear, bywage, school, languagename,core);
	dao.destroy();
	return page;	
	
}

	//对工作经历的操作
	public WorkexperienceTO findITworkBywordID(int workID) {
		WorkexperienceDAO dao = DAOFactory.getInstance().getWorkexperienceDAO();
		WorkexperienceTO to = dao.findITworkBywordID(workID);
		dao.destroy();
		return to;

	}

	public List findITworkByID(String userid) {
		WorkexperienceDAO dao = DAOFactory.getInstance().getWorkexperienceDAO();
		List list = dao.findITworkByID(userid);
		dao.destroy();
		return list;
	}

	public int insertWork(WorkexperienceTO to) {
		WorkexperienceDAO dao = DAOFactory.getInstance().getWorkexperienceDAO();
		int i = dao.insert(to);
		dao.destroy();
		return i;
	}

	public int updateWrok(WorkexperienceTO to) {
		WorkexperienceDAO dao = DAOFactory.getInstance().getWorkexperienceDAO();
		int i = dao.update(to);
		dao.destroy();
		return i;
	}

	public int deleteWrok(int workID) {
		WorkexperienceDAO dao = DAOFactory.getInstance().getWorkexperienceDAO();
		int i = dao.delete(workID);
		dao.destroy();
		return i;
	}
//对项目经历的操作
	public ProjectTO findITprojectByprojectID(int projectID) {
		ProjectDAO dao = DAOFactory.getInstance().getProjectDAO();
		ProjectTO to = dao.findITprojectByprojectID(projectID);
		dao.destroy();
		return to;
	}

	public List findITprojectByuserID(String userid) {
		ProjectDAO dao = DAOFactory.getInstance().getProjectDAO();
		List list = dao.findITprojectByuserID(userid);
		dao.destroy();
		return list;
	}

	public int insertProject(ProjectTO to) {
		ProjectDAO dao = DAOFactory.getInstance().getProjectDAO();
		int i = dao.insert(to);
		dao.destroy();
		return i;

	}

	public int updateProject(ProjectTO to) {

		ProjectDAO dao = DAOFactory.getInstance().getProjectDAO();
		int i = dao.update(to);
		dao.destroy();
		return i;
	}

	public int deleteProject(int projectID) {

		ProjectDAO dao = DAOFactory.getInstance().getProjectDAO();
		int i = dao.delete(projectID);
		dao.destroy();
		return i;
	}
	
	
//对证书的操作
	public CertificateTO findCertificateByID(int certificateID) {
		CertificateDAO dao = DAOFactory.getInstance().getCertificateDAO();
		CertificateTO to = dao.findCertificateByID(certificateID);
		dao.destroy();
		return to;
	}

	public List findCertificateByID(String userid) {
		CertificateDAO dao = DAOFactory.getInstance().getCertificateDAO();
		List list = dao.findCertificateByID(userid);
		dao.destroy();
		return list;
	}

	public boolean isCertExist(String userid,String crertname){
		CertificateDAO dao = DAOFactory.getInstance().getCertificateDAO();
		boolean flag = dao.isCertExist(userid,crertname);
		dao.destroy();
		return flag;

	}
	public boolean isCertExisttwo(String userid,String crertname,int certificateID) {
		CertificateDAO dao = DAOFactory.getInstance().getCertificateDAO();
		boolean flag = dao.isCertExisttwo(userid,crertname,certificateID);
		dao.destroy();
		return flag;
	}
	
	public int inserCertificatet(CertificateTO to) {
		CertificateDAO dao = DAOFactory.getInstance().getCertificateDAO();
		int i = dao.insert(to);
		dao.destroy();
		return i;

	}

	public int updateCertificate(CertificateTO to) {

		CertificateDAO dao = DAOFactory.getInstance().getCertificateDAO();
		int i = dao.update(to);
		dao.destroy();
		return i;
	}

	public int deleteCertificate(int certificateID) {

		CertificateDAO dao = DAOFactory.getInstance().getCertificateDAO();
		int i = dao.delete(certificateID);
		dao.destroy();
		return i;
	}
	
	//对IT技能操作
	
	public boolean isITskillExist(String userid,int skillnameID)
	{
		ITskillDAO dao = DAOFactory.getInstance().getITskillDAO();
		boolean flag = dao.isITskillExist(userid, skillnameID);
		dao.destroy();
		return flag;
		
	}
	public boolean isITskillExisttwo(String userid,int skillnameID,int skillID) {

		ITskillDAO dao = DAOFactory.getInstance().getITskillDAO();
		boolean flag = dao.isITskillExisttwo(userid, skillnameID,skillID);
		dao.destroy();
		return flag;
	}
	
	public ITskillTO findITskilleByITskillID(int skillID) {
		ITskillDAO dao = DAOFactory.getInstance().getITskillDAO();
		ITskillTO to = dao.findITskilleByITskillID(skillID);
		dao.destroy();
		return to;
	}

	public List findITskillByID(String userid) {
		ITskillDAO dao = DAOFactory.getInstance().getITskillDAO();
		List list = dao.findITskillByID(userid);
		dao.destroy();
		return list;
	}

	public int inserITskill(ITskillTO to) {
		ITskillDAO dao = DAOFactory.getInstance().getITskillDAO();
		int i = dao.insert(to);
		dao.destroy();
		return i;

	}

	public int updateITskill(ITskillTO to) {

		ITskillDAO dao = DAOFactory.getInstance().getITskillDAO();
		int i = dao.update(to);
		dao.destroy();
		return i;
	}

	public int deleteITskill(int ITskillTO) {

		ITskillDAO dao = DAOFactory.getInstance().getITskillDAO();
		int i = dao.delete(ITskillTO);
		dao.destroy();
		return i;
	}
	
	//对外语的操作
	
	public boolean isLangExist(String userid,int languagename){
		LanguageDAO dao = DAOFactory.getInstance().getLanguageDAO();
		boolean flag = dao.isLangExist(userid, languagename);
		dao.destroy();
		return flag;
	}
	public boolean isLangExisttwo(String userid,int languagename,int languageID) {
		LanguageDAO dao = DAOFactory.getInstance().getLanguageDAO();
		boolean flag = dao.isLangExisttwo(userid, languagename,languageID);
		dao.destroy();
		return flag;
	}
	
	public LanguageTO findLanguageBylanguageID(int languageID) {
		LanguageDAO dao = DAOFactory.getInstance().getLanguageDAO();
		LanguageTO to = dao.findLanguageBylanguageID(languageID);
		dao.destroy();
		return to;
	}

	public List findLanguageByID(String userid){
		LanguageDAO dao = DAOFactory.getInstance().getLanguageDAO();
		List list = dao.findLanguageByID(userid);
		dao.destroy();
		return list;
	}

	public int inserLanguage(LanguageTO to) {
		LanguageDAO dao = DAOFactory.getInstance().getLanguageDAO();
		int i = dao.insert(to);
		dao.destroy();
		return i;

	}

	public int updateLanguage(LanguageTO to) {

		LanguageDAO dao = DAOFactory.getInstance().getLanguageDAO();
		int i = dao.update(to);
		dao.destroy();
		return i;
	}

	public int deletLanguage(int languageID) {

		LanguageDAO dao = DAOFactory.getInstance().getLanguageDAO();
		int i = dao.delete(languageID);
		dao.destroy();
		return i;
	}
	
	//对专业信息操作
	
	public int insertITUserSpeciality(ITUserSpecialityTO to)
	{
		ITUserSpecialityDAO dao = DAOFactory.getInstance().getITUserSpecialityDAO();
		int i = dao.insert(to);
		dao.destroy();
		return i;
	}
	
	public boolean isUserExistSpec(String userid){
		ITUserSpecialityDAO dao = DAOFactory.getInstance().getITUserSpecialityDAO();
		boolean flag=dao.isUserExistSpec(userid);
		dao.destroy();
		return flag;
	}
	
	
	public ITUserSpecialityTO findUserSpecialityByID(String userid){
		ITUserSpecialityDAO dao = DAOFactory.getInstance().getITUserSpecialityDAO();
		ITUserSpecialityTO to = dao.findUserSpecialityByID(userid);
		dao.destroy();
		return to;
		
	}
	
	public int updateITUserSpeciality(ITUserSpecialityTO to){
		ITUserSpecialityDAO dao = DAOFactory.getInstance().getITUserSpecialityDAO();
		int i = dao.update(to);
		dao.destroy();
		return i;
		
	}
	
	public List getAllUserID() {

		ITUserDAO dao = DAOFactory.getInstance().getITUserDAO();
		List list = dao.getAllUserID();
		dao.destroy();
		return list;
	}
}
