package com.hrclub.to;

public class ServerorderTO {
     
	private Integer oderID;
	private String hrID;
	private int kind;
	private String ordertitle;
	private String oderinfo;
	private int status;
	private String buytime;
	private String name;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBuytime() {
		return buytime;
	}
	public void setBuytime(String buytime) {
		this.buytime = buytime;
	}
	public String getHrID() {
		return hrID;
	}
	public void setHrID(String hrID) {
		this.hrID = hrID;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	public Integer getOderID() {
		return oderID;
	}
	public void setOderID(Integer oderID) {
		this.oderID = oderID;
	}
	public String getOderinfo() {
		return oderinfo;
	}
	public void setOderinfo(String oderinfo) {
		this.oderinfo = oderinfo;
	}
	public String getOrdertitle() {
		return ordertitle;
	}
	public void setOrdertitle(String ordertitle) {
		this.ordertitle = ordertitle;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
