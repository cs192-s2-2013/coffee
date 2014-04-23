package com.bluecoffee.dao;

import java.util.List;

import com.bluecoffee.domain.MatSubject;

public interface MatSubjectDao {

	//public void insertData(MatSubject matSubject);

	public List<MatSubject> getMatSubjectList();
	public MatSubject getMatSubjectIDbyName(String name);
	public void deleteSubject(int id);
	public void addSubject(MatSubject matSubject);

	//public void updateData(MatSubject matSubject);

	//public void deleteData(String id);

	//public MatSubject getMatSubject(String id);

}
