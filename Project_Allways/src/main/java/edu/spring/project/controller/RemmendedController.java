package edu.spring.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import edu.spring.project.domain.User;
import edu.spring.project.persistence.UserDao;

@RestController
@RequestMapping(value = "remmended")
public class RemmendedController {

	@Autowired
	private UserDao dao;
	
	@RequestMapping(value = "subscribe")
	public ResponseEntity<List<User>> remmendedSubscribe(@RequestBody User user) {
		
		List<User> list = dao.recommendedAllwaisers(user, 0);
		
		ResponseEntity<List<User>> entity = new ResponseEntity<List<User>>(list, HttpStatus.OK);
		
		return entity;
	}
	
	
	
}
