package com.bluecoffee.services;

import java.util.List;

import com.bluecoffee.domain.MatTag;


public interface MatTagService {
	
	public void insertData(String matTag);
	public List<MatTag> getMatTagList();
	public int getMatTagID(String matTag);
	public MatTag getMatTag(int matTagID);

}


