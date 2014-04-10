package com.bluecoffee.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.bluecoffee.domain.ChatMessage;
import com.bluecoffee.jdbc.ChatMessageRowMapper;

public class ChatMessageDaoImpl implements ChatMessageDao {

	@Autowired DataSource dataSource;
	
	public List<ChatMessage> getMessageListByConvoID(int chatConvoID){
		
		List<ChatMessage> chatMessageList = new ArrayList<ChatMessage>();
		String sql = "SELECT * FROM chatmessage WHERE chatConvoID = "+chatConvoID;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		chatMessageList = jdbcTemplate.query(sql, new ChatMessageRowMapper());
		
		return chatMessageList;
	}
	
	public void insertMessage(ChatMessage chatMessage){
		String sql = "INSERT INTO chatmessage (message, messageDate, userID, chatConvoID) VALUES (?, ?, ?, ?)";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(
				sql,
				new Object[] { chatMessage.getMessage(), chatMessage.getMessageDate(), chatMessage.getUserID(), chatMessage.getChatConvoID()});
	}
}
