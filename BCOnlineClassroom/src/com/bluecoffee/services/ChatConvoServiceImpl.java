package com.bluecoffee.services;

import java.util.List;

import com.bluecoffee.domain.ChatConvo;
import com.bluecoffee.dao.ChatConvoDao;

import org.springframework.beans.factory.annotation.Autowired;

public class ChatConvoServiceImpl implements ChatConvoService {

	@Autowired ChatConvoDao chatConvoDao;
	
	@Override
	public List<ChatConvo> getConvoListByUserID(int userID){
		return chatConvoDao.getConvoListByUserID(userID);
	}

	@Override
	public int insertData(String title){
		chatConvoDao.insertData(title);
		return chatConvoDao.getChatConvoID(title);
	}
	
	public void insertMember(int chatConvoID, int userID){
		//if not yet in chatmember table, insert
		if(chatConvoDao.getConvoByChatMember(chatConvoID, userID).isEmpty()){
			chatConvoDao.insertMember(chatConvoID, userID);
		}
	}
	
	public void deleteMember(int chatConvoID, int userID){
		chatConvoDao.deleteMember(chatConvoID, userID);
	}
}
