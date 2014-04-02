package com.bluecoffee.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bluecoffee.domain.*;
import com.bluecoffee.services.MatFileService;
import com.bluecoffee.domain.MatSubject;
import com.bluecoffee.services.MatSubjectService;
import com.bluecoffee.services.UserService;

import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("user")
public class HomePageController {

	@Autowired
	MatFileService matFileService;
	@Autowired
	MatSubjectService matSubjectService;
	@Autowired UserService userService;
	
	//@Autowired private User user;
	
	@RequestMapping(value="/login", params = "un")
	public String login(@RequestParam String un, Model model){
		User user = userService.getUserByUsername(un);
		model.addAttribute("user", user);	
		return "home";
	}
	
	@RequestMapping("/home")
	public String homepage(Model model) {
		return "home";
	}
	
	@RequestMapping("/chat")
	public String chat(Model model) {
		return "chat";
	}

/*	@RequestMapping("/forum")
	public String forum(Model model) {
		return "forum";
	}
*/	
}