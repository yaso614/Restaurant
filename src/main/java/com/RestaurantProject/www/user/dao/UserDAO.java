package com.RestaurantProject.www.user.dao;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.RestaurantProject.www.user.vo.User;

@Repository
public class UserDAO {

	private static final Logger logger = LoggerFactory.getLogger(UserDAO.class);
	
	@Autowired
	SqlSession session;
	
	public int join(User user){
		UserMapper mapper = session.getMapper(UserMapper.class);
		logger.info("DAO회원가입 시작");
		int result = 0;
		try{
			result = mapper.join(user);
		}catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("DAO회원가입 종료");
		return result;
	}
	
	
	public User getOneUser(String userid){
		UserMapper mapper = session.getMapper(UserMapper.class);
		logger.info("DAOuser 정보 획득 시작");
		User user = null;
		try{
			user = mapper.getOneUser(userid);
		}catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("DAOuser 정보 획득 종료");
		return user;
	}
	
	public void loyaltyPlus(String userid){
		UserMapper mapper = session.getMapper(UserMapper.class);
		logger.info("고객의 주문횟수가 증가 - 시작");
		try{
			mapper.loyaltyPlus(userid);
		}catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("고객의 주문횟수가 증가 - 종료");
	}
	
	public void loyaltyMinus(String userid){
		UserMapper mapper = session.getMapper(UserMapper.class);
		logger.info("고객의 주문횟수가 감소 - 시작");
		try{
			mapper.loyaltyMinus(userid);
		}catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("고객의 주문횟수가 감소 - 종료");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
