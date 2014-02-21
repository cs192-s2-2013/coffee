package com.bluecoffee.services;

import java.util.List;

import com.bluecoffee.domain.MatFile;

public interface MatFileService {

	public void insertData(MatFile matFile);

	public List<MatFile> getMatFileList();

	public void deleteData(String id);

	public MatFile getMatFile(String id);

	public void updateData(MatFile matFile);
	
	public List<MatFile> getMatFileListBySubjectName(String subjectName);
	
	public List<MatFile> getMatFileListBySubjectFolder(String subjectName, int matFolderID);
}
