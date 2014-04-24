package com.bluecoffee.dao;

import java.util.List;

import com.bluecoffee.domain.MatFileTag;

public interface MatFileTagDao {

	public void insertData(int matFileID, int matTagID);
	public List<MatFileTag> getMatFileTagListByFileID(int matFileTagID);
	public List<MatFileTag> getMatFileTagListByTagID(int matTagID);
//	public List<MatFileTag> getMatTagList();
	
//	public int getMatFileTagID(String matTag);
}