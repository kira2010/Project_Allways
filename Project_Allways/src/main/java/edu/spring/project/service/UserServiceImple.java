package edu.spring.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.project.domain.User;
import edu.spring.project.persistence.UserDao;

@Service
public class UserServiceImple implements UserService {

	@Autowired
	private UserDao userDao;
	
	public int insert(User user) {
		return userDao.createUser(user);
	}

	public User login(User user) {
		return userDao.loginCheck(user);
	}
	
}
