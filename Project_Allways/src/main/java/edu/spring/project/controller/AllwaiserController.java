package edu.spring.project.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.spring.project.domain.Allwaiser;
import edu.spring.project.domain.User;
import edu.spring.project.persistence.AllwaiserDao;
import edu.spring.project.persistence.UserDao;

@RestController
@RequestMapping(value = "search")
public class AllwaiserController {

	private final Logger logger = LoggerFactory.getLogger(AllwaiserController.class);

	@Autowired
	private UserDao dao;
	
	@Autowired
	private AllwaiserDao allwaiserDao;

	@RequestMapping(value = "/allwaysInsert", method = RequestMethod.POST)
	public ResponseEntity<Integer> friendInsert(
			@RequestBody Allwaiser allwaiser) {
		logger.info("friendInsert(uno={})", allwaiser);
		
		
		int result = allwaiserDao.followAllwaiser(allwaiser);

		ResponseEntity<Integer> entity = null;
		if (result == 1) {
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		} else {
			entity = new ResponseEntity<Integer>(result, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/user", method = RequestMethod.POST)
	public ResponseEntity<List<User>> searchUsers(@RequestBody User user) {

		String name = user.getUserName();

		String graduation = user.getGraduation();

		List<User> list = null;
		

		
		if (!name.isEmpty() && name != null && !graduation.isEmpty() && graduation != null) {
			list = dao.findUserByNameAndGraduation(user);
		} else if (!name.isEmpty() && name != null) {
			list = dao.findUserByName(name);
		} else if (!graduation.isEmpty() && graduation != null) {
			list = dao.findUserByGraduation(graduation);
		} 
		

		ResponseEntity<List<User>> entity = new ResponseEntity<List<User>>(list, HttpStatus.OK);

		return entity;
	}

}
