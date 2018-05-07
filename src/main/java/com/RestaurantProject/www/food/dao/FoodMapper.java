package com.RestaurantProject.www.food.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import com.RestaurantProject.www.food.vo.Food;

public interface FoodMapper {
	public int cooking(Food food);
	
	public ArrayList<Food> getAllFood(HashMap<String,Object> foodmap,RowBounds rb);
	
	public Food getOneFood(Food food);
	
	public int deleteFood(Food food);
	
	public int getTotal(HashMap<String,Object> foodmap);
	
	public int updateFood(Food food);
	
	public void foodsalesUpdate(Food food);
	
	public ArrayList<Food> toto();
	
	public String fnameCheck(String fname);
	
	public void clearSales();
	
}
