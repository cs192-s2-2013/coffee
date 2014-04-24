package com.bluecoffee.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.bluecoffee.dao.MatTagDao;
import com.bluecoffee.dao.MatFileDao;
import com.bluecoffee.domain.MatTag;


public class MatTagServiceImpl implements MatTagService {

	@Autowired
	MatTagDao mattagdao;
	
	@Override
	public void insertData(String matTag){
		mattagdao.insertData(matTag);
	}
	
	@Override
	public List<MatTag> getMatTagList() {
		return mattagdao.getMatTagList();
	}
	
	@Override
	public int getMatTagID(String matTag){
		int tagID = mattagdao.getMatTagID(matTag);
		if(tagID==-1){
			mattagdao.insertData(matTag);
			tagID = mattagdao.getMatTagID(matTag);
		}
		return tagID;
	}
	
	@Override
	public MatTag getMatTag(int matTagID){
		return mattagdao.getMatTag(matTagID);
	}
}