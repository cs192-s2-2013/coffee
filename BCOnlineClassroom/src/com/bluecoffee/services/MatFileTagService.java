package com.bluecoffee.services;

import java.util.List;

import com.bluecoffee.domain.MatFileTag;


public interface MatFileTagService {
	
	public void insertData(int matFIleID, int matTagID);
	public List<MatFileTag> getMatFileTagListByFileID(int matFileTagID);
	public List<MatFileTag> getMatFileTagListByTagID(int matTagID);
	//public List<MatTag> getMatTagList();
	
	//public int getMatTagID(String tag);
	
}


