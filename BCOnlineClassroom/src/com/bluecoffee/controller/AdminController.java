package com.bluecoffee.controller;

import java.util.List;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

import com.bluecoffee.domain.FCategory;
import com.bluecoffee.domain.User;
import com.bluecoffee.domain.MatFile;
import com.bluecoffee.domain.MatFolder;
import com.bluecoffee.domain.MatSubject;
import com.bluecoffee.domain.FCategory;
import com.bluecoffee.domain.FPost;
import com.bluecoffee.domain.FComment;
import com.bluecoffee.services.FCategoryService;
import com.bluecoffee.services.FCommentService;
import com.bluecoffee.services.FPostService;
import com.bluecoffee.services.FPostagService;
import com.bluecoffee.services.FTagService;
import com.bluecoffee.services.MatFileService;
import com.bluecoffee.services.MatFolderService;
import com.bluecoffee.services.MatSubjectService;
import com.bluecoffee.services.UserService;

@Controller
@SessionAttributes("user")
public class AdminController {
	
	@Autowired MatFileService matFileService;
	@Autowired MatSubjectService matSubjectService;
	@Autowired MatFolderService matFolderService;
	
	@Autowired FPostService fPostService;
	@Autowired FCommentService fCommentService;
	@Autowired FCategoryService fCategoryService;
	
    @Autowired UserService userService;

    @RequestMapping("/admin")
        public String adminpage(@ModelAttribute("user") User user, Model model){
                
                if(user.getAdmin()){
                        /** Materials **/
                        /* Subject */
                        List<MatSubject> matSubjectList = matSubjectService.getMatSubjectList();
                        model.addAttribute("matSubjectList", matSubjectList);
                        
                        /* Category */
                        List<MatFolder> matFolderList = matFolderService.getMatFolderList();
                        model.addAttribute("matFolderList", matFolderList);

                        /* File */
                        List<MatFile> matFileList = matFileService.getMatFileList();
                        
                        HashMap<Integer, String> subjectMap = new HashMap<Integer, String>();
                        for(MatSubject subject : matSubjectList){ subjectMap.put(subject.getMatSubjectID(), subject.getSubjectName()); }
            
                        HashMap<Integer, String> folderMap = new HashMap<Integer, String>();
                        for(MatFolder folder : matFolderList){ folderMap.put(folder.getMatFolderID(), folder.getFolderName()); }
                        
                        for(MatFile file : matFileList){
                                User u = userService.getUserByUserID(file.getUserID());
                                file.setUploader(u.getUsername());
                                file.setSubjectName( subjectMap.get(file.getMatSubjectID()) );
                                file.setFolderName( folderMap.get(file.getMatFolderID()) );
                        }
                        model.addAttribute("matFileList", matFileList);
                        
                        /** Forum **/
                        /* Category */
                        List<FCategory> fCategoryList = fCategoryService.getCategoryList();
                        model.addAttribute("fCategoryList", fCategoryList);
                        
                        /* Post */
                        List<FPost> fPostList = fPostService.getFPostList();
                        
                        for(FPost post : fPostList){
                                User u = userService.getUserByUserID(post.getUserID());
                                post.setPoster(u.getUsername());
                        }
                        model.addAttribute("fPostList", fPostList);
                                
                        /* Comment */
                        List<FComment> fCommentList = fCommentService.getFCommentList();
                        
                        for(FComment comment: fCommentList){
                                User u = userService.getUserByUserID(comment.getUserID());
                                comment.setCommenter(u.getUsername());
                        }
                        model.addAttribute("fCommentList", fCommentList);
                        
                        return "adminhome";
                }
                else{ return "notfound"; }
        }
	
	@RequestMapping("/admin/addsubject")
	public String addSubject(@ModelAttribute("user") User user, @ModelAttribute MatSubject matSubject) {
		//if subject exists return error
		//else add subject
		if (user.getAdmin()) {
			try {matSubjectService.getMatSubjectIDbyName(matSubject.getSubjectName());}
			catch (Exception e) {
				matSubjectService.addSubject(matSubject);
				//successful subject added modal
				return "redirect:/admin";
			}
			//subject already exists modal
			return "redirect:/admin";
		}
		else{ return "notfound"; }
	}
	
	@RequestMapping("/admin/deletesubject")
	public String deleteSubject(@ModelAttribute("user") User user, @RequestParam int sid){
		if(user.getAdmin()){
			try{ matSubjectService.deleteSubject(sid); }
			catch(Exception e){
				//what to do if it has contents?
			}
			return "redirect:/admin";
		}
		else{ return "notfound"; }
	}
	
	@RequestMapping("/admin/addfolder")
	public String addCategory(@ModelAttribute("user") User user, @ModelAttribute MatFolder matFolder){
		if(user.getAdmin()){
			matFolderService.insertFolder(matFolder);
			return "redirect:/admin";
		}
		else{ return "notfound"; }
	}
	
	@RequestMapping("/admin/deletefolder")
	public String deleteFolder(@ModelAttribute("user") User user, @RequestParam int fid){
		if(user.getAdmin()){
			try{ matFolderService.deleteFolder(fid); }
			catch(Exception e){
				//what to do if it has contents?
			}
			return "redirect:/admin";
		}
		else{ return "notfound"; }
	}
	
	@RequestMapping("/admin/deletefile")
	public String deleteFile(@ModelAttribute("user") User user, @RequestParam int id){
		if(user.getAdmin()){
			try{ matFileService.deleteData(id); }
			catch(Exception e){
				//what to do if it has contents?
			}
			return "redirect:/admin";
		}
		else{ return "notfound"; }
	}
	
	@RequestMapping("/admin/addcategory")
	public String addCategory(@ModelAttribute("user") User user, @ModelAttribute FCategory fCategory){
		if(user.getAdmin()){
			fCategoryService.insertCategory(fCategory);
			return "redirect:/admin";
		}
		else{ return "notfound"; }
	}
	
	/* delete forum category */
	@RequestMapping("/admin/deletecategory")
	public String deleteCategory(@ModelAttribute("user") User user, @RequestParam int cid){
		if(user.getAdmin()){
			try{ fCategoryService.deleteCategory(cid); }
			catch(Exception e){
				//what to do if it has contents?
			}
			return "redirect:/admin";
		}
		else{ return "notfound"; }
		
	}
	
	/* delete forum post */
	@RequestMapping("/admin/deletepost")
	public String deletePost(@ModelAttribute("user") User user, @RequestParam int pid){
		if(user.getAdmin()){
			fPostService.deleteData(pid);
			return "redirect:/admin";
		}
		else{ return "notfound"; }
		
	}
	
	/* delete forum comment */
	@RequestMapping("/admin/deletecomment")
	public String deleteComment(@ModelAttribute("user") User user, @RequestParam int pid, @RequestParam int cid){
		if(user.getAdmin()){
			fCommentService.deleteData(cid);
			fPostService.decCommentCount(pid);
			return "redirect:admin";
		}
		else{ return "notfound"; }
	}
}
