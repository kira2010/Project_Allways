package edu.spring.project.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.project.domain.User;
import edu.spring.project.service.UserPageService;

@Controller
public class UserPageController {

	@Autowired
	private UserPageService userPageService;
	
	@RequestMapping(value = "/my_page", method = RequestMethod.GET)
	public String home(int uno, HttpSession session) {
		User user = userPageService.check(uno);
		
		session.setAttribute("userInfo", user);
		return "my_page";
	}
	
	@RequestMapping(value = "/allways_page", method = RequestMethod.GET)
	public String allways(Model model) {
		
		return "home";
	}
	
}

