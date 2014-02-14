package com.bluecoffee.dao;

import java.util.List;

import com.bluecoffee.domain.MatFile;

public interface MatFileDao {

	public void insertData(MatFile matFile);

	public List<MatFile> getMatFileList();

	public void updateData(MatFile matFile);

	public void deleteData(String id);

	public MatFile getMatFile(String id);

}
