package edu.spring.project.service;

import javax.servlet.http.HttpServletResponse;

import edu.spring.project.domain.User;

public interface UserService {
	
	// ID 중복 확인(AJAX)
	public boolean checkId(String userId, HttpServletResponse response) throws Exception;
	
	// Email 중복 확인
	public boolean checkEmail(String userEmail, HttpServletResponse response) throws Exception;
	
	// 이름 존재 여부
	public String getName(User user, HttpServletResponse response) throws Exception;
	
	// 회원 가입
	public int insert(User user);
	
	// 로그인
	public User login(User user);
	
	// 아이디 찾기
	public String findId(User user);
	
	// 비밀번호 찾기 위한 회원번호 얻기
	public int findUno(User user);
	
	// 회원 정보 수정
	public int updateUser(User user);
	
	// 비밀번호 변경
	public int resetUserPwd(User user);
	
	// 회원 탈퇴
	public int deleteUser(int uno);
	
}
