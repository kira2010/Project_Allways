package edu.spring.project.service;

import javax.servlet.http.HttpServletResponse;

import edu.spring.project.domain.User;

public interface UserService {

	// 아이디 중복 체크
	public void checkUser(String userId, HttpServletResponse response) throws Exception;
	
	// 회원 가입
	public int insert(User user);
	
	// 로그인
	public User login(User user);
	
}
