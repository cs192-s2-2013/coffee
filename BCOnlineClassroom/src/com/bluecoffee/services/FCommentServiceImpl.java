package com.bluecoffee.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.bluecoffee.dao.FCommentDao;
import com.bluecoffee.dao.MatFileDao;
import com.bluecoffee.domain.FComment;

public class FCommentServiceImpl implements FCommentService {

	@Autowired
	FCommentDao fcommentdao;
	
	@Override
	public void insertData(FComment fcomment){
		fcommentdao.insertData(fcomment);
	}
	
	@Override
	public void deleteData(int fCommentID){
		fcommentdao.deleteData(fCommentID);
	}
	
	@Override
	public List<FComment> getFCommentList() {
		return fcommentdao.getFCommentList();
	}
	
	@Override
	public List<FComment> getFCommentListByFPostID(int fPostID){
		return fcommentdao.getFCommentListByFPostID(fPostID);
	}
}