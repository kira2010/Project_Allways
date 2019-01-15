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
	
	// 로그인
	public User login(User user) {
		return userDao.loginCheck(user);
	}
	
	// 아이치 중복 검사(AJAX)
	public void checkUser(String userId, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(userDao.checkUser(userId));
		out.close();
	}
	
	// 회원가입
	public int insert(User user) {
		return userDao.createUser(user);
		}

}
