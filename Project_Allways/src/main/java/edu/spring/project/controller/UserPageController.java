package edu.spring.project.controller;



import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import edu.spring.project.domain.User;
import edu.spring.project.service.UserPageService;


@Controller
public class UserPageController {
	
	private static Logger logger =
			LoggerFactory.getLogger(UserPageController.class);

	@Autowired
	private UserPageService userPageService;
	
	@RequestMapping(value = "/userPage", method = RequestMethod.GET)
	public String userPage(int uno, HttpSession session) {
		
		User user = userPageService.check(uno);
		
		session.setAttribute("userInfo", user);
		return "my_page";
	}
	
	@RequestMapping(value = "/userPage", method = RequestMethod.POST)
	public ResponseEntity<Integer> updateEmo(@RequestBody User user) {
		
		int result = userPageService.updateEmo(user);
		ResponseEntity<Integer> entity = null;
		
		if (result == 1) {
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		} else {
			entity = new ResponseEntity<Integer>(result, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
}










