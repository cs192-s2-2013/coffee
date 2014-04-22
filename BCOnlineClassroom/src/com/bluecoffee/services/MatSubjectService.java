package com.bluecoffee.services;

import java.util.List;

import com.bluecoffee.domain.MatSubject;

public interface MatSubjectService {

//	public void insertData(MatFile matFile);

	public List<MatSubject> getMatSubjectList();
	public int getMatSubjectIDbyName(String name);
	public void deleteSubject(int id);
	public void addSubject(MatSubject matSubject);

//	public void deleteData(String id);

//	public MatSubject getMatSubject(String id);

//	public void updateData(MatFile matFile); 
}
