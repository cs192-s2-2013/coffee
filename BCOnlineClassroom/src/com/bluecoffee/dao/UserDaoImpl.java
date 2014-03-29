package com.bluecoffee.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.bluecoffee.domain.User;
import com.bluecoffee.jdbc.UserRowMapper;

public class UserDaoImpl implements UserDao {

	@Autowired
	DataSource dataSource;

	@Override
	public User getUserByUserID(int id){
		List<User> userList = new ArrayList<User>();	
		String sql = "select * from user where userID=" + id;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		userList = jdbcTemplate.query(sql, new UserRowMapper());
		return userList.get(0);
	}
	
	@Override
	public User getUserByUsername(String username){
		List<User> userList = new ArrayList<User>();	
		String sql = "select * from user where username='" + username + "'";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		userList = jdbcTemplate.query(sql, new UserRowMapper());
		return userList.get(0);
	}
	
}
