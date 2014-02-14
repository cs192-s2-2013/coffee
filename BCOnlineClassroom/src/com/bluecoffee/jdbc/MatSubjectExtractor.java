package com.bluecoffee.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.bluecoffee.domain.MatSubject;

public class MatSubjectExtractor implements ResultSetExtractor<MatSubject> {

	public MatSubject extractData(ResultSet resultSet) throws SQLException,
			DataAccessException {
		
		MatSubject matSubject = new MatSubject();
		
		matSubject.setMatSubjectID(resultSet.getInt(1));
		matSubject.setSubjectName(resultSet.getString(2));
		matSubject.setSubjectDesc(resultSet.getString(3));
		
		return matSubject;
	}

}
