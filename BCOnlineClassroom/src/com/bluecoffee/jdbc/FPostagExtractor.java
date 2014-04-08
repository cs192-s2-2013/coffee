package com.bluecoffee.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.bluecoffee.domain.FPostag;

public class FPostagExtractor implements ResultSetExtractor<FPostag> {
	
	public FPostag extractData(ResultSet resultSet) throws SQLException,
	DataAccessException {
		
		FPostag fpostag = new FPostag();

		fpostag.setFPostagID(resultSet.getInt(1));
		fpostag.setFPostID(resultSet.getInt(2));
		fpostag.setFTagID(resultSet.getInt(3));		
		
		return fpostag;
	}
}
