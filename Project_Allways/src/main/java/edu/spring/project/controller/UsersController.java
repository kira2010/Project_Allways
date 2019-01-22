package edu.spring.project.controller;

import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.spring.project.domain.User;
import edu.spring.project.service.MailService;
import edu.spring.project.service.UserService;
import edu.spring.project.util.FIndUtil;

@Controller
@RequestMapping("/users")
public class UsersController {
	private final Logger logger = LoggerFactory.getLogger(UsersController.class);
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MailService mailService;
	
	// 아이디 중복 검사(AJAX)
	@RequestMapping(value="checkId", method=RequestMethod.POST)
	public void checkId(String userId, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		
		if (userId != null && !userId.isEmpty()) {
			boolean checkIdResult = userService.checkId(userId, response);			
			
			// ID가 이미 존재할 경우
			if (!checkIdResult) {
				writer.write("existed");
			} else {  // ID가 없어 사용가능한 경우
				writer.write("not existed");
			}
		} else {  // ID 가 null 이거나 비어있을 경우!
			writer.write("not input");
		}
	}
	
	// 이메일 중복 검사(AJAX)
	@RequestMapping(value="checkEmail", method=RequestMethod.POST)
	public void checkEmail(String userEmail, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		
		if (userEmail != null && !userEmail.isEmpty() ) {
			boolean checkEmailResult = userService.checkEmail(userEmail, response);
			
			// Email을 이미 사용중인 경우
			if (!checkEmailResult) {
				writer.write("existed");
			} else {  // Email 사용 가능한 경우
				writer.write("not existed");
			}
		} else {  // Email 이 null 이거나 비어있을 경우!
			writer.write("not input");
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

//	@RequestMapping(value="/login", method=RequestMethod.POST)
//	public String login(User user, HttpSession session) throws Exception {
//		logger.info("login() POST 호출");
//		
//		User checkUser = userService.login(user); 
//		User loginUser = checkUser;
//		loginUser.setUserPwd("");
//		if (checkUser != null) {
//			session.setAttribute("check", loginUser);
//			return "redirect:/";
//		} else {
//			return "login";
//		}
//	}

	// 아이디 찾기 폼
	@RequestMapping(value="/findIdForm")
	public String findIdForm() throws Exception{
		logger.info("findIdForm() 호출");
		
		return "users/findIdForm";
	}
	
	@RequestMapping(value="/findId", method=RequestMethod.POST)
	public void findId(@RequestBody User user, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF-8");
		
		String findId = userService.findId(user);
		PrintWriter writer = response.getWriter();
		
		if (findId != null && !findId.isEmpty()) {
			writer.write(findId);
		}
	}
	
	// 비밀번호 찾기 폼
	@RequestMapping(value="/findPwdForm")
	public String findPwdForm() throws Exception{
		logger.info("findPwdForm() 호출");
		
		return "users/findPwdForm";
	}
	
	// 비밀번호 찾기
	@RequestMapping(value="/findPwd", method=RequestMethod.POST)
	public void findPwd(@RequestBody User user, HttpServletResponse response, HttpSession session) throws Exception {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter writer = response.getWriter();
		
		System.out.println(user.toString());
		
		// 아이디가 없으면
		if(userService.checkId(user.getUserId(), response)) {
			writer.print("ID not existed");
			writer.close();
		}
		// 가입에 사용한 이메일이 아니면
		else if(userService.checkEmail(user.getUserEmail(), response)) {
			writer.print("Email not existed");
			writer.close();
		}
		// 이름이 존재하지 않으면
		else if (!userService.getName(user, response).equals(user.getUserName())) {
			writer.write("Name not existed");
			writer.close();
		}		
		// 임시 비밀번호 생성 -> 인증키 생성
		else {
			int uno = userService.findUno(user);
			
			System.out.println("회원번호 : " + uno);
			
			if (uno > 0) {
				String confirm = FIndUtil.createConfirm();
				
				// 인증키 세션에 저장(최대 3분 이내)
				Cookie cookie = new Cookie("key", confirm);
				
				cookie.setMaxAge(60 * 10); // 10분 설정
				response.addCookie(cookie);
				
				session.setAttribute("uno", uno);
				
				// 인증키를 이메일로 전송
				mailService.sendMail(user, confirm, "findPwd");
				
				writer.print("success");
				writer.close();
			}
		}
		
	}
	
	// 인증 코드 입력 폼
	@RequestMapping(value="/pwdConfirm")
	public String pwdConfirm() throws Exception{
		logger.info("pwdConfirm() 호출");
		
		return "users/pwdConfirm";
	}
	
	@RequestMapping(value="/pwdConfirm", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> checkConfirm(String confirm, HttpServletRequest request) throws Exception {
		logger.info("checkConfirm() 호출");
		
		System.out.println("인증키 : " + confirm);
		
		Cookie[] cookies = request.getCookies();
		
		String key = "";
		String savedConfirm = "";
		
		for(int i = 0; i < cookies.length; i++) {
			key = cookies[i].getName();
			
			if(key.equals("key")) {
				System.out.println("쿠키 키 값 일치");
				savedConfirm = cookies[i].getValue();
				
				System.out.println("저장된 쿠키 값 : " + savedConfirm);
				
				break;
			}
		}
		
		if(savedConfirm.equals(confirm)) {
			System.out.println("쿠키 값 완전 일치");
			return new ResponseEntity<String>("success", HttpStatus.OK);
			//writer.write("success");
		} else {
			System.out.println("쿠키 값 불일치");
			return new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
			//writer.write("failed");
		}		
	}
	
	@RequestMapping(value="/resetPwd", method=RequestMethod.GET)
	public String resetPwd() {
		return "users/resetPwd";
	}
	
	@RequestMapping(value="/resetPwd", method=RequestMethod.POST)
	public String resetPwd(String userPwd, HttpSession session) {
		int uno = (Integer) session.getAttribute("uno");
		User user = new User();
		user.setUno(uno);
		user.setUserPwd(userPwd);
		
		userService.resetUserPwd(user);
		
		return "redirect:login";
	}	
	
	// 회원 정보 수정
	@RequestMapping(value="/updateUser", method=RequestMethod.POST)
	public String updateUser(User user, HttpSession session) throws Exception {
		User loginUser = (User) session.getAttribute("check");
		String userEmail = loginUser.getUserEmail(); // 세션에 저장된 사용자 정보로부터 아이디를 알아낸다.
		
		if (user.getUserName() == null) {
			user.setUserName(loginUser.getUserName());
		}
		
		user.setUserEmail(userEmail);
		int check = userService.updateUser(user);
		if (check == 1) {
			session.setAttribute("check", user);
		}
		
		return "users/resetUserPwd";
		
	}
	
	// 비밀 번호 변경
	@RequestMapping(value="/resetUserPwd", method=RequestMethod.GET)
	public String resetUserPwd() {
		return "users/resetUserPwd";
	}
	
	@RequestMapping(value="/resetUserPwd", method=RequestMethod.POST)
	public String resetUserPwd(int uno, HttpSession session) throws Exception {
		String id = ((User)session.getAttribute("check")).getUserId();
		
		User user = new User();
		user.setUserId(id);
		user.setUno(uno);
		
		return "/main";
		
	}
	
	// 회원 탈퇴
	@RequestMapping(value="/deleteUser", method=RequestMethod.GET)
	public String deleteUser(int uno, HttpSession session) {
		User user = (User)session.getAttribute("check");
		userService.deleteUser(uno);
		session.invalidate();
		
		return "users/login";
	}
	
	// 로그 아웃
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("check");
		
		return "users/login";
	}
	
}
