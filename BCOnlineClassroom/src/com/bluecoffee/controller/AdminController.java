package com.bluecoffee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

import com.bluecoffee.domain.User;
import com.bluecoffee.domain.MatFile;
import com.bluecoffee.domain.MatFolder;
import com.bluecoffee.domain.MatSubject;
import com.bluecoffee.services.MatFileService;
import com.bluecoffee.services.MatFolderService;
import com.bluecoffee.services.MatSubjectService;

@Controller
@SessionAttributes("user")
public class AdminController {
	
	@Autowired MatFileService matFileService;
	@Autowired MatSubjectService matSubjectService;
	@Autowired MatFolderService matFolderService;
	
	@RequestMapping("/admin")
	public String adminpage(@ModelAttribute("user") User user,
			@RequestParam(value = "collapse", required=false, defaultValue="0") int collapse,
			Model model){
		
		if(user.getAdmin()){
			/** Materials **/
			if(collapse==1){ /* Subject */
				List<MatSubject> matSubjectList = matSubjectService.getMatSubjectList();
				model.addAttribute("list", matSubjectList);
			}
			else if(collapse==2){ /* Category */
				List<MatFolder> matFolderList = matFolderService.getMatFolderList();
				model.addAttribute("list", matFolderList);
			}
			else if(collapse==3){ /* File */
				List<MatFile> matFileList = matFileService.getMatFileList();
				model.addAttribute("list", matFileList);
			}
			
			/** Forum **/
			else if(collapse==4){ /* Category */
				
			}
			else if(collapse==5){ /* Post */
				
			}
			else if(collapse==6){ /* Comment */
				
			}
			
			model.addAttribute("collapse", collapse);
			return "adminhome";
		}
		else{ return "notfound"; }
	}

}
