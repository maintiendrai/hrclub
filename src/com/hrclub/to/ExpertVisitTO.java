package com.hrclub.to;

public class ExpertVisitTO {
	private String expertID;
	  private int visitID;
	  private int times; 
	  private String lastVisitTime;
	public String getExpertID() {
		return expertID;
	}
	public void setExpertID(String expertID) {
		this.expertID = expertID;
	}
	public String getLastVisitTime() {
		return lastVisitTime;
	}
	public void setLastVisitTime(String lastVisitTime) {
		this.lastVisitTime = lastVisitTime;
	}
	public int getTimes() {
		return times;
	}
	public void setTimes(int times) {
		this.times = times;
	}
	public int getVisitID() {
		return visitID;
	}
	public void setVisitID(int visitID) {
		this.visitID = visitID;
	}
}
