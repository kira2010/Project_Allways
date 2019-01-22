package edu.spring.project.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import edu.spring.project.domain.User;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	private final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	// 로그인 되어있지 않으면 -> 로그인 페이지로 이동
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
				
		
		HttpSession session = request.getSession();
		
		Object loginId = session.getAttribute("check");
		
		if(loginId != null) {
			return true;
		}else {
			String target = getRedirectTarget(request);
			response.sendRedirect(target);
			return false;
		}
		
	}
	
	private String getRedirectTarget(HttpServletRequest request) {
		String url = "";
		
		url = "/allways/users/login";
		
		return url;
	}
	
	
}
