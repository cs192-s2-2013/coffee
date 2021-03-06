package com.bluecoffee.dao;

import java.util.List;

import com.bluecoffee.domain.FTag;

public interface FTagDao {

	public void insertData(String ftag);
	public List<FTag> getFTagList();
	public int getFTagID(String tag);
	public FTag getFTag(int fTagID);
}