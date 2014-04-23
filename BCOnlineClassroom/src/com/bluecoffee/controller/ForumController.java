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
import com.bluecoffee.domain.MatFolder;
import com.bluecoffee.domain.MatSubject;
import com.bluecoffee.domain.User;
import com.bluecoffee.domain.FCategory;
import com.bluecoffee.services.FPostService;
import com.bluecoffee.services.FCommentService;
import com.bluecoffee.services.FTagService;
import com.bluecoffee.services.FPostagService;
import com.bluecoffee.services.UserService;
import com.bluecoffee.services.FCategoryService;

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
	@Autowired FCategoryService fCategoryService;
	
	//@Autowired private User user;
	
	/*** Shows all posts in the forum ***/
	@RequestMapping("/forum")
	public String showPosts(@CookieValue(value="cs192session", defaultValue="none") String fooCookie,
			@RequestParam(value = "r", required=false, defaultValue="0") int r, Model model, 
			@RequestParam(value = "fc", required=false, defaultValue="-1") int fc){
		
		List<FPost> fPostList;
		if(CookieHandler.decryptCookie(fooCookie)==null){ return "notfound"; }
		
		List<FCategory> fCategoryList = fCategoryService.getCategoryList();
		model.addAttribute("fCategoryList", fCategoryList);
		
		if(fc!=-1){ fPostList = fPostService.getFPostByCategory(fc); }
		else { fPostList = fPostService.getFPostList(); }
		
		for(FPost fPost : fPostList){
			User user = userService.getUserByUserID(fPost.getUserID());
			fPost.setPoster(user.getFirstName()+" "+user.getLastName()+" ("+user.getUsername()+")");
		}
		Collections.reverse(fPostList);
		model.addAttribute("fPostList", fPostList);
		model.addAttribute("r", r);
		model.addAttribute("fc", fc);
		
		return "forum";
	}
	
	/*** for creating a new post. redirects to viewpost ***/
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


	/*** shows result of search ***/
	@RequestMapping("/searchpost")
	public String searchpost(Model model, HttpServletRequest request){
		
		String s = request.getParameter("s");
		
		int fTagID = fTagService.getFTagID(s);
		List<FPostag> fPostagList = fPostagService.getFPostagListByTagID(fTagID);
		List<FPost> fPostList = new ArrayList<FPost>();
		for(FPostag fPostag : fPostagList){
			fPostList.add( fPostService.getFPostByID(fPostag.getFPostID()) );	
		}
		
		for(FPost fPost : fPostList){
			User user = userService.getUserByUserID(fPost.getUserID());
			fPost.setPoster(user.getFirstName()+" "+user.getLastName()+" ("+user.getUsername()+")");
		}
		Collections.reverse(fPostList);
		model.addAttribute("fPostList", fPostList);
		
		if(fPostList.isEmpty()){ model.addAttribute("noresultfound", "true"); }
		else{ model.addAttribute("noresultfound", "false"); }
		
		return "forumSearchResult";
	}
	
	/*** shows one post and its comments ***/
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
		List<FTag> fTagList = new ArrayList<FTag>();
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
	
	/*** for posting a comment. Redirects to viewpost ***/
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
	
	/**************** ADMIN FUNCTIONS *********************/
	
	/*** for deleting post ***/
	@RequestMapping("/deletepost")
	public String deletePost(@ModelAttribute("user") User user, @RequestParam int pid){
		if(user.getAdmin()){
			fPostService.deleteData(pid);
			return "redirect:/forum";
		}
		else{ return "notfound"; }
		
	}
	
	/*** for deleting comment ***/
	@RequestMapping("/deletecomment")
	public String deleteComment(@ModelAttribute("user") User user, @RequestParam int pid, @RequestParam int cid){
		if(user.getAdmin()){
			fCommentService.deleteData(cid);
			fPostService.decCommentCount(pid);
			return "redirect:/viewpost?pid="+pid;
		}
		else{ return "notfound"; }
	}
	
	/*** add category ***/
	@RequestMapping("/addcategory")
	public String addCategory(@ModelAttribute FCategory fCategory){
		fCategoryService.insertCategory(fCategory);
		return "redirect:/forum";
	}
	
	/*****************************************************/
}