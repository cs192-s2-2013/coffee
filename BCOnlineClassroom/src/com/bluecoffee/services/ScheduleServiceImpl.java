package com.bluecoffee.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.bluecoffee.dao.ScheduleDao;
import com.bluecoffee.domain.Schedule;

public class ScheduleServiceImpl implements ScheduleService{

	@Autowired
	ScheduleDao scheduledao;
	
	@Override
	public void insertData(Schedule schedule) {
		scheduledao.insertData(schedule);
	}
	
	@Override
	public Schedule getScheduleBySchedID(int schedID){
		return scheduledao.getScheduleBySchedID(schedID);
	}
	
	@Override
	public Schedule getScheduleByUserID(int userID) {
		return scheduledao.getScheduleByUserID(userID);
	}
	
	@Override
	public List<Schedule> getScheduleList() {
		return scheduledao.getScheduleList();
	}
	
	@Override
	public int getSchedIDByUserID(int userID) {
		return scheduledao.getSchedIDByUserID(userID);
	}
	
	@Override
	public void updateSchedule (Schedule schedule) {
		scheduledao.updateSchedule(schedule);
	}
	
	@Override
	public void updateScheduleStream(String schedStream, int schedID) {
		scheduledao.updateScheduleStream(schedStream, schedID);
	}
	
	@Override
	public void updateScheduleDesc(String schedDesc, int schedID) {
		scheduledao.updateScheduleDesc(schedDesc, schedID);
	}
	
}