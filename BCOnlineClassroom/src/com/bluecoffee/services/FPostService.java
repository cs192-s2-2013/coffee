package com.bluecoffee.services;

import java.util.List;

import com.bluecoffee.domain.FPost;

public interface FPostService {

	public void insertData(FPost fpost);
	public void deleteData(int fPostID);
	public FPost getFPostByID(int fPostID);
	public int getIDByFPost(FPost fpost);
	public List<FPost> getFPostByCategory(int fCategoryID);
	public List<FPost> getFPostList();
	public List<FPost> getFPostListByTitle(String searchString);
	public List<FPost> getFPostListByContent(String searchString);
	public void incCommentCount(int fPostID);
	public void decCommentCount(int fPostID);
}