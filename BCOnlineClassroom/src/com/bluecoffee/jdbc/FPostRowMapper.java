package com.bluecoffee.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.bluecoffee.domain.FPost;

public class FPostRowMapper implements RowMapper<FPost> {

	@Override
	public FPost mapRow(ResultSet resultSet, int line) throws SQLException {
		FPostExtractor fPostExtractor = new FPostExtractor();
		return fPostExtractor.extractData(resultSet);
	}
}