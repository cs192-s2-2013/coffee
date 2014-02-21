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
		matFile.setFileSize(resultSet.getString(4));
		matFile.setUploadDate(resultSet.getString(5));
		matFile.setMatSubjectID(resultSet.getInt(6));
		matFile.setMatFolderID(resultSet.getInt(7));
		
		return matFile;
	}

}
