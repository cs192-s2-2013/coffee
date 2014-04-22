package com.bluecoffee.dao;

import java.util.List;

import com.bluecoffee.domain.MatFolder;

public interface MatFolderDao {

	public List<MatFolder> getMatFolderList();
	public int getMatFolderIDbyName(String name);
	public void insertCategory(MatFolder matFolder);
	public void deleteCategory(int matFolderID);
	public void deleteFolder(int id);
	
}