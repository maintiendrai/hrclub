package com.hrclub.to;

import java.util.Date;

public class WorkexperienceTO {
	private int workID;
	private String userid;
	private String address="";
	private String starttime="";
	private String levertime="";
	private String compname="";
	private int comkind;
	private String info="";
	private String place="";
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getComkind() {
		return comkind;
	}
	public void setComkind(int comkind) {
		this.comkind = comkind;
	}
	public String getCompname() {
		return compname;
	}
	public void setCompname(String compname) {
		this.compname = compname;
	}
	public String getLevertime() {
		return levertime;
	}
	public void setLevertime(String levertime) {
		this.levertime = levertime;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
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
	public int getWorkID() {
		return workID;
	}
	public void setWorkID(int workID) {
		this.workID = workID;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	
	

}
