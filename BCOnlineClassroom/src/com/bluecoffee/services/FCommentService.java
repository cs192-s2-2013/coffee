package com.bluecoffee.services;

import java.util.List;

import com.bluecoffee.domain.FComment;

public interface FCommentService {
	
	public void insertData(FComment fcomment);
	public List<FComment> getFCommentList();
	public List<FComment> getFCommentListByFPostID(int fPostID);
}
