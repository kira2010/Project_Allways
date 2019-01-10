package edu.spring.project.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserPageController {

	@RequestMapping(value = "/my_page", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
	
		
		return "my_page";
	}
	
	@RequestMapping(value = "/allways_page", method = RequestMethod.GET)
	public String allways(Model model) {
		
		return "home";
	}
	
}
