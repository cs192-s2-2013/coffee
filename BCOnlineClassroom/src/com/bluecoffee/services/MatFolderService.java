package com.bluecoffee.services;

import java.util.List;

import com.bluecoffee.domain.MatFolder;

public interface MatFolderService {
	
	public List<MatFolder> getMatFolderList();
	public int getMatFolderIDbyName(String name);
	public void insertCategory(MatFolder matFolder);
	public void deleteCategory(int matFolderID);
	
}