package com.bluecoffee.domain;

public class Schedule {
	private int schedID;
	private String schedStream;
	private String schedDesc;
	private int userID;
	
	public int getSchedID() {return schedID;}
	public String getSchedStream() {return schedStream;}
	public String getSchedDesc() {return schedDesc;}
	public int getUserID() {return userID;}
	
	public void setSchedID(int schedID) {this.schedID = schedID;}
	public void setSchedStream(String schedStream) {this.schedStream = schedStream;}
	public void setSchedDesc(String schedDesc) {this.schedDesc = schedDesc;}
	public void setUserID(int userID) {this.userID = userID;}
}
