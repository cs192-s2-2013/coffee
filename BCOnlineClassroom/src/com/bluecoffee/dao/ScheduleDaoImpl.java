package com.bluecoffee.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.bluecoffee.domain.Schedule;
import com.bluecoffee.jdbc.ScheduleRowMapper;

public class ScheduleDaoImpl implements ScheduleDao {

	@Autowired DataSource dataSource;

	@Override
	public void insertData(Schedule schedule){
		String sql = "INSERT INTO schedule (schedStream, schedDesc, userID) VALUES (?, ?, ?)";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(sql, new Object[] {schedule.getSchedStream(), schedule.getSchedDesc(), schedule.getUserID()});	
	}
	
	@Override
	public Schedule getScheduleBySchedID(int schedID){
		List<Schedule> scheduleList = new ArrayList<Schedule>();	
		
		String sql = "SELECT schedID, schedStream, schedDesc, userID FROM schedule WHERE schedid=" + schedID;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		scheduleList = jdbcTemplate.query(sql, new ScheduleRowMapper());
		
		return scheduleList.get(0);
	}
	
	@Override
	public Schedule getScheduleByUserID(int userID) {
		
		List<Schedule> scheduleList = new ArrayList<Schedule>();	
		
		String sql = "SELECT schedID, schedStream, schedDesc, userID FROM schedule WHERE userID=" + userID;;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		scheduleList = jdbcTemplate.query(sql, new ScheduleRowMapper());
		
		return scheduleList.get(0);
	}
	
	public List<Schedule> getScheduleList(){
		List<Schedule> scheduleList = new ArrayList<Schedule>();
		
		String sql = "SELECT schedID, schedStream, schedDesc, userID FROM schedule"; 
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		scheduleList = jdbcTemplate.query(sql, new ScheduleRowMapper());
		
		return scheduleList;
	}
	
	@Override
	public int getSchedIDByUserID(int userID) {
		List<Schedule> scheduleList = new ArrayList<Schedule>();	
		
		String sql = "SELECT schedID, schedStream, schedDesc, userID FROM schedule WHERE userID=" + userID;;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		scheduleList = jdbcTemplate.query(sql, new ScheduleRowMapper());
		
		if(scheduleList.size() == 0){ return -1; } //tag not found
		else{ return scheduleList.get(0).getSchedID(); }
		
	}
	
	@Override
	public void updateSchedule(Schedule schedule) {
		String sql = "UPDATE schedule SET schedStream = ?, schedDesc = ? WHERE schedID = ?";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(
				sql, 
				new Object[] {schedule.getSchedStream(), schedule.getSchedDesc(), schedule.getSchedID()});
	}
	
	@Override
	public void updateScheduleStream(String schedStream, int schedID) {
		String sql = "UPDATE schedule SET schedStream = ? WHERE schedID = ?";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(
				sql, 
				new Object[] {schedStream, schedID});
	}
	
	@Override
	public void updateScheduleDesc(String schedDesc, int schedID) {
		String sql = "UPDATE schedule SET schedDesc = ? WHERE schedID = ?";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(
				sql, 
				new Object[] {schedDesc, schedID});
	}
	
}
