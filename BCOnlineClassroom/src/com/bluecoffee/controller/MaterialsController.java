package com.bluecoffee.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

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
	
	//@Autowired private User user;
	
	@RequestMapping("/materials")
	public ModelAndView getSubjectList() {
		List<MatSubject> matSubjectList = matSubjectService.getMatSubjectList();
		return new ModelAndView("subjectList", "matSubjectList", matSubjectList);
	}
	
	@RequestMapping("/subfolder")
	public ModelAndView getFolderList(@RequestParam String id, @RequestParam int us, 
			@ModelAttribute MatFolder matFolder, Model model){
		
		String message = "";
		
		if(us==0){ message = ""; }
		else if(us==1){ message = "File uploaded successfully"; }
		else if(us==-1){ message = "There was an error while uploading the file"; }
		
		List<MatFolder> matFolderList = matFolderService.getMatFolderList();
		//List<MatFile> matFileList = matFileService.getMatFileListBySubjectName(id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		for(MatFolder folder : matFolderList){
			List<MatFile> matfilelist = matFileService.getMatFileListBySubjectFolder(id, folder.getMatFolderID());
			map.put(folder.getFolderName(), matfilelist);
			
			for(MatFile matfile : matfilelist){
				User user = userService.getUserByUserID(matfile.getUserID());
				matfile.setUploader(user.getFirstName()+" "+user.getLastName()+" ("+user.getUsername()+")");
				
			}
		}
		
		model.addAttribute("id", id);
		model.addAttribute("message", message);
		
		return new ModelAndView("resource", "map", map);
		/*
		matFile = matFileService.getMatFile(id);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("matFile", matFile);		
		
		return new ModelAndView("subfolder", "map", map);*/
	}
	
	/*
	@RequestMapping("/register")
	public String registerUser(@ModelAttribute MatFile matFile) {

		return "register";
	}

	@RequestMapping("/insert")
	public String inserData(@ModelAttribute MatFile matFile) {
		if (matFile != null)
			matFileService.insertData(matFile);
		return "redirect:/getList";
	}

	@RequestMapping("/getList")
	public ModelAndView getUserLIst() {
		List<MatFile> matFileList = matFileService.getMatFileList();
		return new ModelAndView("matFileList", "matFileList", matFileList);
	}*/
/*
	@RequestMapping("/edit")
	public ModelAndView editMatFile(@RequestParam String id,
			@ModelAttribute MatFile matFile) {

		matFile = matFileService.getMatFile(id);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("matFile", matFile);
		
		return new ModelAndView("edit", "map", map);

	}

	@RequestMapping("/update")
	public String updateUser(@ModelAttribute MatFile matFile) {
		matFileService.updateData(matFile);
		return "redirect:/getList";

	}

	@RequestMapping("/delete")
	public String deleteUser(@RequestParam String id) {
		System.out.println("id = " + id);
		matFileService.deleteData(id);
		return "redirect:/getList";
	}*/

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
					mf.setMatSubjectID(matSubjectService.getMatSubjectIDbyName(id));
					mf.setMatFolderID(matFolderService.getMatFolderIDbyName(sf));
					
					mf.setUserID(user.getUserID());
					//mf.setUserID(1); //TODO should not be hardcoded
					
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
}