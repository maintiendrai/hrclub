package com.hrclub.to;

public class CooperateutilTO {
     
	private int utilID;    //单位ID
	private int utilkind;  //单位类型
	private String utilname; //单位名称
	private String contactname; //联系人
	private String telephone; //联系电话
	private String address;  //联系地址
	private String email;    //邮件
	private String utilinfo; //单位简介
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContactname() {
		return contactname;
	}
	public void setContactname(String contactname) {
		this.contactname = contactname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public int getUtilID() {
		return utilID;
	}
	public void setUtilID(int utilID) {
		this.utilID = utilID;
	}
	public String getUtilinfo() {
		return utilinfo;
	}
	public void setUtilinfo(String utilinfo) {
		this.utilinfo = utilinfo;
	}
	public int getUtilkind() {
		return utilkind;
	}
	public void setUtilkind(int utilkind) {
		this.utilkind = utilkind;
	}
	public String getUtilname() {
		return utilname;
	}
	public void setUtilname(String utilname) {
		this.utilname = utilname;
	}
}
