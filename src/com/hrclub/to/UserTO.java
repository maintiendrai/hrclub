package com.hrclub.to;

import com.hrclub.view.Location;

public class UserTO {
	private String userid;

	private String username;

	private String password;

	private int type;

	private String prov;

	private String city;
	
	private int status;
	
	private String identifyCard;
	private int identifyType;
	private String address;
	private String postcode;
	private String tel;
	private String mobile;
	private String fax;
	private String email;
	private String qqmsn;
	private String Desc; 
	
	private String bankAccount="";
	private int banktype=-1;
	
	private int openType=3;
	
	public int getOpenType() {
		return openType;
	}

	public void setOpenType(int openType) {
		this.openType = openType;
	}

	public String getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}

	public int getBanktype() {
		return banktype;
	}

	public void setBanktype(int banktype) {
		this.banktype = banktype;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getCity() {
		return city;
	}
	public String getCityName() {
		return Location.getCityName( city);
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getProv() {
		return prov;
	}
	public String getProvName() {
		return Location.getProvName( prov);
	}

	public void setProv(String prov) {
		this.prov = prov;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDesc() {
		return Desc;
	}

	public void setDesc(String desc) {
		Desc = desc;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getIdentifyCard() {
		return identifyCard;
	}

	public void setIdentifyCard(String identifyCard) {
		this.identifyCard = identifyCard;
	}

	public int getIdentifyType() {
		return identifyType;
	}

	public void setIdentifyType(int identifyType) {
		this.identifyType = identifyType;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getQqmsn() {
		return qqmsn;
	}

	public void setQqmsn(String qqmsn) {
		this.qqmsn = qqmsn;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
}
