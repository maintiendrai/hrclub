package com.hrclub.to;

public class UserLoginTO {
 private int loginID;
 private String userID;
 private int type;
 private int loginTimes;
 private String lastLoginTime;
public String getLastLoginTime() {
	return lastLoginTime;
}
public void setLastLoginTime(String lastLoginTime) {
	this.lastLoginTime = lastLoginTime;
}
public int getLoginID() {
	return loginID;
}
public void setLoginID(int loginID) {
	this.loginID = loginID;
}
public int getLoginTimes() {
	return loginTimes;
}
public void setLoginTimes(int loginTimes) {
	this.loginTimes = loginTimes;
}
public int getType() {
	return type;
}
public void setType(int type) {
	this.type = type;
}
public String getUserID() {
	return userID;
}
public void setUserID(String userID) {
	this.userID = userID;
} 
}
