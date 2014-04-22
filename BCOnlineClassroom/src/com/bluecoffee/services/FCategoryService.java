package com.bluecoffee.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.bluecoffee.dao.FCategoryDao;
import com.bluecoffee.domain.FCategory;

public interface FCategoryService{
	
	public void insertCategory(FCategory fCategory);
	public void deleteCategory(int fCategoryID);
	public String getCategoryByID(int fCategoryID);
}
