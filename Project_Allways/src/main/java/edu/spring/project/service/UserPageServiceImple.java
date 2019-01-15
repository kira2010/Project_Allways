package edu.spring.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.project.domain.User;
import edu.spring.project.persistence.UserDao;

@Service
public class UserPageServiceImple implements UserPageService {

	@Autowired
	public UserDao userDao;
	
	public User check(int uno) {

		
		return userDao.findUserByUno(uno);
	}

	public int updateEmo(User user) {
		
		return userDao.updateEmotion(user);
	}

}
