package com.bluecoffee.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.bluecoffee.domain.User;
import com.bluecoffee.jdbc.UserRowMapper;

public class UserDaoImpl implements UserDao {

	@Autowired DataSource dataSource;

	@Override
	public User getUserByUserID(int id){
		List<User> userList = new ArrayList<User>();	
		
		String sql = "SELECT userid, username, lastname, firstname, email FROM users WHERE userid=" + id;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		userList = jdbcTemplate.query(sql, new UserRowMapper());
		
		return userList.get(0);
	}
	
	@Override
	public User getUserByUsername(String username){
		username = username.replace("'","''");
		username = username.replace("\\", "\\\\");
		
		List<User> userList = new ArrayList<User>();	
		
		String sql = "SELECT userid, username, lastname, firstname, email FROM users WHERE username='" + username + "'";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		userList = jdbcTemplate.query(sql, new UserRowMapper());
		
		return userList.get(0);
	}
	
	public List<User> getChatOnline(){
		List<User> chatOnlineList = new ArrayList<User>();
		
		String sql = "SELECT userid, username, lastname, firstname, email FROM users NATURAL JOIN chatonline"; 
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		chatOnlineList = jdbcTemplate.query(sql, new UserRowMapper());
		
		return chatOnlineList;
	}
	
	public List<User> getChatUser() {
		List<User> chatUserList = new ArrayList<User>();
		
		String sql = "SELECT userid, username, lastname, firstname, email FROM users WHERE courseid = 92";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		chatUserList = jdbcTemplate.query(sql, new UserRowMapper());
		
		return chatUserList;   
	}
	
	public List<User> getUserListByUsername(String username){

	        username = username.replace("'", "''");
	        username = username.replace("\\", "\\\\");

	        List<User> userList = new ArrayList<User>();

	        String sql = "SELECT userid, username, lastname, firstname, email FROM users WHERE username LIKE '%" +username+ "%'";
	        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
	        userList = jdbcTemplate.query(sql, new UserRowMapper());

	        return userList;

	}
	
	public List<User> getChatMembers(int chatConvoID){
		List<User> chatMembersList = new ArrayList<User>();
		
		String sql = "SELECT userid, username, lastname, firstname, email FROM users NATURAL JOIN chatmember WHERE chatConvoID = "+chatConvoID;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		chatMembersList = jdbcTemplate.query(sql, new UserRowMapper());
		
		return chatMembersList;
	}
}
