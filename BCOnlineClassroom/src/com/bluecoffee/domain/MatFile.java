package com.bluecoffee.domain;

import java.util.Date;

public class MatFile {

	private int matFileID;
	private String fileName;
	private String fileType;
	private long fileSize;
	private Date uploadDate;
	private String path;
	private int matSubjectID;
	private int matFolderID;
	private int userID;
	private String fileDesc;
	private String uploader; //not part of database

	public int getMatFileID(){ return matFileID; }
	public String getFileName(){ return fileName; }
	public String getFileType(){ return fileType; }
	public long getFileSize(){ return fileSize; }
	public Date getUploadDate(){ return uploadDate; }
	public String getPath(){ return path; }
	public int getMatSubjectID(){ return matSubjectID; }
	public int getMatFolderID(){ return matFolderID; }
	public int getUserID(){ return userID; }
	public String getFileDesc(){ return fileDesc; }
	public String getUploader(){ return uploader; }
	
	public void setMatFileID(int matFileID){ this.matFileID = matFileID; }
	public void setFileName(String fileName){ this.fileName = fileName; }
	public void setFileType(String fileType){ this.fileType = fileType; }
	public void setFileSize(long fileSize){ this.fileSize = fileSize; }
	public void setUploadDate(Date uploadDate){ this.uploadDate = uploadDate; }
	public void setPath(String path){ this.path = path; }
	public void setMatSubjectID(int matSubjectID){ this.matSubjectID =  matSubjectID; }
	public void setMatFolderID(int matFolderID){ this.matFolderID =  matFolderID; }
	public void setUserID(int userID){ this.userID = userID; }
	public void setFileDesc(String fileDesc){ this.fileDesc = fileDesc; }
	public void setUploader(String uploader){ this.uploader = uploader; }
}