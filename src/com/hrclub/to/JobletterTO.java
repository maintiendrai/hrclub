package com.hrclub.to;

public class JobletterTO {
	private int letterID;
	private String userID;
	private String jobID;
	private String content="";
	private String restore="";
	private int status;
	private String jobtitle;
	private String jobtime="";
	public String getJobtime() {
		return jobtime;
	}
	public void setJobtime(String jobtime) {
		if(jobtime!=null)
			this.jobtime = jobtime;
	}
	public String getJobtitle() {
		return jobtitle;
	}
	public void setJobtitle(String jobtitle) {
		this.jobtitle = jobtitle;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getJobID() {
		return jobID;
	}
	public void setJobID(String jobID) {
		this.jobID = jobID;
	}
	public int getLetterID() {
		return letterID;
	}
	public void setLetterID(int letterID) {
		this.letterID = letterID;
	}
	public String getRestore() {
		return restore;
	}
	public void setRestore(String restore) {
		if(restore!=null)
		this.restore = restore;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	

}
