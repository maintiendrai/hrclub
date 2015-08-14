package com.hrclub.to;

public class AdvertisementTO {
	private int adID;
	private String adName="";
	private int type;
	private int industryID=0;
	private String areaID="";
	private int trainID;
	private int workID;
	private String expertID=""; 
	private String adurl="";
	private String clickurl="";
	
	private int status;
	public String getAreaID() {
		return areaID;
	}
	public void setAreaID(String areaID) {
		this.areaID = areaID;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getAdID() {
		return adID;
	}
	public void setAdID(int adID) {
		this.adID = adID;
	}
	public String getAdurl() {
		return adurl;
	}
	public void setAdurl(String adurl) {
		this.adurl = adurl;
	}
	public String getClickurl() {
		return clickurl;
	}
	public void setClickurl(String clickurl) {
		this.clickurl = clickurl;
	}
	public String getExpertID() {
		return expertID;
	}
	public void setExpertID(String expertID) {
		this.expertID = expertID;
	}
	public int getIndustryID() {
		return industryID;
	}
	public void setIndustryID(int industryID) {
		this.industryID = industryID;
	}
	public int getTrainID() {
		return trainID;
	}
	public void setTrainID(int trainID) {
		this.trainID = trainID;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getWorkID() {
		return workID;
	}
	public void setWorkID(int workID) {
		this.workID = workID;
	}
	public String getAdName() {
		return adName;
	}
	public void setAdName(String adName) {
		this.adName = adName;
	}
  
}
