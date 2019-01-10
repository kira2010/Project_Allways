package edu.spring.project.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.spring.project.domain.User;
import edu.spring.project.persistence.UserDao;



@RestController
@RequestMapping(value = "replies")
public class AllwaiserController {
	
	private final Logger logger = 
			LoggerFactory.getLogger(AllwaiserController.class);

	@Autowired
	private UserDao dao;

	@RequestMapping(value = "all/{name}", method = RequestMethod.GET)
	public ResponseEntity<List<User>> searchUser(
			@PathVariable(name = "name") String name) {
		
		logger.info("searchUser(name={})", name);
		
		List<User> list = dao.findUserByName(name);
		
		System.out.println(list);
		
		ResponseEntity<List<User>> entity = 
				new ResponseEntity<List<User>>(list, HttpStatus.OK);
		
		
		return entity;
		
	}
}