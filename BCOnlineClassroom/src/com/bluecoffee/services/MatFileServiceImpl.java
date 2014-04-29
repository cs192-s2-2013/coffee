package com.bluecoffee.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.bluecoffee.dao.MatFileDao;
import com.bluecoffee.domain.MatFile;

public class MatFileServiceImpl implements MatFileService {

	@Autowired
	MatFileDao matfiledao;

	@Override
	public void insertData(MatFile matFile) {
		matfiledao.insertData(matFile);
	}

	@Override
	public List<MatFile> getMatFileList() {
		return matfiledao.getMatFileList();
	}

	@Override
	public void deleteData(int id) {
		matfiledao.deleteData(id);
		
	}

	@Override
	public MatFile getMatFile(int id) {
		return matfiledao.getMatFile(id);
	}

	/*@Override
	public void updateData(MatFile matFile) {
		matfiledao.updateData(matFile);
		
	}*/

	@Override
	public List<MatFile> getMatFileListBySubjectName(String subjectName) {
		return matfiledao.getMatFileListBySubjectName(subjectName);
	}
	
	@Override
	public List<MatFile> getMatFileListBySubjectFolder(String subjectName, int matFolderID) {
		return matfiledao.getMatFileListBySubjectFolder(subjectName, matFolderID);
	}
	
	@Override
	public List<MatFile> getMatFileListByFilename(String filename){
		return matfiledao.getMatFileListByFilename(filename);
	}
	
	@Override
	public List<MatFile> getMatFileListByDescription(String searchString){
		return matfiledao.getMatFileListByDescription(searchString);
	}
	
	@Override
	public String getFileNameByID(int id){
		return getMatFile(id).getFileName();
	}
	
	@Override
	public String getFilePathByID(int id){
		return getMatFile(id).getPath();
	}
	
	public int getIDByMatFile(MatFile matFile){
		return matfiledao.getIDByMatFile(matFile);
	}
	
}
