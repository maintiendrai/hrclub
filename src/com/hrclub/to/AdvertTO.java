package com.hrclub.to;

public class AdvertTO {
	private int adID;
	private String adname;
	private String adpurl;
	private String weburl;
	private int type;
	private int status;
	public int getAdID() {
		return adID;
	}
	public void setAdID(int adID) {
		this.adID = adID;
	}
	public String getAdname() {
		return adname;
	}
	public void setAdname(String adname) {
		this.adname = adname;
	}
	public String getAdpurl() {
		return adpurl;
	}
	public void setAdpurl(String adpurl) {
		this.adpurl = adpurl;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getWeburl() {
		return weburl;
	}
	public void setWeburl(String weburl) {
		this.weburl = weburl;
	}
}
