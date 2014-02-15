package com.bluecoffee.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.bluecoffee.domain.MatFolder;

public class MatFolderExtractor implements ResultSetExtractor<MatFolder> {

	public MatFolder extractData(ResultSet resultSet) throws SQLException,
			DataAccessException {
		
		MatFolder matFolder = new MatFolder();
		
		matFolder.setMatFolderID(resultSet.getInt(1));
		matFolder.setFolderName(resultSet.getString(2));
		
		return matFolder;
	}

}
