package com.hrclub.to;

public class CertificateTO {
	private int certificateID;
	private String userid;
	private int kind;
	private String crertname;
	private String number;
	private float grade;
	public int getCertificateID() {
		return certificateID;
	}
	public void setCertificateID(int certificateID) {
		this.certificateID = certificateID;
	}
	public String getCrertname() {
		return crertname;
	}
	public void setCrertname(String crertname) {
		this.crertname = crertname;
	}
	public float getGrade() {
		return grade;
	}
	public void setGrade(float grade) {
		this.grade = grade;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
}
