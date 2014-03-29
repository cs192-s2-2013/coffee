package com.bluecoffee.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.beans.factory.annotation.Autowired;

import com.bluecoffee.domain.FTag;
import com.bluecoffee.services.FTagService;

public class FTagExtractor implements ResultSetExtractor<FTag> {

	@Autowired
	FTagService fTagService;
	
	public FTag extractData(ResultSet resultSet) throws SQLException,
	DataAccessException {
		
		FTag ftag = new FTag();

		ftag.setFTagID(resultSet.getInt(1));
		ftag.setTag(resultSet.getString(2));
		
		return ftag;
	}
}