package com.bluecoffee.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
			@ModelAttribute MatFolder matFolder){
		/*
		List<MatFolder> matFolderList = matFolderService.getMatFolderList();
	
		return new ModelAndView("subfolder", "matFolderList", matFolderList);
		*/
		
		List<MatFolder> matFolderList = matFolderService.getMatFolderList();
		List<MatFile> matFileList = matFileService.getMatFileListBySubjectName(id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		for(MatFolder folder : matFolderList){
			map.put(folder.getFolderName(), matFileService.getMatFileListBySubjectFolder(id, folder.getMatFolderID()));
		}
				
		return new ModelAndView("subfolder", "map", map);
		/*
		matFile = matFileService.getMatFile(id);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("matFile", matFile);		
		
		return new ModelAndView("subfolder", "map", map);*/
	}
	
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
	}

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

	/*WALA DAPAT TOOOOO LALALALALDJSFKJJAHSIFKVEDUIR*/
	@RequestMapping("/download")
	public String gotodownloadthigy(Model model){
		return "download";
	}
	
	
}