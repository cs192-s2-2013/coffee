package com.bluecoffee.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.bluecoffee.domain.FComment;

public class FCommentRowMapper implements RowMapper<FComment> {
	@Override
	public FComment mapRow(ResultSet resultSet, int line) throws SQLException {
		FCommentExtractor fCommentExtractor = new FCommentExtractor();
		return fCommentExtractor.extractData(resultSet);
	}
}