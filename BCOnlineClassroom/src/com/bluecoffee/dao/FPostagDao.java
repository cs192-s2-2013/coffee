package com.bluecoffee.dao;

import java.util.List;

import com.bluecoffee.domain.FPostag;

public interface FPostagDao {

	public void insertData(int fPostID, int fTagID);
	public List<FPostag> getFPostagListByPostID(int fPostagID);

//	public List<FPostag> getFTagList();
	
//	public int getFTagID(String tag);
}