package com.hrclub.to;

public class MailTO {

	private int mailID;

	private String sentID;

	private int sentkind;

	private String revID;

	private int revkind;

	private String subject;

	private String context;

	private String time;

	private int status;

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public int getMailID() {
		return mailID;
	}

	public void setMailID(int mailID) {
		this.mailID = mailID;
	}

	public String getRevID() {
		return revID;
	}

	public void setRevID(String revID) {
		this.revID = revID;
	}

	public int getRevkind() {
		return revkind;
	}

	public void setRevkind(int revkind) {
		this.revkind = revkind;
	}

	public String getSentID() {
		return sentID;
	}

	public void setSentID(String sentID) {
		this.sentID = sentID;
	}

	public int getSentkind() {
		return sentkind;
	}

	public void setSentkind(int sentkind) {
		this.sentkind = sentkind;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

}
