package com.bluecoffee.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bluecoffee.services.MatFileService;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestParam;

import com.bluecoffee.services.MatFolderService;
import com.bluecoffee.services.MatSubjectService;


import javax.servlet.http.*;


@Controller
public class BatchDownloadController {
	
	@Autowired MatFileService matfileservice;
	@Autowired MatFolderService matfolderservice;
	@Autowired MatSubjectService matsubjectservice;

	private static final int BUFFER_SIZE = 4096;
    private static final String OUTPUT_ZIP_FILE = "C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\materials.zip";
	
	@RequestMapping("/batchdownload")
	public void batchdownload(
			HttpServletRequest request, 
			HttpServletResponse response, 
			@RequestParam String sn, 
			@RequestParam String fn) throws IOException {
		
		
		/*** creating zip file ***/
		String subjectName = sn;
		String folderName = fn;
		
		String SOURCE_FOLDER = "C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\"+subjectName+"\\"+folderName;
		
		String[] selectedValues = request.getParameterValues("SelectedFiles");
		if(selectedValues==null){
			selectedValues = new String[0];
		}
    	Zipper zipper = new Zipper(SOURCE_FOLDER, selectedValues);
    	zipper.generateFileList(new File(SOURCE_FOLDER));
    	zipper.zipIt(OUTPUT_ZIP_FILE);
		/****************************************/
		
		/*** downloading created zip file ***/
		String filePath = OUTPUT_ZIP_FILE;
		
		// get absolute path of the application
		ServletContext context = request.getServletContext();
		//String appPath = context.getRealPath("");
		String fileRepository = context.getInitParameter("file-upload");
		System.out.println("fileRepository = " + fileRepository);

		// construct the complete absolute path of the file
		//String fullPath = fileRepository + filePath;		
		//replaced fullPath with filePath
		File downloadFile = new File(filePath);
		FileInputStream inputStream = new FileInputStream(downloadFile);
		
		// get MIME type of the file
		String mimeType = context.getMimeType(filePath);
		if (mimeType == null) {
			// set to binary type if MIME mapping not found
			mimeType = "application/octet-stream";
		}
		System.out.println("MIME type: " + mimeType);

		// set content attributes for the response
		response.setContentType(mimeType);
		response.setContentLength((int) downloadFile.length());

		// set headers for the response
		String headerKey = "Content-Disposition";
		String headerValue = String.format("attachment; filename=\"%s\"",
				downloadFile.getName());
		response.setHeader(headerKey, headerValue);

		// get output stream of the response
		OutputStream outStream = response.getOutputStream();

		byte[] buffer = new byte[BUFFER_SIZE];
		int bytesRead = -1;

		// write bytes read from the input stream into the output stream
		while ((bytesRead = inputStream.read(buffer)) != -1) {
			outStream.write(buffer, 0, bytesRead);
		}

		inputStream.close();
		outStream.close();
		/************************************/
	}
	
}