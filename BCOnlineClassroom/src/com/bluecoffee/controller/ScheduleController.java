package com.bluecoffee.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.CookieValue;
import org.jasypt.util.text.BasicTextEncryptor;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.bluecoffee.domain.Schedule;
import com.bluecoffee.domain.User;
import com.bluecoffee.services.ScheduleService;
import com.bluecoffee.services.UserService;

import java.io.*;
import java.util.*;
import java.util.regex.*;
import java.util.Arrays.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.io.output.*;

import javax.servlet.jsp.PageContext;


@Controller
@SessionAttributes("user")
public class ScheduleController {

	public int NUMBER_OF_SCHED_TIMESLOTS = 126;
	public String[] TIMESLOTS = {"07:00AM-07:30AM", "07:30AM-08:00AM", "08:00AM-08:30AM", "08:30AM-09:00AM", "09:00AM-09:30AM", "09:30AM-10:00AM",
								"10:00AM-10:30AM", "10:30AM-11:00AM", "11:00AM-11:30AM", "11:30AM-12:00PM", "12:00PM-12:30PM", 
								"12:30PM-01:00PM", "01:00PM-01:30PM", "01:30PM-02:00PM", "02:00PM-02:30PM", "02:30PM-03:00PM",
								"03:00PM-03:30PM", "03:30PM-04:00PM", "04:00PM-04:30PM", "04:30PM-05:00PM", "05:00PM-05:30PM"};
	
	@Autowired ScheduleService scheduleService;
	@Autowired UserService userService;
	
	@RequestMapping("/schedule")
	public String getSchedule(@CookieValue(value="cs192session", defaultValue="none") String fooCookie, Model model, HttpSession session) {
		
		if(CookieHandler.decryptCookie(fooCookie)==null){ return "notfound"; }
		
		User user = (User) session.getAttribute("user");
		
		//if user doesn't have a sched yet, create a blank one; then, fetch the sched by userID
		
		int schedID = scheduleService.getSchedIDByUserID(user.getUserID());
		Schedule schedule;
		if (schedID==-1){
			schedule = new Schedule();
			schedule.setSchedDesc("Schedule not yet set.");
			schedule.setUserID(user.getUserID());
			String schedStream = "";
			for (int x=0; x<NUMBER_OF_SCHED_TIMESLOTS; x++) schedStream = schedStream + "0";
			schedule.setSchedStream(schedStream);
			scheduleService.insertData(schedule);
		}
		schedule = scheduleService.getScheduleByUserID(user.getUserID());
		
		//turn schedStream into an array of characters
		String schedStream = schedule.getSchedStream();
		Boolean[] schedBitStream = new Boolean[schedStream.length()];
		for (int i=0; i<schedStream.length(); i++) {
			if (schedStream.charAt(i)=='1') schedBitStream[i]=true;
			else schedBitStream[i] = false;
		}
		
		System.out.println("First boolean value: " + schedBitStream[0]);
		
		model.addAttribute("schedDesc", schedule.getSchedDesc());
		model.addAttribute("schedStream", schedBitStream);
		model.addAttribute("timeslots", TIMESLOTS);
	
		return "schedule";//new ModelAndView("subjectList", "matSubjectList", matSubjectList);
	}
	
	@RequestMapping("/schedit")
	public String editSchedule(@ModelAttribute("user") User user) {
		
		scheduleService.getScheduleByUserID(user.getUserID());
		
		return "schedit";
	}
	
	@RequestMapping("/schedupdate")
	public String updateSchedule(@ModelAttribute("user") User user, HttpServletRequest request) {
		
		String[] selectedTiles = request.getParameterValues("SelectedTiles");
		String scheduleDesc = request.getParameter("schedDesc");
		char[] schedStream = new char[NUMBER_OF_SCHED_TIMESLOTS];
		
		for(int i=0; i<NUMBER_OF_SCHED_TIMESLOTS; i++){
			schedStream[i] = '0';
		}
		
		try{
			for(String i : selectedTiles){
				schedStream[Integer.parseInt(i)] = '1';
			}
		}
		catch(NullPointerException e){
			
		}
			
		String schedStreamString = new String(schedStream);
		int schedID = scheduleService.getSchedIDByUserID(user.getUserID());
		
		Schedule sched = new Schedule();
		sched.setSchedID(schedID);
		sched.setSchedDesc(scheduleDesc);
		sched.setSchedStream(schedStreamString);
		sched.setUserID(user.getUserID());
		
		scheduleService.updateSchedule(sched);
		
		return "redirect:/schedule";
	}
	
	@RequestMapping("/searchsched")
	public String searchSched(@ModelAttribute("user") User user, HttpServletRequest request) {
		return "searchSched";
	}
	
	@RequestMapping("/searchSchedResults") 
	public String searchSchedResults(@ModelAttribute("user") User user, HttpServletRequest request, Model model){
		String[] selectedTiles = request.getParameterValues("SelectedTiles");
		
		List<User> usersWithMatchSched = new ArrayList<User>();
		List<Schedule> allScheds = scheduleService.getScheduleList();
		List<Schedule> matchingScheds = new ArrayList<Schedule>();
		
		for (Schedule schedule : allScheds) {
			if (schedMatches(selectedTiles, schedule.getSchedStream()) && user.getUserID()!=schedule.getUserID()) {
				usersWithMatchSched.add(userService.getUserByUserID(schedule.getUserID()));
				matchingScheds.add(schedule);
			}
		}
		
		model.addAttribute("userList", usersWithMatchSched);
		model.addAttribute("schedList", matchingScheds);
		
		return "searchSchedResult";
	}
	
	private boolean schedMatches(String[] matchMe, String matchee) {
		char[] schedStream = new char[NUMBER_OF_SCHED_TIMESLOTS];
		for (int i=0; i<schedStream.length; i++) {
			if (matchee.charAt(i)=='1') schedStream[i]='1';
			else schedStream[i]='0';
		}
		for(String i : matchMe){
			if (schedStream[Integer.parseInt(i)] != '1')
				return false;
		}
		return true;
	}
}