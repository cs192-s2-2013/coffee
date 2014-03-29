package com.bluecoffee.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.bluecoffee.domain.FPostag;

public class FPostagRowMapper implements RowMapper<FPostag>{
	@Override
	public FPostag mapRow(ResultSet resultSet, int line) throws SQLException {
		FPostagExtractor fPostagExtractor = new FPostagExtractor();
		return fPostagExtractor.extractData(resultSet);
	}
}