package com.bluecoffee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.*;

import org.springframework.web.bind.annotation.CookieValue;
import org.jasypt.util.text.BasicTextEncryptor;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
//@RequestMapping("/logout")
public class LogoutController {
	//@RequestMapping(method=RequestMethod.POST)
	@RequestMapping("/logout")
	public String logout(HttpSession session,
			@CookieValue(value="cs192session", defaultValue="none") String fooCookie) {
		
		if(CookieHandler.decryptCookie(fooCookie)==null){ return "notfound"; }
		
		session.invalidate();
		return "redirect:http://localhost:8080/uPortalSpringJDBC/j_spring_security_logout";
	}
}