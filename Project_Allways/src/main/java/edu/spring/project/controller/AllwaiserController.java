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
import edu.spring.project.service.AllwaiserService;

@RestController
@RequestMapping(value = "search")
public class AllwaiserController {

	private final Logger logger = LoggerFactory.getLogger(AllwaiserController.class);

	@Autowired
	private UserDao dao;
	
	@Autowired
	private AllwaiserDao allwaiserDao;

	
	@RequestMapping(value = "/allwaysInsert", method = RequestMethod.POST)
	public ResponseEntity<Integer> allwaysInsert(
			@RequestBody Allwaiser allwaiser) {
		logger.info("allwaiserInsert(uno={})", allwaiser);
		

		int allwaiserResult = allwaiserDao.existAllwaiser(allwaiser);
		
		int result = 0;
		if (allwaiserResult == 0) { 
			result = allwaiserDao.followAllwaiser(allwaiser);
		}
		
		

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
		
		int uno = user.getUno();
		List<User> list = null;
		
		List<User> allways = allwaiserDao.readMyAllwaisers(uno);
		
		
		
		if (!name.isEmpty() && name != null && !graduation.isEmpty() && graduation != null) {
			list = dao.findUserByNameAndGraduation(user);
		} else if (!name.isEmpty() && name != null) {
			list = dao.findUserByName(name);
		} else if (!graduation.isEmpty() && graduation != null) {
			list = dao.findUserByGraduation(graduation);
		} 
		
		for (int i = 0; i < list.size(); i++) {
			
			for (int j = 0; j < allways.size(); j++) {
				
				if (list.get(i).getUno() == allways.get(j).getUno()) {
					System.out.println("list:" +list.get(i).getUno());
					System.out.println("allways:" + allways.get(j).getUno());
					list.remove(i);
				}
				
			}
		}

		ResponseEntity<List<User>> entity = new ResponseEntity<List<User>>(list, HttpStatus.OK);

		return entity;
	}

	@RequestMapping(value = "/allwaysSearch" , method = RequestMethod.POST)
	public ResponseEntity<List<User>> allwaysSearch(@RequestBody User user) {
	
	String userName = user.getUserName();
	
	int uno = user.getUno();
	
	List<User> list = null;
	ResponseEntity<List<User>> entity = null;
	if (userName != "") {
		list = allwaiserDao.searchByName(userName, uno);
		entity = new ResponseEntity<List<User>>(list, HttpStatus.OK);
	}
	

	return entity;
	}
	
	@RequestMapping(value = "/allwaysDelete" , method = RequestMethod.POST)
	public ResponseEntity<Integer> allwaysDelete(@RequestBody Allwaiser allwaiser) {
		System.out.println("allwayser : " + allwaiser);
	
		int result = allwaiserDao.unfollowAllwaiser(allwaiser);
		System.out.println("result : " + result);
		ResponseEntity<Integer> entity = null; 
		if (result == 1) {
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		} else {
			entity = new ResponseEntity<Integer>(result, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/allAllways", method = RequestMethod.POST)
	public ResponseEntity<List<User>> allAllways(@RequestBody User user) {
		
		int uno = user.getUno();
		
		List<User> list = allwaiserDao.readMyAllwaisers(uno);
		
		ResponseEntity<List<User>> entity = null;
		
		if (list != null) {
			entity = new ResponseEntity<List<User>>(list, HttpStatus.OK);
		} else {
			entity = new ResponseEntity<List<User>>(list, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
}
