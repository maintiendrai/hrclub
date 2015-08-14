package com.hrclub.to;

public class UserLevelTO {
	private String userID;
	  private int point; 
	  private int credit;
	  private int isvip;
	  private float valueRate;
	public int getCredit() {
		return credit;
	}
	public void setCredit(int credit) {
		this.credit = credit;
	}
	public int getIsvip() {
		return isvip;
	}
	public void setIsvip(int isvip) {
		this.isvip = isvip;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public float getValueRate() {
		return valueRate;
	}
	public void setValueRate(float valueRate) {
		this.valueRate = valueRate;
	}
}
