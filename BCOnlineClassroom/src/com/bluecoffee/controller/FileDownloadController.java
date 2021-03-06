package com.bluecoffee.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.CookieValue;
import org.jasypt.util.text.BasicTextEncryptor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.beans.factory.annotation.Autowired;
import com.bluecoffee.services.MatFileService;

@Controller
public class FileDownloadController {
	
	/**
	 * Size of a byte buffer to read/write file
	 */
	private static final int BUFFER_SIZE = 4096;
	
	@Autowired
	MatFileService matfileservice;
	
	/**
	 * Path of the file to be downloaded, relative to application's directory
	 */
	//private String filePath = "/downloads/SpringProject.zip";
	private String filePath = "\\";
	
	/**
	 * Method for handling file download request from client
	 */
	@RequestMapping(value = "/download.do", params = "fid", method = RequestMethod.GET)
	public void doDownload(@RequestParam int fid, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		
		filePath = matfileservice.getFilePathByID(fid) + matfileservice.getFileNameByID(fid);
		//filePath = filePath + filename;
		
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
	}
	
	
}