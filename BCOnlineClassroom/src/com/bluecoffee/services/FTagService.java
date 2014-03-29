package com.bluecoffee.services;

import java.util.List;

import com.bluecoffee.domain.FTag;


public interface FTagService {
	
	public void insertData(String tag);
	public List<FTag> getFTagList();
	public int getFTagID(String tag);
	public FTag getFTag(int fTagID);

}


