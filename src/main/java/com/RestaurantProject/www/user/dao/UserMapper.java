package com.RestaurantProject.www.user.dao;

import com.RestaurantProject.www.user.vo.User;

public interface UserMapper {
	
	public int join(User user);
	
	public User getOneUser(String userid);
	
	public void loyaltyPlus(String userid);
	
	public void loyaltyMinus(String userid);

}
