package edu.spring.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.project.domain.User;
import edu.spring.project.service.UserService;

@Controller
public class userUpdateController {
	
	@Autowired private UserService userService;
	
	@RequestMapping(value = "/allways", method = RequestMethod.POST)
	public ResponseEntity<Integer> updateUserInfo(HttpSession session) {
		User user = (User) session.getAttribute("check");
		int result = userService.updateUser(user);
		ResponseEntity<Integer> entity = null;
		
		if (result == 1) {
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		} else {
			entity = new ResponseEntity<Integer>(result, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	// 로그아웃
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect: /allways";
	}
	
	
	// 회원 탈퇴
	@RequestMapping(value="deleteUser", method=RequestMethod.GET)
	public String deleteUser(HttpSession session) {
		User user = (User)session.getAttribute("check");
		userService.deleteUser(user.getUno());
		session.invalidate();
		
		return "redirect: /allways";
		}


	@RequestMapping(value = "userCheck", method = RequestMethod.POST)
	public ResponseEntity<User> userCheck(User user, HttpSession session) {
		
		User result = userService.login(user);
		
		System.out.println(result);
		
		ResponseEntity<User> entity = new ResponseEntity<User>(result, HttpStatus.OK);
		
		

		return entity;
	}

}







