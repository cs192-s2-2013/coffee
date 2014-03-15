package com.bluecoffee.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.bluecoffee.dao.MatFolderDao;
import com.bluecoffee.domain.MatFolder;

public class MatFolderServiceImpl implements MatFolderService {

	@Autowired
	MatFolderDao matfolderdao;

	@Override
	public List<MatFolder> getMatFolderList() {
		return matfolderdao.getMatFolderList();
	}
	
	@Override
	public int getMatFolderIDbyName(String name){
		return matfolderdao.getMatFolderIDbyName(name);
	}
}