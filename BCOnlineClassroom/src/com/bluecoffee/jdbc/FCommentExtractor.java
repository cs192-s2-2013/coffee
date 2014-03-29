package com.bluecoffee.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.beans.factory.annotation.Autowired;

import com.bluecoffee.domain.FComment;
import com.bluecoffee.services.FCommentService;

public class FCommentExtractor implements ResultSetExtractor<FComment> {
	
	@Autowired
	FCommentService fCommentService;
	
	public FComment extractData(ResultSet resultSet) throws SQLException,
	DataAccessException {
		
		FComment fcomment = new FComment();

		fcomment.setFCommentID(resultSet.getInt(1));
		fcomment.setContent(resultSet.getString(2));
		fcomment.setCommentDate(resultSet.getDate(3));
		fcomment.setFPostID(resultSet.getInt(4));
		fcomment.setUserID(resultSet.getInt(5));
		
		return fcomment;
	}
}