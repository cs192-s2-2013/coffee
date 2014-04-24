package com.bluecoffee.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.bluecoffee.dao.MatTagDao;
import com.bluecoffee.dao.MatFileDao;
import com.bluecoffee.domain.MatFileTag;
import com.bluecoffee.dao.MatFileTagDao;

public class MatFileTagServiceImpl implements MatFileTagService {

	@Autowired
	MatFileTagDao matfiletagdao;
	
	@Override
	public void insertData(int matFileID, int matTagID){
		matfiletagdao.insertData(matFileID, matTagID);
	}
	
	@Override
	public List<MatFileTag> getMatFileTagListByFileID(int matFileID){
		return matfiletagdao.getMatFileTagListByFileID(matFileID);
	}
	
	@Override
	public List<MatFileTag> getMatFileTagListByTagID(int matTagID){
		return matfiletagdao.getMatFileTagListByTagID(matTagID);
	}
}