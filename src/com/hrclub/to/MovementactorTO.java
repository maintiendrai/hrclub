package com.hrclub.to;

public class MovementactorTO {

	private int maID;
	
	private int moveID;

	private String memberID;

	private int kind;

	private String starttime;

	private int status;
	
	private String title;
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getMaID() {
		return maID;
	}

	public void setMaID(int maID) {
		this.maID = maID;
	}

	public int getKind() {
		return kind;
	}

	public void setKind(int kind) {
		this.kind = kind;
	}

	public String getMemberID() {
		return memberID;
	}

	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}

	public int getMoveID() {
		return moveID;
	}

	public void setMoveID(int moveID) {
		this.moveID = moveID;
	}

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
