package com.bluecoffee.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.bluecoffee.domain.FTag;

public class FTagRowMapper implements RowMapper<FTag>{
	@Override
	public FTag mapRow(ResultSet resultSet, int line) throws SQLException {
		FTagExtractor fTagExtractor = new FTagExtractor();
		return fTagExtractor.extractData(resultSet);
	}
}