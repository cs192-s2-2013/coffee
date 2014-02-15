package com.bluecoffee.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.bluecoffee.domain.MatFolder;

public class MatFolderRowMapper implements RowMapper<MatFolder> {

	@Override
	public MatFolder mapRow(ResultSet resultSet, int line) throws SQLException {
		MatFolderExtractor matFolderExtractor = new MatFolderExtractor();
		return matFolderExtractor.extractData(resultSet);
	}

}