package com.bluecoffee.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.bluecoffee.domain.User;

public class UserExtractor implements ResultSetExtractor<User> {

	public User extractData(ResultSet resultSet) throws SQLException, DataAccessException {
	
		User user = new User();
		
		user.setUserID(resultSet.getInt(1));
		user.setUsername(resultSet.getString(2));
		user.setLastName(resultSet.getString(3));
		user.setFirstName(resultSet.getString(4));
		user.setEmail(resultSet.getString(5));
		
		return user;
	}
}
