package com.bluecoffee.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.bluecoffee.dao.FTagDao;
import com.bluecoffee.dao.MatFileDao;
import com.bluecoffee.domain.FPostag;
import com.bluecoffee.dao.FPostagDao;

public class FPostagServiceImpl implements FPostagService {

	@Autowired
	FPostagDao fpostagdao;
	
	@Override
	public void insertData(int fPostID, int fTagID){
		fpostagdao.insertData(fPostID, fTagID);
	}
	
	@Override
	public List<FPostag> getFPostagListByPostID(int fPostagID){
		return fpostagdao.getFPostagListByPostID(fPostagID);
	}
}