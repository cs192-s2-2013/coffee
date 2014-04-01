package com.bluecoffee.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
public class ForumController {
	
	@Autowired FPostService fPostService;
	@Autowired FCommentService fCommentService;
	@Autowired FTagService fTagService;
	@Autowired FPostagService fPostagService;
	@Autowired UserService userService;
	
	@Autowired private User user;
	
	@RequestMapping("/forum")
	public String showPosts(Model model){
		
		List<FPost> fPostList = fPostService.getFPostList();
		for(FPost fPost : fPostList){
			User user = userService.getUserByUserID(fPost.getUserID());
			fPost.setPoster(user.getFirstName()+" "+user.getLastName()+" ("+user.getUsername()+")");
		}
		model.addAttribute("fPostList", fPostList);
		
		return "forum";
	}

	@RequestMapping("/submitpost")
	public String submitPost(Model model){
		FPost fPost = new FPost();
		model.addAttribute("fPost", fPost);
		return "submitpost";
	}
	
	@RequestMapping("/insertpost")	//redirected from submitpost.jsp
	public String inserPost(@ModelAttribute FPost fPost) {
		if (fPost.getTitle().length() >0 && fPost.getContent().length() >0){
			
			fPost.setPostDate(new Date());
			//TODO fPost.setUserID();  should be based on uploader(session attribute)
			fPost.setUserID(1);//for now, default
			fPost.setCommentCount(0);
			fPostService.insertData(fPost);
			int fPostID = fPostService.getIDByFPost(fPost);
			
			/**tags**/
			String[] tags = fPost.getTag().split(",");
			for(String tag : tags){
				tag = tag.trim();
				int tagid = fTagService.getFTagID(tag);
				fPostagService.insertData(fPostID, tagid);
				
			}
		}
		return "redirect:/forum";
		//return "redirect:/viewpost?pid=" + fPostService.getIDByFPost(fPost);
	}
	
	@RequestMapping(value = "/forumPost", params = "pid")
	public String viewpost(@RequestParam int pid, Model model){
		
		FPost fPost = fPostService.getFPostByID(pid);
		User user = userService.getUserByUserID(fPost.getUserID());
		fPost.setPoster(user.getFirstName()+" "+user.getLastName()+" ("+user.getUsername()+")");
		
		List<FComment> fCommentList = fCommentService.getFCommentListByFPostID(pid);
		for(FComment fComment : fCommentList){
			user = userService.getUserByUserID(fComment.getUserID());
			fComment.setCommenter(user.getFirstName()+" "+user.getLastName()+" ("+user.getUsername()+")");
		}
		
		model.addAttribute("fPost", fPost);
		model.addAttribute("fCommentList", fCommentList);
		
		List<FPostag> fPostagList = fPostagService.getFPostagListByPostID(pid);
		List<FTag> fTagList = new ArrayList();
		for(FPostag fPostag : fPostagList){
			fTagList.add( fTagService.getFTag(fPostag.getFTagID()) );	
		}
		model.addAttribute("fTagList", fTagList);
		
		/**FComment for posting new comment**/
		FComment fComment = new FComment();
		model.addAttribute("fComment", fComment);
		model.addAttribute("pid",pid);
		
		return "forumPost";
	}
	
	@RequestMapping("/comment")
	public String comment(@RequestParam int pid, @ModelAttribute FComment fComment){
		if (fComment.getContent().length()>0){
			fComment.setCommentDate(new Date());
			fComment.setFPostID(pid);
			fComment.setUserID(1); //TODO:  user id from session attribute
			fCommentService.insertData(fComment);	
			
			fPostService.incCommentCount(pid);
		}
		return "redirect:/forumPost?pid="+pid;
	}
}