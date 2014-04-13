package com.bluecoffee.dao;

import java.util.List;

import com.bluecoffee.domain.FComment;

public interface FCommentDao {
	
	public void insertData(FComment fcomment);
	public void deleteData(int fCommentID);
	public List<FComment> getFCommentList();
	public List<FComment> getFCommentListByFPostID(int fPostID);
	
}