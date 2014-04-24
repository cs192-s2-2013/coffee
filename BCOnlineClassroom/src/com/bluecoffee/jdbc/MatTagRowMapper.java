package com.bluecoffee.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.bluecoffee.domain.MatTag;

public class MatTagRowMapper implements RowMapper<MatTag>{
	@Override
	public MatTag mapRow(ResultSet resultSet, int line) throws SQLException {
		MatTagExtractor matTagExtractor = new MatTagExtractor();
		return matTagExtractor.extractData(resultSet);
	}
}