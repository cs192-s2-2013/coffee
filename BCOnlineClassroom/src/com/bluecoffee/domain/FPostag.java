package com.bluecoffee.domain;

public class FPostag {
	private int fPostagID;
	private int fPostID;
	private int fTagID;
	
	public int getFPostagID(){ return fPostagID; }
	public int getFPostID(){ return fPostID; }
	public int getFTagID(){ return fTagID; }
	
	public void setFPostagID(int fPostagID){ this.fPostagID = fPostagID; }
	public void setFPostID(int fPostID){ this.fPostID = fPostID; }
	public void setFTagID(int fTagID){ this.fTagID = fTagID; }
}
