package com.hrclub.to;

import java.util.Date;

public class JobinfoTO {
	private int jobID;

	private String hrID;
	private int specialityID;

	private String positiontype="";
	private String jobtitle="";

	private int degree;
	private String request="";
	private String deal="";
	private int status;
	
	private String corporation="";
	private int num;
	private String puttime;
	private String starttime;
	private String endtime;
	private int wage;
	private String province="";
	
	private String city="";
	
	private int kind;
	
	private int year;
	private String explains="";
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDeal() {
		return deal;
	}
	public void setDeal(String deal) {
		this.deal = deal;
	}
	public int getDegree() {
		return degree;
	}
	public void setDegree(int degree) {
		this.degree = degree;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getExplain() {
		return explains;
	}
	public void setExplain(String explains) {
		this.explains = explains;
	}
	public String getHrID() {
		return hrID;
	}
	public void setHrID(String hrID) {
		this.hrID = hrID;
	}
	public int getJobID() {
		return jobID;
	}
	public void setJobID(int jobID) {
		this.jobID = jobID;
	}
	public String getJobtitle() {
		return jobtitle;
	}
	public void setJobtitle(String jobtitle) {
		this.jobtitle = jobtitle;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getPositiontype() {
		return positiontype;
	}
	public void setPositiontype(String positiontype) {
		this.positiontype = positiontype;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getPuttime() {
		return puttime;
	}
	public void setPuttime(String puttime) {
		this.puttime = puttime;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public int getSpecialityID() {
		return specialityID;
	}
	public void setSpecialityID(int specialityID) {
		this.specialityID = specialityID;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getWage() {
		return wage;
	}
	public void setWage(int wage) {
		this.wage = wage;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getCorporation() {
		return corporation;
	}
	public void setCorporation(String corporation) {
		this.corporation = corporation;
	}
	public String getExplains() {
		return explains;
	}
	public void setExplains(String explains) {
		this.explains = explains;
	}
	
	
	

}
