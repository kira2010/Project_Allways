package edu.spring.project.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.spring.project.domain.User;

import edu.spring.project.service.UserService;

@RestController
@RequestMapping("/users")
public class UserController {
	private final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;

	@RequestMapping(value="/logins", method = RequestMethod.POST)
	public User login(@RequestBody User user, HttpSession session){
		logger.info("login() POST 호출");
			
		User checkUser = userService.login(user); 
		User loginUser = checkUser;
		loginUser.setUserPwd("");
		session.setAttribute("check", loginUser);
		
		System.out.println("loginUser :" +loginUser);
		
		return loginUser;
	}
	
}
