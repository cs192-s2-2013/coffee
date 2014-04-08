package com.bluecoffee.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.bluecoffee.domain.ChatConvo;

public class ChatConvoExtractor implements ResultSetExtractor<ChatConvo> {
	
	public ChatConvo extractData(ResultSet resultSet) throws SQLException,
	DataAccessException {
		
		ChatConvo chatConvo = new ChatConvo();

		chatConvo.setChatConvoID(resultSet.getInt(1));
		chatConvo.setTitle(resultSet.getString(2));
		
		return chatConvo;
	}
}
