package com.bluecoffee.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.bluecoffee.domain.FCategory;

public class FCategoryRowMapper implements RowMapper<FCategory>{

	@Override
	public FCategory mapRow(ResultSet resultSet, int line) throws SQLException {
		FCategoryExtractor fCategoryExtractor = new FCategoryExtractor();
		return fCategoryExtractor.extractData(resultSet);
	}
}
