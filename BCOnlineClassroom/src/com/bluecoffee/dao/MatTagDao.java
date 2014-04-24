package com.bluecoffee.dao;

import java.util.List;

import com.bluecoffee.domain.MatTag;

public interface MatTagDao {

	public void insertData(String mattag);
	public List<MatTag> getMatTagList();
	public int getMatTagID(String tag);
	public MatTag getMatTag(int matTagID);
}