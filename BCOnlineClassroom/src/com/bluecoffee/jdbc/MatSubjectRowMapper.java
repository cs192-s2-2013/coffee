package com.bluecoffee.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.bluecoffee.domain.MatSubject;

public class MatSubjectRowMapper implements RowMapper<MatSubject> {

	@Override
	public MatSubject mapRow(ResultSet resultSet, int line) throws SQLException {
		MatSubjectExtractor matSubjectExtractor = new MatSubjectExtractor();
		return matSubjectExtractor.extractData(resultSet);
	}

}