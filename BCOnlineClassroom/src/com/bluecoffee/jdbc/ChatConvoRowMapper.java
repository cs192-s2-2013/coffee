package com.bluecoffee.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.bluecoffee.domain.ChatConvo;

public class ChatConvoRowMapper implements RowMapper<ChatConvo> {

	@Override
	public ChatConvo mapRow(ResultSet resultSet, int line) throws SQLException {
		ChatConvoExtractor chatConvoExtractor = new ChatConvoExtractor();
		return chatConvoExtractor.extractData(resultSet);
	}
}