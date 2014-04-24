package com.bluecoffee.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.bluecoffee.domain.MatFileTag;

public class MatFileTagRowMapper implements RowMapper<MatFileTag>{
	@Override
	public MatFileTag mapRow(ResultSet resultSet, int line) throws SQLException {
		MatFileTagExtractor matFileTagExtractor = new MatFileTagExtractor();
		return matFileTagExtractor.extractData(resultSet);
	}
}