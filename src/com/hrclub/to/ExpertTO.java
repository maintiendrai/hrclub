package com.hrclub.to;
import java.util.*;
import com.hrclub.view.*;
import com.hrclub.model.*;

public class ExpertTO {
	private String expertid;
	
	private int isvip;
	private int point;
	private int level=1;
	private String levelName="";
	private int credit;

	private String expertname;

	private String password;
	private String originPassword;
	private int industryID;
	private String bankAccount="";
	private int banktype=0;
	private String bankName="其他";
	
	private String keywords;
	private String resume;
	private int timetype;
	private String education;
	private String history; 
	private String face=UserManager.DEFAULT_USER_IMG;
	private int type;

	private String prov;

	private String city;
	
	private int workyears;
	
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
	private String proxyType;
	
	private List trainings;
	private List works; 
	
	private int visitedTimes;
	private int openType=3;
	
	private List blogs;
	
	public List getBlogs() {
		return blogs;
	}
	public void setBlogs(List blogs) {
		this.blogs = blogs;
	}
	public int getVisitedTimes() {
		return visitedTimes;
	}
	public void setVisitedTimes(int visitedTimes) {
		this.visitedTimes = visitedTimes;
	}
	public List getTrainings() {
		return trainings;
	}
	public void setTrainings(List trainings) {
		this.trainings = trainings;
	}
	public List getWorks() {
		return works;
	}
	public void setWorks(List works) {
		this.works = works;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
		switch(banktype) {
		case 1:
			this.bankName="工商银行";
			break;
		case 2:
			this.bankName="农业银行";
			break;
		case 3:
			this.bankName="招商银行";
			break;
		case 4:
			this.bankName="建设银行";
			break;
		case 5:
			this.bankName="中国银行";
			break;
		case 6:
			this.bankName="交通银行";
			break; 
		case 7:
			this.bankName="兴业银行";
			break; 
		}
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
	public String getDesc() {
		return Desc;
	}
	public void setDesc(String desc) {
		Desc = desc;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getExpertid() {
		return expertid;
	}
	public void setExpertid(String expertid) {
		this.expertid = expertid;
	}
	public String getExpertname() {
		return expertname;
	}
	public void setExpertname(String expertname) {
		this.expertname = expertname;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getHistory() {
		return history;
	}
	public void setHistory(String history) {
		this.history = history;
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
	public int getIndustryID() {
		return industryID;
	}
	public void setIndustryID(int industryID) {
		this.industryID = industryID;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
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
	public String getQqmsn() {
		return qqmsn;
	}
	public void setQqmsn(String qqmsn) {
		this.qqmsn = qqmsn;
	}
	public String getResume() {
		return resume;
	}
	public void setResume(String resume) {
		this.resume = resume;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getTimetype() {
		return timetype;
	}
	public void setTimetype(int timetype) {
		this.timetype = timetype;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getWorkyears() {
		return workyears;
	}
	public void setWorkyears(int workyears) {
		this.workyears = workyears;
	}
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
	public String getFace() {
		return face;
	}
	public void setFace(String face) {
		this.face = face;
	}
	public String getProxyType() {
		return proxyType;
	}
	public void setProxyType(String proxyType) {
		this.proxyType = proxyType;
	}
	public String getLevelName() {
		return levelName;
	}
	public int getOpenType() {
		return openType;
	}
	public void setOpenType(int openType) {
		this.openType = openType;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getOriginPassword() {
		return originPassword;
	}
	public void setOriginPassword(String originPassword) {
		this.originPassword = originPassword;
	} 
}
