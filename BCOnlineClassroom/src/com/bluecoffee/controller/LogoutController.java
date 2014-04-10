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
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:http://localhost:8080/uPortalSpringJDBC/logout";
	}
}