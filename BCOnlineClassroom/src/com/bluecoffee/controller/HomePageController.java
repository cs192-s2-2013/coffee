package com.bluecoffee.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import java.util.Locale;
import org.springframework.ui.Model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bluecoffee.domain.MatFile;
import com.bluecoffee.services.MatFileService;
import com.bluecoffee.domain.MatSubject;
import com.bluecoffee.services.MatSubjectService;

@Controller
public class HomePageController {

	@Autowired
	MatFileService matFileService;
	
	@Autowired
	MatSubjectService matSubjectService;
	
	@RequestMapping("/home")
	public String homepage(Model model) {
		return "home";
	}
	
	@RequestMapping("/chat")
	public String chat(Model model) {
		return "chat";
	}

	@RequestMapping("/forum")
	public String forum(Model model) {
		return "forum";
	}
	
}