package com.bluecoffee.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.bluecoffee.domain.FCategory;

public class FCategoryExtractor implements ResultSetExtractor<FCategory> {

	public FCategory extractData(ResultSet resultSet) throws SQLException,
	DataAccessException {
		
		FCategory fcategory = new FCategory();
		
		fcategory.setFCategoryID(resultSet.getInt(1));
		fcategory.setFCategory(resultSet.getString(2));
		
		return fcategory;
	}
}