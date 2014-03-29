package com.bluecoffee.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.bluecoffee.dao.FTagDao;
import com.bluecoffee.dao.MatFileDao;
import com.bluecoffee.domain.FTag;


public class FTagServiceImpl implements FTagService {

	@Autowired
	FTagDao ftagdao;
	
	@Override
	public void insertData(String tag){
		ftagdao.insertData(tag);
	}
	
	@Override
	public List<FTag> getFTagList() {
		return ftagdao.getFTagList();
	}
	
	@Override
	public int getFTagID(String tag){
		int tagID = ftagdao.getFTagID(tag);
		if(tagID==-1){
			ftagdao.insertData(tag);
			tagID = ftagdao.getFTagID(tag);
		}
		return tagID;
	}
	
	@Override
	public FTag getFTag(int fTagID){
		return ftagdao.getFTag(fTagID);
	}
}