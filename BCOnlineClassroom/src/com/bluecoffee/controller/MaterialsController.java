package com.bluecoffee.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
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
import com.bluecoffee.domain.FPostag;
import com.bluecoffee.domain.MatFile;
import com.bluecoffee.domain.MatFolder;
import com.bluecoffee.domain.MatSubject;
import com.bluecoffee.domain.User;
import com.bluecoffee.services.MatFileService;
import com.bluecoffee.services.MatFolderService;
import com.bluecoffee.services.MatSubjectService;
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
public class MaterialsController {

	@Autowired MatFileService matFileService;
	@Autowired MatSubjectService matSubjectService;
	@Autowired MatFolderService matFolderService;
	@Autowired UserService userService;
	
	@RequestMapping("/materials")
	public String getSubjectList(@CookieValue(value="cs192session", defaultValue="none") String fooCookie, Model model) {
		
		if(CookieHandler.decryptCookie(fooCookie)==null){ return "notfound"; }
		
		List<MatSubject> matSubjectList = matSubjectService.getMatSubjectList();
		model.addAttribute("matSubjectList", matSubjectList);
		return "subjectList";//new ModelAndView("subjectList", "matSubjectList", matSubjectList);
	}
	
	@RequestMapping("/subfolder")
	public String getFolderList(@RequestParam String id, @RequestParam(value = "us", required=false, defaultValue="0") int us, 
			@ModelAttribute MatFolder matFolder, Model model){
		
		List<MatFolder> matFolderList = matFolderService.getMatFolderList();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		for(MatFolder folder : matFolderList){
			List<MatFile> matfilelist = matFileService.getMatFileListBySubjectFolder(id, folder.getMatFolderID());
			
			for(MatFile matfile : matfilelist){
				User user = userService.getUserByUserID(matfile.getUserID());
				matfile.setUploader(user.getFirstName()+" "+user.getLastName()+" ("+user.getUsername()+")");
				
			}
			
			map.put(folder.getFolderName(), matfilelist);
		}
		
		SortedSet<String> keys = new TreeSet<String>(map.keySet());
		
		MatSubject matSubject = matSubjectService.getMatSubjectIDbyName(id);

		model.addAttribute("id", id);
		model.addAttribute("desc", matSubject.getSubjectDesc());
		model.addAttribute("success", us);
		model.addAttribute("keys", keys);
		model.addAttribute("map", map);
		
		return "resource";
		//return new ModelAndView("resource", "map", map);
		/*
		matFile = matFileService.getMatFile(id);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("matFile", matFile);		
		
		return new ModelAndView("subfolder", "map", map);*/
	}
	
	@RequestMapping("/searchfile")
	public String searchfile(/*@ModelAttribute String s,*/ Model model, HttpServletRequest request){
		
		String s = request.getParameter("s");
		
		List<MatFile> matFileList = matFileService.getMatFileListByFilename(s);
		for(MatFile matFile : matFileList){
			User user = userService.getUserByUserID(matFile.getUserID());
			matFile.setUploader(user.getFirstName()+" "+user.getLastName()+" ("+user.getUsername()+")");
		}
		model.addAttribute("matFileList", matFileList);	
		
		return "searchresult";
	}
	

	@RequestMapping(value="/download", params="fid")
	public String gotodownloadthigy(@RequestParam int fid, Model model){
		model.addAttribute("fid", fid);
		return "download";
	}
	
	@RequestMapping("/upload")
	public String upload(@RequestParam String id, @RequestParam String sf, @ModelAttribute MatFile matFile, Model model) {
		model.addAttribute("id", id);
		model.addAttribute("sf", sf);
		
		return "upload";
	}
	
	
	/****************** FOR ADMIN ONLY **************************/
	
	/*** for deleting resource ***/
	@RequestMapping("/deletematerial")
	public String deleteMaterial(@ModelAttribute("user") User user, @RequestParam int mid, @RequestParam String id){
		if(user.getAdmin()){
			matFileService.deleteData(mid);
			return "redirect:/subfolder?id="+id;
		}
		else{ return "notfound"; }
		
	}
	
