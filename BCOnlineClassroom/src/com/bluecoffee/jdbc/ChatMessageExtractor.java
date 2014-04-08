package com.bluecoffee.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.bluecoffee.domain.ChatMessage;

public class ChatMessageExtractor implements ResultSetExtractor<ChatMessage> {

	public ChatMessage extractData(ResultSet resultSet) throws SQLException,
	DataAccessException {
		
		ChatMessage chatMessage = new ChatMessage();

		chatMessage.setChatMessageID(resultSet.getInt(1));
		chatMessage.setMessage(resultSet.getString(2));
		chatMessage.setMessageDate(resultSet.getDate(3));
		chatMessage.setUserID(resultSet.getInt(4));
		chatMessage.setChatConvoID(resultSet.getInt(5));
		
		return chatMessage;
	}

}

