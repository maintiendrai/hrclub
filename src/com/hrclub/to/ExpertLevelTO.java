package com.hrclub.to;

public class ExpertLevelTO {
  private String expertID;
  private int point;
  private int level;
  private String levelName="";
  private int credit;
  private int isvip;
  private float valueRate;
public int getCredit() {
	return credit;
}
public void setCredit(int credit) {
	this.credit = credit;
}
public String getExpertID() {
	return expertID;
}
public void setExpertID(String expertID) {
	this.expertID = expertID;
}
public int getIsvip() {
	return isvip;
}
public void setIsvip(int isvip) {
	this.isvip = isvip;
}
public int getLevel() {
	return level;
}
public void setLevel(int level) {
	this.level = level;
	switch(level) {
	case 1:
		this.levelName="专才";
		break;
	case 2:
		this.levelName="专家";
		break;
	case 3:
		this.levelName="大师";
		break;
	default:
		this.levelName="";
		break;
	}
}
public int getPoint() {
	return point;
}
public void setPoint(int point) {
	this.point = point;
}
public float getValueRate() {
	return valueRate;
}
public void setValueRate(float valueRate) {
	this.valueRate = valueRate;
}
public String getLevelName() {
	return levelName;
} 
}