	@RequestMapping("/deletesubject")
	public String deleteSubject(@ModelAttribute("user") User user, @RequestParam int sid){
		if(user.getAdmin()){
			try{ matSubjectService.deleteSubject(sid); }
			catch(Exception e){
				//what to do if it has contents?
			}
			return "redirect:/materials";
		}
		else{ return "notfound"; }
	}
	
	@RequestMapping("/addsubject")
	public String addSubject(@ModelAttribute("user") User user, @ModelAttribute MatSubject matSubject) {
		//if subject exists return error
		//else add subject
		if (user.getAdmin()) {
			try {matSubjectService.getMatSubjectIDbyName(matSubject.getSubjectName());}
			catch (Exception e) {
				matSubjectService.addSubject(matSubject);
				//successful subject added modal
				return "redirect:/materials";
			}
			//subject already exists modal
			return "redirect:/materials";
		}
		else{ return "notfound"; }
	}
	
	
	/*************************************************************/
	
	
	@RequestMapping("/fileUploaded")
	public String uploadfile(@RequestParam String id, @RequestParam String sf, @ModelAttribute MatFile matFile, @ModelAttribute("user") User user, HttpServletRequest request) {

		int uploadsuccessful=0;
		
		File file;
		int maxFileSize = 5000 * 1024;
		int maxMemSize = 5000 * 1024;
		ServletContext context = request.getServletContext();
		String filePath = context.getInitParameter("file-upload");
		filePath = filePath + "\\" + id + "\\" + sf + "\\";

		// Verify the content type
		String contentType = request.getContentType();
		if ((contentType.indexOf("multipart/form-data") >= 0)) {

		DiskFileItemFactory factory = new DiskFileItemFactory();
		// maximum size that will be stored in memory
		factory.setSizeThreshold(maxMemSize);
		// Location to save data that is larger than maxMemSize.
		factory.setRepository(new File("c:\\temp"));

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);
		// maximum file size to be uploaded.
		upload.setSizeMax( maxFileSize );
		try{ 
			// Parse the request to get file items.
			List fileItems = upload.parseRequest(request);

			// Process the uploaded file items
			Iterator i = fileItems.iterator();

			while ( i.hasNext () ) {
				FileItem fi = (FileItem)i.next();
				if ( !fi.isFormField () ){
					// Get the uploaded file parameters
					String fieldName = fi.getFieldName();
					String fileName = fi.getName();
					boolean isInMemory = fi.isInMemory();
					long sizeInBytes = fi.getSize();
					// Write the file
					if( fileName.lastIndexOf("\\") >= 0 ){
						file = new File( filePath + fileName.substring( fileName.lastIndexOf("\\")));
						fileName = fileName.substring( fileName.lastIndexOf("\\")+1);
					}
					else{
						file = new File( filePath + fileName.substring(fileName.lastIndexOf("\\")+1));
						fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
					}
				
					fi.write( file );
					
					String[] parts = fileName.split("\\.");
					
					MatFile mf = new MatFile();
					mf.setFileName(fileName);
					mf.setFileType(parts[1]);
					mf.setFileSize(fi.getSize());
					mf.setUploadDate(new Date());
					mf.setPath(filePath);
					mf.setMatSubjectID(matSubjectService.getMatSubjectIDbyName(id).getMatSubjectID());
					mf.setMatFolderID(matFolderService.getMatFolderIDbyName(sf));
					
					mf.setUserID(user.getUserID());
					
					matFileService.insertData(mf);
					
					
				}
			}
			
			uploadsuccessful = 1;
		}catch(Exception ex) {
			//System.out.println(ex);
			uploadsuccessful = -1;
		}
		}
		else{
			uploadsuccessful = -1;
		}
		
		return "redirect:/subfolder?id="+id+"&us="+uploadsuccessful;
	}
	
	/*** add materials category ***/
	@RequestMapping("/addmatcategory")
	public String addCategory(@ModelAttribute MatFolder matFolder){
		matFolderService.insertCategory(matFolder);
		return "redirect:/materials";
	}
	
}