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

import com.bluecoffee.domain.FPost;
import com.bluecoffee.domain.FComment;
import com.bluecoffee.domain.FTag;
import com.bluecoffee.domain.FPostag;
import com.bluecoffee.domain.MatFile;
import com.bluecoffee.domain.MatSubject;
import com.bluecoffee.domain.User;
import com.bluecoffee.services.FPostService;
import com.bluecoffee.services.FCommentService;
import com.bluecoffee.services.FTagService;
import com.bluecoffee.services.FPostagService;
import com.bluecoffee.services.UserService;

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
public class ForumController {
	
	@Autowired FPostService fPostService;
	@Autowired FCommentService fCommentService;
	@Autowired FTagService fTagService;
	@Autowired FPostagService fPostagService;
	@Autowired UserService userService;
	
	//@Autowired private User user;
	
	@RequestMapping("/forum")
	public String showPosts(@RequestParam(value = "r", required=false, defaultValue="0") int r, Model model){
		
		List<FPost> fPostList = fPostService.getFPostList();
		for(FPost fPost : fPostList){
			User user = userService.getUserByUserID(fPost.getUserID());
			fPost.setPoster(user.getFirstName()+" "+user.getLastName()+" ("+user.getUsername()+")");
		}
		Collections.reverse(fPostList);
		model.addAttribute("fPostList", fPostList);
		model.addAttribute("r", r);
		
		return "forum";
	}
	
	@RequestMapping("/submitpost")	//redirected from submitpost.jsp
	public String inserPost(@ModelAttribute FPost fPost, @ModelAttribute("user") User user) {
		if (fPost.getTitle().length() >0 && fPost.getContent().length() >0){
			
			fPost.setPostDate(new Date());
			fPost.setUserID(user.getUserID());
			fPost.setCommentCount(0);
			fPostService.insertData(fPost);
			int fPostID = fPostService.getIDByFPost(fPost);
			
			/**tags**/
			String[] tags = fPost.getTag().split(" ");
			for(String tag : tags){
				tag = tag.trim();
				int tagid = fTagService.getFTagID(tag);
				fPostagService.insertData(fPostID, tagid);
				
			}
			
			return "redirect:/viewpost?pid=" + fPostID;
		}
		
		return "redirect:/forum";
	}
	
	//TODO redirect to a new page, not forum.jsp but similar
	@RequestMapping("/searchpost")
	public String searchpost(Model model, HttpServletRequest request){
		
		String s = request.getParameter("s");
		
		int fTagID = fTagService.getFTagID(s);
		List<FPostag> fPostagList = fPostagService.getFPostagListByTagID(fTagID);
		List<FPost> fPostList = new ArrayList();
		for(FPostag fPostag : fPostagList){
			fPostList.add( fPostService.getFPostByID(fPostag.getFPostID()) );	
		}
		
		for(FPost fPost : fPostList){
			User user = userService.getUserByUserID(fPost.getUserID());
			fPost.setPoster(user.getFirstName()+" "+user.getLastName()+" ("+user.getUsername()+")");
		}
		Collections.reverse(fPostList);
		model.addAttribute("fPostList", fPostList);
		
		return "forum";
	}
	
	@RequestMapping(value = "/viewpost", params = "pid")
	public String viewpost(@RequestParam int pid, Model model){
		
		/** fPost := specific post **/
		FPost fPost = fPostService.getFPostByID(pid);
		User user = userService.getUserByUserID(fPost.getUserID());
		fPost.setPoster(user.getFirstName()+" "+user.getLastName()+" ("+user.getUsername()+")");
		model.addAttribute("fPost", fPost);
		
		/** fCommentList := list of comments **/
		List<FComment> fCommentList = fCommentService.getFCommentListByFPostID(pid);
		for(FComment fComment : fCommentList){
			user = userService.getUserByUserID(fComment.getUserID());
			fComment.setCommenter(user.getFirstName()+" "+user.getLastName()+" ("+user.getUsername()+")");
		}
		model.addAttribute("fCommentList", fCommentList);
		
		/** fTagList := list  of tags **/
		List<FPostag> fPostagList = fPostagService.getFPostagListByPostID(pid);
		List<FTag> fTagList = new ArrayList();
		for(FPostag fPostag : fPostagList){
			fTagList.add( fTagService.getFTag(fPostag.getFTagID()) );	
		}
		model.addAttribute("fTagList", fTagList);
		
		/**FComment for posting new comment**/
		//FComment fComment = new FComment();
		//model.addAttribute("fComment", fComment);
		model.addAttribute("pid",pid);
		
		return "viewpost";
	}
	
	@RequestMapping("/comment")
	public String comment(@RequestParam int pid, @ModelAttribute FComment fComment, @ModelAttribute("user") User user){
		if (fComment.getContent().length()>0){
			fComment.setCommentDate(new Date());
			fComment.setFPostID(pid);
			fComment.setUserID(user.getUserID());
			fCommentService.insertData(fComment);	
			
			fPostService.incCommentCount(pid);
		}
		return "redirect:/viewpost?pid="+pid;
	}
}