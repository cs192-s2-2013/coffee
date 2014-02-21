package com.bluecoffee.dao;

import java.util.List;

import com.bluecoffee.domain.MatFile;

public interface MatFileDao {

	public void insertData(MatFile matFile);

	public List<MatFile> getMatFileList();

	public void updateData(MatFile matFile);

	public void deleteData(String id);

	public MatFile getMatFile(String id);

	public List<MatFile> getMatFileListBySubjectName(String subjectName);
	
	public List<MatFile> getMatFileListBySubjectFolder(String subjectName, int matFolderID);
	
}
