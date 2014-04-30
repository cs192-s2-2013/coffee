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
import org.springframework.util.StringUtils;
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
	public String[] TIMESLOTS = {"07:00a - 07:30a", "07:30a - 08:00a", "08:00a - 08:30a", "08:30a - 09:00a", "09:00a - 09:30a", "09:30a - 10:00a",
								"10:00a - 10:30a", "10:30a - 11:00a", "11:00a - 11:30a", "11:30a - 12:00n", "12:00n - 12:30p", 
								"12:30p - 01:00p", "01:00p - 01:30p", "01:30p - 02:00p", "02:00p - 02:30p", "02:30p - 03:00p",
								"03:00p - 03:30p", "03:30p - 04:00p", "04:00p - 04:30p", "04:30p - 05:00p", "05:00p - 05:30p"};
	
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
		Boolean[] schedBitStream = getSchedBitStream(schedStream);
		
		model.addAttribute("schedDesc", schedule.getSchedDesc());
		model.addAttribute("schedStream", schedBitStream);
		model.addAttribute("timeslots", TIMESLOTS);
	
		return "schedule";//new ModelAndView("subjectList", "matSubjectList", matSubjectList);
	}
	
	@RequestMapping("/schedit")
	public String editSchedule(@ModelAttribute("user") User user, Model model) {
		
		Schedule schedule = scheduleService.getScheduleByUserID(user.getUserID());
		
		String schedStream = schedule.getSchedStream();
		Boolean[] schedBitStream = getSchedBitStream(schedStream);
		
		model.addAttribute("schedDesc", schedule.getSchedDesc());
		model.addAttribute("schedStream", schedBitStream);
		model.addAttribute("timeslots", TIMESLOTS);
		
		return "schedit";
	}
	
	@RequestMapping("/schedupdate")
	public String updateSchedule(@ModelAttribute("user") User user, HttpServletRequest request) {
		
		String[] selectedTiles = request.getParameterValues("SelectedTiles");
		String scheduleDesc = request.getParameter("schedDesc");
		char[] schedStream = new char[NUMBER_OF_SCHED_TIMESLOTS];
		
		if (scheduleDesc.length() == 0) {
			Schedule sched = scheduleService.getScheduleByUserID(user.getUserID());
			scheduleDesc = sched.getSchedDesc();
		}
		for(int i=0; i<NUMBER_OF_SCHED_TIMESLOTS; i++){
			schedStream[i] = '0';
		}
		try{
			for(String i : selectedTiles){
				schedStream[Integer.parseInt(i)] = '1';
			}
		}
		catch(NullPointerException e){}
			
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
	public String searchSched(@ModelAttribute("user") User user, HttpServletRequest request, Model model) {
		Boolean[] schedBitStream = new Boolean[NUMBER_OF_SCHED_TIMESLOTS];
		for (int i=0; i<NUMBER_OF_SCHED_TIMESLOTS; i++)
			schedBitStream[i] = false;
		
		model.addAttribute("schedStream", schedBitStream);
		model.addAttribute("timeslots", TIMESLOTS);
		
		return "searchSched";
	}
	
	@RequestMapping("/searchschedresults") 
	public String searchSchedResults(@ModelAttribute("user") User user, HttpServletRequest request, Model model){
		String[] selectedTiles = request.getParameterValues("SelectedTiles");
		
		List<User> usersWithMatchSched = new ArrayList<User>();
		List<Schedule> allScheds = scheduleService.getScheduleList();
		List<Schedule> matchingScheds = new ArrayList<Schedule>();
		List<Boolean[]> schedStreams = new ArrayList<Boolean[]>();
		
		try {
		for (Schedule schedule : allScheds) {
			Boolean[] schedBitStream = getSchedBitStream(schedule.getSchedStream());
			if (schedMatches(selectedTiles, schedBitStream) && user.getUserID()!=schedule.getUserID()) {
				usersWithMatchSched.add(userService.getUserByUserID(schedule.getUserID()));
				matchingScheds.add(schedule);
				schedStreams.add(schedBitStream);
			}
		}
		}
		catch(NullPointerException e){}
		
		model.addAttribute("userList", usersWithMatchSched);
		model.addAttribute("schedList", matchingScheds);
		model.addAttribute("schedStreamList", schedStreams);
		model.addAttribute("timeslots", TIMESLOTS);
		
		return "searchSchedResult";
	}
	
	@RequestMapping("/matchmysched")
	public String matchMySched(@ModelAttribute("user") User user, HttpServletRequest request, Model model) {
		
		List<User> usersWithMatchSched = new ArrayList<User>();
		List<Schedule> allScheds = scheduleService.getScheduleList();
		List<Schedule> matchingScheds = new ArrayList<Schedule>();
		List<Boolean[]> schedStreams = new ArrayList<Boolean[]>();
		List<Integer>percentMatchList = new ArrayList<Integer>();
		Boolean[] userSchedBitStream = getSchedBitStream(scheduleService.getScheduleByUserID(user.getUserID()).getSchedStream());
		int userSlots = StringUtils.countOccurrencesOf(scheduleService.getScheduleByUserID(user.getUserID()).getSchedStream(), "1");
		
		for (Schedule schedule : allScheds) {
			Boolean[] schedBitStream = getSchedBitStream(schedule.getSchedStream());
			int matchCount = getNumberMatching(userSchedBitStream, schedBitStream);
			if (matchCount>0 && user.getUserID()!=schedule.getUserID()) {
				usersWithMatchSched.add(userService.getUserByUserID(schedule.getUserID()));
				matchingScheds.add(schedule);
				schedStreams.add(schedBitStream);
				float percent = (float)matchCount/userSlots * 100;
				percentMatchList.add((int)percent);
			}
		}
		
		model.addAttribute("userList", usersWithMatchSched);
		model.addAttribute("schedList", matchingScheds);
		model.addAttribute("schedStreamList", schedStreams);
		model.addAttribute("percentMatchList", percentMatchList);
		model.addAttribute("timeslots", TIMESLOTS);
		
		return "searchSchedResult";
	}
	
	private boolean schedMatches(String[] matchMe, Boolean[] matchee) {
		for(String i : matchMe){
			if (!matchee[Integer.parseInt(i)])
				return false;
		}
		return true;
	}
	
	private Boolean[] getSchedBitStream(String schedStream) {
		Boolean[] schedBitStream = new Boolean[schedStream.length()];
		for (int i=0; i<schedStream.length(); i++) {
			if (schedStream.charAt(i)=='1') schedBitStream[i]=true;
			else schedBitStream[i] = false;
		}
		return schedBitStream;
	}

	private int getNumberMatching(Boolean[] stream1, Boolean[] stream2) {
		int numMatching = 0;
		for (int i=0; i<stream1.length; i++)
			if (stream1[i] && stream2[i]) numMatching++;
		return numMatching;
	}
}