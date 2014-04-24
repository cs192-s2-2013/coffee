package com.bluecoffee.domain;

public class MatFileTag {
	private int matFileTagID;
	private int matFileID;
	private int matTagID;
	
	public int getMatFileTagID(){ return matFileTagID; }
	public int getMatFileID(){ return matFileID; }
	public int getMatTagID(){ return matTagID; }
	
	public void setMatFileTagID(int matFileTagID){ this.matFileTagID = matFileTagID; }
	public void setMatFileID(int matFileID){ this.matFileID = matFileID; }
	public void setMatTagID(int matTagID){ this.matTagID = matTagID; }
}
