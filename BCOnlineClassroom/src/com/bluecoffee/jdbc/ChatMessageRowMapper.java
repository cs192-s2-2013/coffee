package com.bluecoffee.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.bluecoffee.domain.ChatMessage;

public class ChatMessageRowMapper implements RowMapper<ChatMessage> {
	
	@Override
	public ChatMessage mapRow(ResultSet resultSet, int line) throws SQLException {
		ChatMessageExtractor chatMessageExtractor = new ChatMessageExtractor();
		return chatMessageExtractor.extractData(resultSet);
	}
}