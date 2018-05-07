package com.RestaurantProject.www.common.interceptor;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

	public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	//컨트롤러의 메서드가 실행되기 전에 처리되는 부분
	@Override 
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		
		String loginId = (String)session.getAttribute("loginUserId");
		if(loginId == null){
			String path = request.getContextPath();
			response.sendRedirect(path+"/user/loginForm");
		}
		return super.preHandle(request, response, handler);
		
	}
}

















































