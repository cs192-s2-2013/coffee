package com.bluecoffee.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.bluecoffee.domain.ChatMessage;
import com.bluecoffee.dao.ChatMessageDao;

public class ChatMessageServiceImpl implements ChatMessageService {
	
	@Autowired ChatMessageDao chatMessageDao;
	
	public List<ChatMessage> getMessageListByConvoID(int chatConvoID){
		return chatMessageDao.getMessageListByConvoID(chatConvoID);
	}
	
	public void insertMessage(ChatMessage chatMessage){
		chatMessageDao.insertMessage(chatMessage);
	}
}
