package com.bluecoffee.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

import com.bluecoffee.domain.User;
import com.bluecoffee.domain.ChatConvo;
import com.bluecoffee.domain.ChatMessage;
import com.bluecoffee.services.UserService;
import com.bluecoffee.services.ChatConvoService;
import com.bluecoffee.services.ChatMessageService;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.io.output.*;

import javax.servlet.jsp.PageContext;

@Controller
@SessionAttributes("user")
public class ChatController {
	
	@Autowired ChatConvoService chatConvoService;
	@Autowired ChatMessageService chatMessageService;
	@Autowired UserService userService;

	@RequestMapping("/chat")
	public String showConvoList(@ModelAttribute("user") User user, Model model){
		
		List<ChatConvo> chatConvoList = chatConvoService.getConvoListByUserID(user.getUserID());
		model.addAttribute("chatConvoList", chatConvoList);

		/*** Online users section ***/
		List<User> onlineUserList = userService.getChatOnline();
		List<User> allUserList = userService.getChatUser();
		model.addAttribute("onlineUserList", onlineUserList);
		model.addAttribute("allUserList", allUserList);
		/****************************/
		
		return "chathome";
	}
	
	@RequestMapping("/conversation")
	public String showConversation(@ModelAttribute("user") User user, Model model, /*param?*/ int chatConvoID){

		List<ChatMessage> chatMessageList = chatMessageService.getMessageListByConvoID();
		
		
		model.addAttribute("messageList", messageList);
		
		
		/*** Online users section ***/
		List<User> onlineUserList = userService.getChatOnline();
		List<User> allUserList = userService.getChatUser();
		
		model.addAttribute("onlineUserList", onlineUserList);
		model.addAttribute("allUserList", allUserList);
		/****************************/
		
		return "conversation";
	}
	
	
}