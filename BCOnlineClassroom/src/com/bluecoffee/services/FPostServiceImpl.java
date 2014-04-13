package com.bluecoffee.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.bluecoffee.dao.FPostDao;
import com.bluecoffee.dao.MatFileDao;
import com.bluecoffee.domain.FPost;

public class FPostServiceImpl implements FPostService{
	
	@Autowired FPostDao fpostdao;
	
	@Override
	public void insertData(FPost fpost){
		fpostdao.insertData(fpost);
	}
	
	@Override
	public void deleteData(int fPostID){
		fpostdao.deleteData(fPostID);
	}
	
	@Override
	public FPost getFPostByID(int fPostID){
		return fpostdao.getFPostByID(fPostID);
	}
	
	@Override
	public int getIDByFPost(FPost fpost){
		return fpostdao.getIDByFPost(fpost);
	}
	
	@Override
	public List<FPost> getFPostList() {
		return fpostdao.getFPostList();
	}
	
	@Override
	public void incCommentCount(int fPostID){
		FPost fPost = fpostdao.getFPostByID(fPostID);
		fpostdao.updateCommentCount(fPostID, fPost.getCommentCount()+1);
	}
	
	public void decCommentCount(int fPostID){
		FPost fPost = fpostdao.getFPostByID(fPostID);
		fpostdao.updateCommentCount(fPostID, fPost.getCommentCount()-1);
	}
}