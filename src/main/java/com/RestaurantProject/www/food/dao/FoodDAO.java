package com.RestaurantProject.www.food.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.RestaurantProject.www.food.vo.Food;

@Repository
public class FoodDAO {

	private static final Logger logger = LoggerFactory.getLogger(FoodDAO.class);
	
	@Autowired
	SqlSession sqlsession;
	
	
	public int cooking(Food food){
		logger.info("음식물 등록 DAO - start");
		FoodMapper mapper = sqlsession.getMapper(FoodMapper.class);
		int result = 0;
		try{
			result = mapper.cooking(food);
		}catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("음식물 등록 DAO - end");
		return result;
	}
	
	public ArrayList<Food> getAllFood(HashMap<String,Object> foodmap, int startRecord, int countPerPage){
		logger.info("음식물 리스트 DAO - start");
		ArrayList<Food> flist = null;
		FoodMapper mapper = sqlsession.getMapper(FoodMapper.class);
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		try{
			flist = mapper.getAllFood(foodmap,rb);
		}catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("음식물 리스트 DAO - end");
		return flist;
	}
	
		public Food getOneFood(Food food){
			logger.info("상세 음식정보 읽기 DAO - start");
			FoodMapper mapper = sqlsession.getMapper(FoodMapper.class);
			Food box = null;
			try{
				box = mapper.getOneFood(food);
			}catch (Exception e) {
				e.printStackTrace();
			}
			logger.info("상세 음식정보 읽기 DAO - end");
			return box;
		}
	
		public int deleteFood(Food food){
			logger.info("음식물 레시피 찢어버리기 DAO - start");
			FoodMapper mapper = sqlsession.getMapper(FoodMapper.class);
			int result = 0;
			try{
				result = mapper.deleteFood(food);
			}catch (Exception e) {
				e.printStackTrace();
			}
			logger.info("음식물 레시피 찢어버리기 DAO - end");
			return result;
		}
	
	
		public int getTotal(HashMap<String,Object> foodmap){
			logger.info("음식물 검색 시작");
			int result = 0;
			FoodMapper mapper = sqlsession.getMapper(FoodMapper.class);
			
			try{
				result = mapper.getTotal(foodmap);
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			logger.info("음식물 검색 종료");
			return result;
		}	
	
	
		public int updateFood(Food food){
			logger.info("Food update start");
			FoodMapper mapper = sqlsession.getMapper(FoodMapper.class);
			int result = 0;
			try{
				result = mapper.updateFood(food);
			}catch (Exception e) {
				e.printStackTrace();
			}
			logger.info("Food update end");
			return result;
		}
	
		public void foodsalesUpdate(Food food){
			logger.info("foodsalesUpdate start");
			FoodMapper mapper = sqlsession.getMapper(FoodMapper.class);
			try{
				mapper.foodsalesUpdate(food);
			}catch (Exception e) {
				e.printStackTrace();
			}
			logger.info("foodsalesUpdate end");
		}
		
		
		public ArrayList<Food> toto(){
			logger.info("toto start");
			FoodMapper mapper = sqlsession.getMapper(FoodMapper.class);
			ArrayList<Food> okok = null;
			try{
				okok = mapper.toto();
			}catch (Exception e) {
				e.printStackTrace();
			}
			logger.info("toto end");
			return okok;
		}
	
		
		public String fnameCheck(String fname){
			logger.info("fnameCheck start");
			FoodMapper mapper = sqlsession.getMapper(FoodMapper.class);
			String str = null;
			try{
				str = mapper.fnameCheck(fname);
			}catch (Exception e) {
				e.printStackTrace();
			}
			logger.info("fnameCheck end");
			return str;
		}
		
	
	
	
		public void clearSales(){
			logger.info("판매량 초기화 시작");
			 FoodMapper mapper = sqlsession.getMapper(FoodMapper.class);
			 try{
				 mapper.clearSales();
			 }catch (Exception e) {
				 e.printStackTrace();
			 }
			logger.info("판매량 초기화 종료");
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
