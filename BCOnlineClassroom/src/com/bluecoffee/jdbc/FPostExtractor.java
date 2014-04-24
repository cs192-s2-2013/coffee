package com.bluecoffee.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.beans.factory.annotation.Autowired;

import com.bluecoffee.domain.FPost;
import com.bluecoffee.services.FPostService;

public class FPostExtractor implements ResultSetExtractor<FPost> {
	
	@Autowired
	FPostService fPostService;
	
	public FPost extractData(ResultSet resultSet) throws SQLException,
	DataAccessException {
		
		FPost fpost = new FPost();

		fpost.setFPostID(resultSet.getInt(1));
		fpost.setTitle(resultSet.getString(2));
		fpost.setContent(resultSet.getString(3));
		fpost.setCommentCount(resultSet.getInt(4));
		fpost.setPostDate(resultSet.getDate(5));
		fpost.setUserID(resultSet.getInt(6));
		fpost.setFCategoryID(resultSet.getInt(7));
		
		return fpost;
	}
	
}