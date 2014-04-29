package com.bluecoffee.dao;

import java.util.List;

import com.bluecoffee.domain.MatFile;

public interface MatFileDao {

	public void insertData(MatFile matFile);
	public List<MatFile> getMatFileList();
	//public void updateData(MatFile matFile);
	public void deleteData(int id);
	public MatFile getMatFile(int id);
	public List<MatFile> getMatFileListBySubjectName(String subjectName);
	public List<MatFile> getMatFileListBySubjectFolder(String subjectName, int matFolderID);
	public List<MatFile> getMatFileListByDescription(String searchString);
	public List<MatFile> getMatFileListByFilename(String filename);
	public int getIDByMatFile(MatFile matFile);
}
