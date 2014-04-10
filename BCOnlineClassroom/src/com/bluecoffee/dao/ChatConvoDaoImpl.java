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
				
		List<ChatConvo> chatConvoList = new ArrayList<ChatConvo>();
		String sql = "SELECT chatConvoID, title FROM chatconvo NATURAL JOIN chatmember WHERE userID = "+userID;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		chatConvoList = jdbcTemplate.query(sql, new ChatConvoRowMapper());
		
		return chatConvoList;
		
	}
	
	@Override
	public void insertData(String title){
		String sql = "INSERT INTO chatconvo (title) VALUES (?)";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(
				sql,
				new Object[] { title });		
	}
	
	public void insertMember(int chatConvoID, int userID){
		String sql = "INSERT INTO chatmember (chatConvoID, userID) VALUES (?, ?)";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(
				sql,
				new Object[] { chatConvoID, userID });
	}
	
	public void deleteMember(int chatConvoID, int userID){
		String sql = "DELETE FROM chatmember WHERE chatConvoID="+chatConvoID + " AND userID="+userID;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(sql);
	}
	
	public List<ChatConvo> getConvoByChatMember(int chatConvoID, int userID){
		List<ChatConvo> chatConvoList = null;/*new ArrayList<ChatConvo>();*/
		
		String sql = "SELECT chatConvoID, title FROM chatmember NATURAL JOIN chatconvo WHERE chatConvoID="+chatConvoID+" AND userID="+userID;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		chatConvoList = jdbcTemplate.query(sql, new ChatConvoRowMapper());
		
		return chatConvoList;
	}
	
	public int getChatConvoID(String title){
		title = title.replace("'", "''");
		
		List<ChatConvo> chatConvoList = new ArrayList<ChatConvo>();
		String sql = "SELECT chatConvoID, title FROM chatconvo WHERE title = '"+title+"'";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		chatConvoList = jdbcTemplate.query(sql, new ChatConvoRowMapper());
		
		return chatConvoList.get(0).getChatConvoID();
		
	}
}
