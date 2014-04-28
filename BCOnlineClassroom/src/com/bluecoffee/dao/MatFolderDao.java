package com.bluecoffee.dao;

import java.util.List;

import com.bluecoffee.domain.MatFolder;

public interface MatFolderDao {

	public List<MatFolder> getMatFolderList();
	public int getMatFolderIDbyName(String name);
	public String getNameByID(int matFolderID);
	public void insertFolder(MatFolder matFolder);
	public void deleteFolder(int matFolderID);
	
}