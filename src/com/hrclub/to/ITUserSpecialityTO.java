package com.hrclub.to;

import java.util.List;

public class ITUserSpecialityTO {
	private String userid;
	private String name="";
	private String specialityID="";
	private int degree;
	private String educate="";
	private String school="";
	private int core;
	private int wage;
	private String city="";
	private String hortation="";
	private int workyear;
	private int kind;
	private String province="";
	private String positiontype="";
	private String selfvalue="";
	private String train="";
	private String namekey="";
	
	private List<ProjectTO> listProject;
	private List<CertificateTO> listCertificate;
	private List<WorkexperienceTO> listWorkexperience;
	private List<ITskillTO> listITskill;
	private List<LanguageTO> listLanguage;
	
	public int getCore() {
		return core;
	}
	public void setCore(int core) {
		this.core = core;
	}
	public int getDegree() {
		return degree;
	}
	public void setDegree(int degree) {
		this.degree = degree;
	}
	public String getEducate() {
		return educate;
	}
	public void setEducate(String educate) {
		this.educate = educate;
	}
	public String getHortation() {
		return hortation;
	}
	public void setHortation(String hortation) {
		this.hortation = hortation;
	}
	public String getPositiontype() {
		return positiontype;
	}
	public void setPositiontype(String positiontype) {
		this.positiontype = positiontype;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getSelfvalue() {
		return selfvalue;
	}
	public void setSelfvalue(String selfvalue) {
		this.selfvalue = selfvalue;
	}
	public String getSpecialityID() {
		return specialityID;
	}
	public void setSpecialityID(String specialityID) {
		this.specialityID = specialityID;
	}
	public String getTrain() {
		return train;
	}
	public void setTrain(String train) {
		this.train = train;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public List<CertificateTO> getListCertificate() {
		return listCertificate;
	}
	public void setListCertificate(List<CertificateTO> listCertificate) {
		this.listCertificate = listCertificate;
	}
	public List<ITskillTO> getListITskill() {
		return listITskill;
	}
	public void setListITskill(List<ITskillTO> listITskill) {
		this.listITskill = listITskill;
	}
	public List<LanguageTO> getListLanguage() {
		return listLanguage;
	}
	public void setListLanguage(List<LanguageTO> listLanguage) {
		this.listLanguage = listLanguage;
	}
	public List<ProjectTO> getListProject() {
		return listProject;
	}
	public void setListProject(List<ProjectTO> listProject) {
		this.listProject = listProject;
	}
	public List<WorkexperienceTO> getListWorkexperience() {
		return listWorkexperience;
	}
	public void setListWorkexperience(List<WorkexperienceTO> listWorkexperience) {
		this.listWorkexperience = listWorkexperience;
	}
	public int getWage() {
		return wage;
	}
	public void setWage(int wage) {
		this.wage = wage;
	}
	public String getNamekey() {
		return namekey;
	}
	public void setNamekey(String namekey) {
		this.namekey = namekey;
	}
	public int getWorkyear() {
		return workyear;
	}
	public void setWorkyear(int workyear) {
		this.workyear = workyear;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	

}
