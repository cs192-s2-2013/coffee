package com.bluecoffee.services;

import java.util.List;

import com.bluecoffee.domain.FCategory;
import com.bluecoffee.dao.ChatConvoDao;
import com.bluecoffee.dao.FCategoryDao;

import org.springframework.beans.factory.annotation.Autowired;

public class FCategoryServiceImpl implements FCategoryService {

	@Autowired 
	FCategoryDao fcategorydao;
	
	public void insertCategory(FCategory fCategory){
		fcategorydao.insertCategory(fCategory);
	}
	
	public void deleteCategory(int fCategoryID){
		fcategorydao.deleteCategory(fCategoryID);
	}
	
	public String getCategoryByID(int fCategoryID){
		return fcategorydao.getCategoryByID(fCategoryID);
	}
	
}
