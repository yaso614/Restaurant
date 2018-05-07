package com.RestaurantProject.www.user.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.RestaurantProject.www.user.dao.UserDAO;
import com.RestaurantProject.www.user.vo.User;

@Controller
@RequestMapping(value="user")
public class UserLoginController {

	private static final Logger logger = LoggerFactory.getLogger(UserLoginController.class);
	
	@Autowired
	UserDAO dao;
	
	
	@RequestMapping(value="loginForm",method=RequestMethod.GET)
	public String loginForm(){
		return "user/loginForm";
	}
	
	@RequestMapping(value="login",method=RequestMethod.POST)
	public String login(Model model,HttpSession session,String userid, String password){
		User user = new User();
		
		//입력받은 아이디와 일치하는 객체 가져와서 null이면 존재하지 않는다고 알려주고 로그인 페이지로 돌아가기
		try{
			user = dao.getOneUser(userid);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		
		if(user == null){
			model.addAttribute("userfail","존재하지 않는 아이디 입니다.");
			return "user/loginForm";
		}
		//비밀번호 일치 검사
		if(!(password.equals(user.getPassword()))){
			model.addAttribute("userfail", "비밀번호가 일치하지 않습니다.");
			return "user/loginForm";
		}
		
		//세션에 넣어서 Home으로 보내서 null이면 로그인 안된거고 null아니면 로그인 한거
		session.setAttribute("loginUserId", user.getUserid());
		session.setAttribute("loginUserName", user.getName());
		return "redirect:/";
	}
	
	@RequestMapping(value="logout",method=RequestMethod.GET)
	public String logout(HttpSession session){
		session.invalidate(); //로그아웃을 위한 session.invalidate() 이다.
		return "redirect:/";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
