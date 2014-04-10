package com.bluecoffee.dao;

import java.util.List;

import com.bluecoffee.domain.ChatMessage;

public interface ChatMessageDao {
	public List<ChatMessage> getMessageListByConvoID(int chatConvoID);
	public void insertMessage(ChatMessage chatMessage);
}
