package com.hrclub.to;

public class MovementTO {
private int moveID;
private int integral;
private String subject;
private String context;
private int status;
private String puttime;
private String starttime;
private String endtime;


public int getMoveID(){
	return moveID;	
}
public void setMoveID(int moveID){
	this.moveID=moveID;
}
public int getIntegral(){
	return integral;
}
public void setIntegral(int integral){
	this.integral=integral;
}
public String getSubject(){
	return subject;
}
public void setSubject(String subject){
	this.subject=subject;
}
public String getContext(){
	return context;
}
public void setContext(String context){
	this.context=context;
}
public int getStatus(){
	return status;
}
public void setStatus(int status){
	this.status=status;
}
public String getPuttime(){
	return puttime;
}
public void setPuttime(String puttime){
	this.puttime=puttime;
}
public String getStarttime(){
	return starttime;
}
public void setStarttime(String starttime){
	this.starttime=starttime;
}
public String getEndtime(){
	return endtime;
}
public void setEndtime(String endtime){
	this.endtime=endtime;
}
}
