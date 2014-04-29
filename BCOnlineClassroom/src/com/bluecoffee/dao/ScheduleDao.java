package com.bluecoffee.dao;

import java.util.List;

import com.bluecoffee.domain.Schedule;

public interface ScheduleDao {

	public void insertData(Schedule schedule);
	public Schedule getScheduleBySchedID(int schedID);
	public Schedule getScheduleByUserID(int userID);
	public List<Schedule> getScheduleList();
	public int getSchedIDByUserID(int userID);
	public void updateSchedule(Schedule schedule);
	public void updateScheduleStream(String schedStream, int schedID);
	public void updateScheduleDesc(String schedDesc, int schedID);
}