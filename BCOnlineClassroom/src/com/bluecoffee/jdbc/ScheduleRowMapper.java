package com.bluecoffee.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.bluecoffee.domain.Schedule;

public class ScheduleRowMapper implements RowMapper<Schedule>{

	@Override
	public Schedule mapRow(ResultSet resultSet, int line) throws SQLException {
		ScheduleExtractor scheduleExtractor = new ScheduleExtractor();
		return scheduleExtractor.extractData(resultSet);
	}

}