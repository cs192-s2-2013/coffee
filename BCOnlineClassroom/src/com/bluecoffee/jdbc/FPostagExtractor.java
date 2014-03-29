package com.bluecoffee.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.beans.factory.annotation.Autowired;

import com.bluecoffee.domain.FPostag;
import com.bluecoffee.services.FPostagService;

public class FPostagExtractor implements ResultSetExtractor<FPostag> {

	//@Autowired
	//FTagService fTagService;
	
	public FPostag extractData(ResultSet resultSet) throws SQLException,
	DataAccessException {
		
		FPostag fpostag = new FPostag();

		fpostag.setFPostagID(resultSet.getInt(1));
		fpostag.setFPostID(resultSet.getInt(2));
		fpostag.setFTagID(resultSet.getInt(3));		
		
		return fpostag;
	}
}