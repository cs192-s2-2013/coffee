package com.bluecoffee.domain;

public class MatFile {

	private int matFileID;
	private String fileName;
	private String fileType;
	private String fileSize;
	private String uploadDate;
	private int matSubjectID;
	private int matFolderID;

	public int getMatFileID(){ return matFileID; }
	public String getFileName(){ return fileName; }
	public String getFileType(){ return fileType; }
	public String getFileSize(){ return fileSize; }
	public String getUploadDate(){ return uploadDate; }
	public int getMatSubjectID(){ return matSubjectID; }
	public int getMatFolderID(){ return matFolderID; }
	
	public void setMatFileID(int matFileID){ this.matFileID = matFileID; }
	public void setFileName(String fileName){ this.fileName = fileName; }
	public void setFileType(String fileType){ this.fileType = fileType; }
	public void setFileSize(String fileSize){ this.fileSize = fileSize; }
	public void setUploadDate(String uploadDate){ this.uploadDate = uploadDate; }
	public void setMatSubjectID(int matSubjectID){ this.matSubjectID =  matSubjectID; }
	public void setMatFolderID(int matFolderID){ this.matFolderID =  matFolderID; }
	
}
