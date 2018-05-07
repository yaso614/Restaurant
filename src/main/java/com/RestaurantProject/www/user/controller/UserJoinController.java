package com.RestaurantProject.www.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.RestaurantProject.www.user.dao.UserDAO;
import com.RestaurantProject.www.user.vo.User;

@Controller
@RequestMapping(value="user")
@SessionAttributes("apple")
public class UserJoinController {

	private static final Logger logger = LoggerFactory.getLogger(UserJoinController.class);
	
	@Autowired
	UserDAO dao;
	
	@RequestMapping(value="joinForm", method=RequestMethod.GET)
	public String joinForm(Model model){
		logger.info("joinForm start");
		User user = new User();
		model.addAttribute("apple", user);	
		//처음 접속시 보여주는건 아무것도 없는 빈객체를 넣어 보여줌
		logger.info("joinForm end");
		return "user/join";
	}
	
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String join(Model model,
			@ModelAttribute("apple") User user){
		logger.info("join start");
			int result = dao.join(user);
			
			if(result != 1){
				model.addAttribute("errorMessage", "회원가입에 실패하셨습니다.");
				model.addAttribute("apple", user);
				logger.info("join fail");
				return "user/join";
			}
			
		logger.info("join end");
		return "redirect:joinComplete";
	}
	
	@RequestMapping(value="idCheckForm", method=RequestMethod.GET)
	public String idCheckForm(Model model){
		model.addAttribute("firstCheck", true); // 검색해본적 없음
		return "user/idCheckForm";
	}
	
	@RequestMapping(value="idCheck", method=RequestMethod.POST)
	public String idCheck(Model model, String checkId){
		logger.info("idCheck start");
		
		User user = dao.getOneUser(checkId);
		
		model.addAttribute("checkId",checkId); //중복조회한 기준값
		model.addAttribute("user",user); //조회 결과로 가져온 객체
		model.addAttribute("firstCheck", false); //검색을 했음
		
		logger.info("idCheck end");
		return "user/idCheckForm";
	}
	
	@RequestMapping(value="joinComplete",method=RequestMethod.GET)
	public String joinComplete(Model model , SessionStatus sessionstatus,
			@ModelAttribute("apple") User user){
		logger.info("joinComplete start");
		
		model.addAttribute("userId", user.getUserid());
		sessionstatus.setComplete();
		
		logger.info("joinComplete end");
		return"user/joinComplete";
	}
	
	
	
	
}
