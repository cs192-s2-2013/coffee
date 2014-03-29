package com.bluecoffee.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.bluecoffee.domain.MatFile;

public class MatFileRowMapper implements RowMapper<MatFile> {

	@Override
	public MatFile mapRow(ResultSet resultSet, int line) throws SQLException {
		MatFileExtractor matFileExtractor = new MatFileExtractor();
		return matFileExtractor.extractData(resultSet);
	}
}