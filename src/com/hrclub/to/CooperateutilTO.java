package com.hrclub.to;

public class CooperateutilTO {
     
	private int utilID;    //��λID
	private int utilkind;  //��λ����
	private String utilname; //��λ����
	private String contactname; //��ϵ��
	private String telephone; //��ϵ�绰
	private String address;  //��ϵ��ַ
	private String email;    //�ʼ�
	private String utilinfo; //��λ���
	
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
