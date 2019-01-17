package edu.spring.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.project.domain.Allwaiser;
import edu.spring.project.domain.User;
import edu.spring.project.persistence.AllwaiserDao;
import edu.spring.project.persistence.UserDao;

@Service
public class UserPageServiceImple implements UserPageService {

	@Autowired
	public UserDao userDao;
	
	@Autowired
	public AllwaiserDao allwaiserDao;
	
	public User check(int uno) {

		
		return userDao.findUserByUno(uno);
	}

	public int updateEmo(User user) {
		
		return userDao.updateEmotion(user);
	}

	public int existAllwaiser(Allwaiser allwaiser) {
		
		return allwaiserDao.existAllwaiser(allwaiser);
	}

	public int updateBGPhoto(User user) {
		return userDao.updateBGPhoto(user);
	}

	public int updatePFPhoto(User user) {
		return userDao.updatePFPhoto(user);
	}

}
