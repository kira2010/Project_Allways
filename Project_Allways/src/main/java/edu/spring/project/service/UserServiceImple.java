package edu.spring.project.service;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.project.domain.User;
import edu.spring.project.persistence.UserDao;

@Service
public class UserServiceImple implements UserService {
	
	private final Logger logger = LoggerFactory.getLogger(UserServiceImple.class);
	
	@Autowired
	private UserDao userDao;

	// ID 중복 검사(AJAX)
	public boolean checkId(String userId, HttpServletResponse response) throws Exception{
		logger.info("checkId({}) 호출", userId);
		
		return userDao.checkUserId(userId);
	}
	
	// Email 중복 검사
	public boolean checkEmail(String userEmail, HttpServletResponse response) throws Exception {
		logger.info("checkEmail({}) 호출", userEmail);
		
		return userDao.checkUserEmail(userEmail);
	}
	
	// 로그인
	public User login(User user) {
		logger.info("login() 호출"); 
		
		return userDao.loginCheck(user);
	}

	// 회원가입
	public int insert(User user){		
		logger.info("UserServiceImple insert() 호출");
		
		return userDao.createUser(user);
	}

	// 아이디 찾기
	public String findId(User user, HttpServletResponse response) throws Exception {
		logger.info("findId() 호출");
		
		return userDao.findUserId(user);
	}
	
}
