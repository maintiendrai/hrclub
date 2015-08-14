package com.hrclub.to;

import java.util.Date;

public class HRinfoTO {

	private String hrID;
	private String password;
	private String name="";
	private int status;
	private String province;
	private String city;
	private int calling;
	
	private String telephone="";
	private String mobilephone="";
	private String email="";
	private String address="";
	private String corporation="";
	private int corpkind;
	private String corinfo="";
	private String website="";
	private String born;
	private int sex;
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getCalling() {
		return calling;
	}
	public void setCalling(int calling) {
		this.calling = calling;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCorinfo() {
		return corinfo;
	}
	public void setCorinfo(String corinfo) {
		this.corinfo = corinfo;
	}
	public int getCorpkind() {
		return corpkind;
	}
	public void setCorpkind(int corpkind) {
		this.corpkind = corpkind;
	}
	public String getCorporation() {
		return corporation;
	}
	public void setCorporation(String corporation) {
		this.corporation = corporation;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHrID() {
		return hrID;
	}
	public void setHrID(String hrID) {
		this.hrID = hrID;
	}
	public String getMobilephone() {
		return mobilephone;
	}
	public void setMobilephone(String mobilephone) {
		this.mobilephone = mobilephone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getBorn() {
		return born;
	}
	public void setBorn(String born) {
		this.born = born;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	
	

}
