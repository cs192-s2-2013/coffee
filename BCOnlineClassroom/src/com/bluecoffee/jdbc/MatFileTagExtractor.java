package com.bluecoffee.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.bluecoffee.domain.MatFileTag;

public class MatFileTagExtractor implements ResultSetExtractor<MatFileTag> {
	
	public MatFileTag extractData(ResultSet resultSet) throws SQLException,
	DataAccessException {
		
		MatFileTag matFileTag = new MatFileTag();

		matFileTag.setMatFileTagID(resultSet.getInt(1));
		matFileTag.setMatFileID(resultSet.getInt(2));
		matFileTag.setMatTagID(resultSet.getInt(3));		
		
		return matFileTag;
	}
}
