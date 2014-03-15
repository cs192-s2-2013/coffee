package com.bluecoffee.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.bluecoffee.dao.MatSubjectDao;
import com.bluecoffee.domain.MatSubject;

public class MatSubjectServiceImpl implements MatSubjectService {

	@Autowired
	MatSubjectDao matsubjectdao;

/*	@Override
	public void insertData(MatFile matFile) {
		matfiledao.insertData(matFile);
	} */

	@Override
	public List<MatSubject> getMatSubjectList() {
		return matsubjectdao.getMatSubjectList();
	}
	
	@Override
	public int getMatSubjectIDbyName(String name){
		return matsubjectdao.getMatSubjectIDbyName(name);
	}
/*
	@Override
	public void deleteData(String id) {
		matfiledao.deleteData(id);
		
	}

	@Override
	public MatSubject getMatSubject(String id) {
		return matsubjectdao.getMatSubject(id);
	}

	@Override
	public void updateData(MatFile matFile) {
		matfiledao.updateData(matFile);
		
	}
*/
	
}
