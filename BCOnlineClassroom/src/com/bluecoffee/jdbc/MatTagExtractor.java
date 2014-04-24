package com.bluecoffee.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.beans.factory.annotation.Autowired;

import com.bluecoffee.domain.MatTag;
import com.bluecoffee.services.MatTagService;

public class MatTagExtractor implements ResultSetExtractor<MatTag> {

	@Autowired
	MatTagService matTagService;
	
	public MatTag extractData(ResultSet resultSet) throws SQLException,
	DataAccessException {
		
		MatTag matTag = new MatTag();

		matTag.setMatTagID(resultSet.getInt(1));
		matTag.setMatTag(resultSet.getString(2));
		
		return matTag;
	}
}