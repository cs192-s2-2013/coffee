package com.bluecoffee.services;

import java.util.List;
import com.bluecoffee.domain.ChatMessage;

public interface ChatMessageService {
	public List<ChatMessage> getMessageListByConvoID(int chatConvoID);
	public void insertMessage(ChatMessage chatMessage);
}
