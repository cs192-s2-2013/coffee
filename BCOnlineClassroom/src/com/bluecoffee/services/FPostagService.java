package com.bluecoffee.services;

import java.util.List;

import com.bluecoffee.domain.FPostag;


public interface FPostagService {
	
	public void insertData(int fPostID, int fTagID);
	public List<FPostag> getFPostagListByPostID(int fPostagID);
	public List<FPostag> getFPostagListByTagID(int fTagID);
	//public List<FTag> getFTagList();
	
	//public int getFTagID(String tag);
	
}


