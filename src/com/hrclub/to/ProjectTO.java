package com.hrclub.to;

import java.util.Date;

public class ProjectTO {
	
	private int projectID;
	private String userid;
	private String projectname;
	private String starttime;
	private String endtime;
	private String hardware;
	private String software;
	private String projectinfo;
	private String place;
	private int projectsize;
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getHardware() {
		return hardware;
	}
	public void setHardware(String hardware) {
		this.hardware = hardware;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public int getProjectID() {
		return projectID;
	}
	public void setProjectID(int projectID) {
		this.projectID = projectID;
	}
	public String getProjectinfo() {
		return projectinfo;
	}
	public void setProjectinfo(String projectinfo) {
		this.projectinfo = projectinfo;
	}
	public String getProjectname() {
		return projectname;
	}
	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}
	public int getProjectsize() {
		return projectsize;
	}
	public void setProjectsize(int projectsize) {
		this.projectsize = projectsize;
	}
	public String getSoftware() {
		return software;
	}
	public void setSoftware(String software) {
		this.software = software;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
}
