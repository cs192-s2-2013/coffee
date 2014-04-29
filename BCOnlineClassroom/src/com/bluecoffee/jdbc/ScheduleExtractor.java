package com.bluecoffee.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.bluecoffee.domain.Schedule;

public class ScheduleExtractor implements ResultSetExtractor<Schedule> {

	public Schedule extractData(ResultSet resultSet) throws SQLException, DataAccessException {
	
		Schedule schedule = new Schedule();
		
		schedule.setSchedID(resultSet.getInt(1));
		schedule.setSchedStream(resultSet.getString(2));
		schedule.setSchedDesc(resultSet.getString(3));
		schedule.setUserID(resultSet.getInt(4));
		
		return schedule;
	}
}
