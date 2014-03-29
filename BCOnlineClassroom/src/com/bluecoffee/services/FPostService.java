package com.bluecoffee.services;

import java.util.List;

import com.bluecoffee.domain.FPost;

public interface FPostService {

	public void insertData(FPost fpost);
	public FPost getFPostByID(int fPostID);
	public int getIDByFPost(FPost fpost);
	public List<FPost> getFPostList();
	public void incCommentCount(int fPostID);
}