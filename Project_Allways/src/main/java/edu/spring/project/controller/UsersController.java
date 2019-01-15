package edu.spring.project.controller;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.project.domain.User;
import edu.spring.project.service.UserService;



@Controller
@RequestMapping("/users")
public class UsersController {

	@Autowired
	private UserService userService;
	
	// 회원가입
	@RequestMapping(value="/signUp", method=RequestMethod.GET)
	public String signUp() {
		return "users/signUp";
	}
	
	@RequestMapping(value="/signUp", method=RequestMethod.POST)
	public String signUp(User user, String birthY, String birthM, String birthD) throws Exception {
		System.out.println("signUp() post: user= " + user);
		System.out.println(birthY + "-" + birthM + "-" + birthD);
		LocalDate ld = LocalDate.of(Integer.parseInt(birthY), 
				Integer.parseInt(birthM),
				Integer.parseInt(birthD));
		Date birth = Date.from(ld.atStartOfDay(ZoneId.systemDefault()).toInstant());
		user.setBirthDay(birth);
		
		userService.insert(user);
		
		
		return "users/welcome";
	}
	
	// 로그인
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "login";
	}

	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(User user, HttpSession session) throws Exception {
		User checkUser = userService.login(user);
		User loginUser = new User();
		loginUser.setUno(checkUser.getUno());
		loginUser.setUserId(checkUser.getUserId());
		if (loginUser != null) {
			session.setAttribute("check", loginUser);
			return "redirect:/";
		} else {
			return "login";
		}
	}

	// 아이디 찾기 폼
	@RequestMapping(value="/find_id_form")
	public  String findId() throws Exception{
		return "users/find_id_form";
	}
	
}
