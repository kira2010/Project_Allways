package edu.spring.project.controller;

import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.project.domain.User;
import edu.spring.project.service.UserService;

@Controller
@RequestMapping("/users")
public class UsersController {
	private final Logger logger = LoggerFactory.getLogger(UsersController.class);
	
	@Autowired
	private UserService userService;
	
	// 아이디 중복 검사(AJAX)
	@RequestMapping(value="checkId", method=RequestMethod.POST)
	public void checkId(String userId, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF-8");
		boolean checkIdResult = userService.checkId(userId, response);
		PrintWriter writer = response.getWriter();
		
		if (!checkIdResult) {
			writer.write("existed");
		} else {
			writer.write("not existed");
		}
	}
	
	// 회원가입
	@RequestMapping(value="/signUp", method=RequestMethod.GET)
	public String signUp() {
		logger.info("signUp() GET 호출");
		
		return "users/signUp";
	}
	
	@RequestMapping(value="/signUp", method=RequestMethod.POST)
	public String signUp(User user, String birthY, String birthM, String birthD) throws Exception {
		logger.info("signUp({}) POST 호출", user);
		logger.info("생년월일 결과 : {}-{}-{}", birthY, birthM, birthD);
		
		LocalDate id = LocalDate.of(Integer.parseInt(birthY), Integer.parseInt(birthM), Integer.parseInt(birthD));
		Date birth = Date.from(id.atStartOfDay(ZoneId.systemDefault()).toInstant());
		user.setBirthDay(birth);
		
		userService.insert(user);
		
		return "users/welcome";
	}
	
	// 로그인
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		logger.info("login() GET 호출");
		
		return "login";
	}

	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(User user, HttpSession session) throws Exception {
		logger.info("login() POST 호출");
		
		User checkUser = userService.login(user);
		User loginUser = new User();
		loginUser.setUno(checkUser.getUno());
		loginUser.setUserId(checkUser.getUserId());
		if (checkUser != null) {
			session.setAttribute("check", loginUser);
			return "redirect:/";
		} else {
			return "login";
		}
	}

	// 아이디 찾기 폼
	@RequestMapping(value="/findIdForm")
	public String findIdForm() throws Exception{
		logger.info("findIdForm() 호출");
		
		return "users/findIdForm";
	}
	
	// 아이디 찾기
	@RequestMapping(value="/findId", method=RequestMethod.POST)
	public void findId(User user, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF-8");
		
		String findId = userService.findId(user, response);
		PrintWriter writer = response.getWriter();
		
		if (findId != null && !findId.isEmpty()) {
			writer.write(findId);
		} else {
			writer.write("찾으시는 아이디가 없습니다.");
		}
	}
	
	// 비밀번호 찾기 폼
	@RequestMapping(value="/findPwdForm")
	public String findPwdForm() throws Exception{
		logger.info("findPwdForm() 호출");
		
		return "users/findPwdForm";
	}
	
}
