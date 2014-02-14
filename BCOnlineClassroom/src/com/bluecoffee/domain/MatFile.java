package com.bluecoffee.domain;

public class MatFile {

	private int matFileID;
	private String fileName;
	private String fileType;
	private String fileSize;
	private String uploadDate;

	public int getMatFileID(){ return matFileID; }
	public String getFileName(){ return fileName; }
	public String getFileType(){ return fileType; }
	public String getFileSize(){ return fileSize; }
	public String getUploadDate(){ return uploadDate; }
	
	public void setMatFileID(int matFileID){ this.matFileID = matFileID; }
	public void setFileName(String fileName){ this.fileName = fileName; }
	public void setFileType(String fileType){ this.fileType = fileType; }
	public void setFileSize(String fileSize){ this.fileSize = fileSize; }
	public void setUploadDate(String uploadDate){ this.uploadDate = uploadDate; }
	
}
