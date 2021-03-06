package com.bluecoffee.services;

import java.util.List;

import com.bluecoffee.domain.MatFile;

public interface MatFileService {

	public void insertData(MatFile matFile);

	public List<MatFile> getMatFileList();

	public void deleteData(int id);

	public MatFile getMatFile(int id);

	//public void updateData(MatFile matFile);
	
	public List<MatFile> getMatFileListBySubjectName(String subjectName);
	public List<MatFile> getMatFileListBySubjectFolder(String subjectName, int matFolderID);
	public List<MatFile> getMatFileListByFilename(String filename);
	public List<MatFile> getMatFileListByDescription(String searchString);
	
	public String getFileNameByID(int id);
	
	public String getFilePathByID(int id);
	
	public int getIDByMatFile(MatFile matFile);
	
}
