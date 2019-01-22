package edu.spring.project.service;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Service;

import edu.spring.project.domain.User;
import edu.spring.project.util.FIndUtil;

@Service
public class MailService {
	
	/**
	 * @param user
	 * @param div
	 * @throws Exception
	 */
	public void sendMail(User user, String keyCode, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "teamallways@naver.com"; // 팀 아이디
		String hostSMTPpwd = "allways123";
	
		// 보내는 사람 Email, 제목, 내용
		String fromEmail = "teamallways@naver.com"; // 보내는 사람 email
		String fromName = "allways"; // 보내는 사람 이름
		String subject = ""; // 제목
		String msg = "";
		
		if(div.equals("findPwd")) {			
			subject = "[Allways]비밀번호 찾기 인증키 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>비밀번호 찾기 인증키입니다.</h3>";
			msg += "<div style='font-size: 130%'>";
			msg += "비밀번호 찾기 페이지로 돌아가 인증코드 <strong>";
			msg += keyCode + "</strong> 를 입력해 주세요</div></div><br>";
		}
		
		// 받는 사람 Email 주소
		String mail = user.getUserEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSLOnConnect(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); // SMTP 포트 번호 입력
			
			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setStartTLSEnabled(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일 발송 실패 : " + e);
		}

	}
}