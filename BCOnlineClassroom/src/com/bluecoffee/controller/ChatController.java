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

	
	/*** CHATHOME.jsp FUNCTIONS ***/
	
	@RequestMapping("/chat") /** shows all conversations **/
	public String showConvoList(
			@CookieValue(value="cs192session", defaultValue="none") String fooCookie,
			/*@ModelAttribute("user") User user,*/ Model model, HttpSession session,
			@RequestParam(value = "q", required=false, defaultValue="0") int q, 
			@RequestParam(value = "s", required=false, defaultValue="") String s,
			@RequestParam(value = "v", required=false, defaultValue="-1") int v){
		
		if(CookieHandler.decryptCookie(fooCookie)==null){ return "notfound"; }
		
		User user = (User) session.getAttribute("user");
		
		List<ChatConvo> chatConvoList = chatConvoService.getConvoListByUserID(user.getUserID());
		model.addAttribute("chatConvoList", chatConvoList);

		/*** Online users section ***/
		// q = [1: show online users | 0: show all users] //
		List<User> userList = getUserList(q, s);
		model.addAttribute("userList", userList);
		model.addAttribute("q", q);
		/****************************/
		
		/*** flag to show 'model asking for title' or not ***/
		if(v==-1){ model.addAttribute("nc", 0); }
		else{
			model.addAttribute("v", v);
			model.addAttribute("nc", 1);
		}
		/***************************/

		return "chathome";
	}
	
	
	@RequestMapping("/gettitle")
	public String makeModalVisible(Model model, @RequestParam int v){
		model.addAttribute("v", v);
		return "redirect:/chat?v="+v;
	}
	
	@RequestMapping("/newconvo") /** creates a new conversation **/
	public String createConvo(@ModelAttribute("user") User user, @RequestParam int v, HttpServletRequest request){
		String title = request.getParameter("title");
		
		int c = chatConvoService.insertData(title);
		chatConvoService.insertMember(c, v);
		chatConvoService.insertMember(c, user.getUserID());
				
		return "redirect:/conversation?c="+c;
	}
	
	@RequestMapping ("/searchuser")
	public String searchUser(HttpServletRequest request, @RequestParam(value = "c", required=false, defaultValue="-1") int c){ //else if search from conversation page
		String s = request.getParameter("s");

		//if search from chathome.jsp
		if(c==-1){ return "redirect:/chat?q=2&s="+s; }
		//else if search from conversation.jsp
		else{ return "redirect:/conversation?q=2&c="+c+"&s="+s; }
	}

	
	/**********************************************/
	
	/*** CONVERSATION.jsp FUNCTIONS ***/
	
	@RequestMapping("/conversation") //shows messages in a conversation
	public String showConversation(@ModelAttribute("user") User user, Model model, 
			@RequestParam int c, 
			@RequestParam(value = "q", required=false, defaultValue="0") int q,
			@RequestParam(value = "s", required=false, defaultValue="") String s,
			@RequestParam(value = "lc", required=false, defaultValue="0") int lc,
			@RequestParam(value = "au", required=false, defaultValue="0") int au,
			@RequestParam(value = "u", required=false, defaultValue="0") int u){

		int chatConvoID = c;
		model.addAttribute("c", chatConvoID);
		
		/*** List of Messages ***/
		List<ChatMessage> chatMessageList = chatMessageService.getMessageListByConvoID(chatConvoID);
		for(ChatMessage message : chatMessageList){
			User sender = userService.getUserByUserID(message.getUserID());
			message.setSender( sender.getFirstName() + " " + sender.getLastName() );
		}
		
		model.addAttribute("chatMessageList", chatMessageList);
		/******************************/
		
		/*** List of Members of Conversation ***/
		List<User> membersList = userService.getChatMembers(c);
		model.addAttribute("membersList", membersList);
		/***************************************/
		
		/*** Online users section ***/
		List<User> userList = getUserList(q, s);		
		model.addAttribute("userList", userList);
		model.addAttribute("q", q);
		/****************************/
		
		/*** Convo name ***/
		model.addAttribute("convoTitle", chatConvoService.getTitleByID(c));
		/****************************/
		
		/*** lc ***/
		model.addAttribute("lc",lc);
		/********************/
		
		/*** au ***/
		model.addAttribute("au", au);
		/************************/
		
		/*** User to be added u ***/
		model.addAttribute("u", u);
		/****************************/
		
		return "conversation";
	}
	
	@RequestMapping("/sendmessage") //sends message; redirects to conversation
	public String insertMessage(@ModelAttribute("user") User user, @ModelAttribute ChatMessage chatMessage, @RequestParam int c){
		
		int chatConvoID = c;
		
		chatMessage.setChatConvoID(chatConvoID);
		chatMessage.setMessageDate(new Date());
		chatMessage.setUserID(user.getUserID());
		
		chatMessageService.insertMessage(chatMessage);
		
		return "redirect:/conversation?c="+chatConvoID;
	}
	
	@RequestMapping("/areyousure")
	public String showareyousuremodal(@RequestParam int c, @RequestParam int u){
		int chatConvoID = c;
		int userID = u;
		int au;
		
		if(chatConvoService.isMemberInConvo(chatConvoID, userID)){ au = 2; }
		else{ au = 1; }
		
		return "redirect:conversation?c="+chatConvoID+"&au="+au+"&u="+u;
	}
	
	@RequestMapping("/addmember")
	public String addMember(@RequestParam int c, @RequestParam int u){
		
		int chatConvoID = c;
		int userID = u;
		
		chatConvoService.insertMember(chatConvoID, userID);
		
		return "redirect:/conversation?c="+chatConvoID;
	}
	
	@RequestMapping("/leave")
	public String deleteFromChatMember(@ModelAttribute("user") User user, @RequestParam int c){
		chatConvoService.deleteMember(c, user.getUserID());
		return "redirect:/chat";
	}
	
	/************************************************************/
	
	/*** OTHER FUNCTIONS ***/
	
	public List<User> getUserList(int q, String s){
		List<User> userList = null;
		
		//if show online users only
		if(q==1){ userList = userService.getChatOnline(); }
		//else if search result
		else if(q==2){ userList = userService.getUserListByUsername(s); }
		//else if all users
		else{ userList = userService.getChatUser(); }
		
		return userList;
	}
	/***********************************************************/
}