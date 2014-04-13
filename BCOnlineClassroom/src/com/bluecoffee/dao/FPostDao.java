package com.bluecoffee.dao;

import java.util.List;

import com.bluecoffee.domain.FPost;

public interface FPostDao {

	public void insertData(FPost fpost);
	public void deleteData(int fPostID);
	public FPost getFPostByID(int fPostID);
	public int getIDByFPost(FPost fpost);
	public List<FPost> getFPostList();
	public void updateCommentCount(int fPostID, int newCount);

}