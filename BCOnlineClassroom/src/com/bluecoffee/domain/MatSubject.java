package com.bluecoffee.domain;

public class MatSubject {

	private int matSubjectID;
	private String subjectName;
	private String subjectDesc;

	public int getMatSubjectID(){ return matSubjectID; }
	public String getSubjectName(){ return subjectName; }
	public String getSubjectDesc(){ return subjectDesc; }
	
	public void setMatSubjectID(int matSubjectID){ this.matSubjectID = matSubjectID; }
	public void setSubjectName(String subjectName){ this.subjectName = subjectName; }
	public void setSubjectDesc(String subjectDesc){ this.subjectDesc = subjectDesc; }
}
