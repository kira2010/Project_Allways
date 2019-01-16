package edu.spring.project.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.project.domain.User;
import edu.spring.project.persistence.UserDao;

@Service
public class UserServiceImple implements UserService {

	@Autowired
	private UserDao userDao;

	// 아이디 중복 검사(AJAX)
	public boolean checkId(String userId, HttpServletResponse response) throws Exception{
		System.out.println("checkId() 호출");
		
		return userDao.checkUser(userId);
	}
	
	// 로그인
	public User login(User user) {
		return userDao.loginCheck(user);
	}

	// 회원가입
	public int insert(User user){		
		System.out.println("UserServiceImple insert() 호출");
		
		
		return userDao.createUser(user);
	}

	// 아이디 찾기
	public String findId(User user, HttpServletResponse response) throws Exception {
		System.out.println("findId() 호출");
		
		return userDao.findUserId(user);
	}
	
}
