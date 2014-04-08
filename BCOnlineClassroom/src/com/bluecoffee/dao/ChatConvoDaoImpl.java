package com.bluecoffee.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.bluecoffee.domain.ChatConvo;
import com.bluecoffee.jdbc.ChatConvoRowMapper;

public class ChatConvoDaoImpl implements ChatConvoDao {

	@Autowired DataSource dataSource;

	@Override
	public List<ChatConvo> getConvoListByUserID(int userID){
				
		List<ChatConvo> chatConvoList = new ArrayList();
		String sql = "SELECT chatConvoID, title FROM chatconvo NATURAL JOIN chatmember WHERE userID = "+userID;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		chatConvoList = jdbcTemplate.query(sql, new ChatConvoRowMapper());
		
		return chatConvoList;
		
	}
	
}
