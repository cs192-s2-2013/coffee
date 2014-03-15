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
import org.springframework.web.servlet.ModelAndView;

import com.bluecoffee.domain.MatFile;
import com.bluecoffee.domain.MatFolder;
import com.bluecoffee.domain.MatSubject;
import com.bluecoffee.services.MatFileService;
import com.bluecoffee.services.MatFolderService;
import com.bluecoffee.services.MatSubjectService;

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
public class MaterialsController {

	@Autowired
	MatFileService matFileService;
	@Autowired
	MatSubjectService matSubjectService;
	@Autowired
	MatFolderService matFolderService;
	
	@RequestMapping("/materials")
	public ModelAndView getSubjectList() {
		List<MatSubject> matSubjectList = matSubjectService.getMatSubjectList();
		return new ModelAndView("matSubjectList", "matSubjectList", matSubjectList);
	}
	
	@RequestMapping("/subfolder")
	public ModelAndView getFolderList(@RequestParam String id, 
			@ModelAttribute MatFolder matFolder, Model model){

		List<MatFolder> matFolderList = matFolderService.getMatFolderList();
		List<MatFile> matFileList = matFileService.getMatFileListBySubjectName(id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		for(MatFolder folder : matFolderList){
			map.put(folder.getFolderName(), matFileService.getMatFileListBySubjectFolder(id, folder.getMatFolderID()));
		}
				
		model.addAttribute("id", id);
		
		return new ModelAndView("subfolder", "map", map);
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
	}

	@RequestMapping(value="/download", params="filename")
	public String gotodownloadthigy(@RequestParam String filename, Model model){
		model.addAttribute("filename", filename);
		return "download";
	}
	
	@RequestMapping("/upload")
	public String upload(@RequestParam String id, @RequestParam String sf, @ModelAttribute MatFile matFile, Model model) {
		model.addAttribute("id", id);
		model.addAttribute("sf", sf);
		
		return "upload";
	}
	
	@RequestMapping("/fileUploaded")
	public String uploadfile(@RequestParam String id, @RequestParam String sf, @ModelAttribute MatFile matFile, HttpServletRequest request) {

		File file;
		int maxFileSize = 5000 * 1024;
		int maxMemSize = 5000 * 1024;
		ServletContext context = request.getServletContext();
		String filePath = context.getInitParameter("file-upload");

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
					
					matFileService.insertData(mf);
					
					
				}
			}
			
		}catch(Exception ex) {
			System.out.println(ex);
		}
	}
		
		return "fileUploaded";
	}
}