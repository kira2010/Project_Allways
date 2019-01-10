package edu.spring.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.project.domain.User;
import edu.spring.project.service.UserService;



@Controller
@RequestMapping("/users")
public class UsersController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/signUp", method=RequestMethod.GET)
	public String signUp() {
		return "users/signUp";
	}
	
	@RequestMapping(value="/signUp", method=RequestMethod.POST)
	public String signUp(User user) throws Exception {
		userService.insert(user);
		return "users/welcome";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "login";
	}

	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(User user, HttpSession session) throws Exception {
		User loginUser = userService.login(user);
		if (loginUser != null) {
			session.setAttribute("check", loginUser);
			return "main";
		} else {
			return "login";
		}
	}

}
