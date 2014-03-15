package com.bluecoffee.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.bluecoffee.domain.MatFile;

public class MatFileExtractor implements ResultSetExtractor<MatFile> {

	public MatFile extractData(ResultSet resultSet) throws SQLException,
			DataAccessException {
		
		MatFile matFile = new MatFile();
		
		matFile.setMatFileID(resultSet.getInt(1));
		matFile.setFileName(resultSet.getString(2));
		matFile.setFileType(resultSet.getString(3));
		matFile.setFileSize(resultSet.getLong(4));
		matFile.setUploadDate(resultSet.getDate(5));
		matFile.setPath(resultSet.getString(6));
		matFile.setMatSubjectID(resultSet.getInt(7));
		matFile.setMatFolderID(resultSet.getInt(8));
		
		return matFile;
	}

}
