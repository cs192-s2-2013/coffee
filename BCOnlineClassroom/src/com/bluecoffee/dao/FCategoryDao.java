package com.bluecoffee.dao;

import java.util.List;

import com.bluecoffee.domain.FCategory;

public interface FCategoryDao {

	public void insertCategory(FCategory fCategory);
	public void deleteCategory(int fCategoryID);
	public String getCategoryByID(int fCategoryID);
	
}