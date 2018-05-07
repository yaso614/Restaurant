package com.RestaurantProject.www.reservation.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import com.RestaurantProject.www.food.vo.Food;
import com.RestaurantProject.www.reservation.vo.Detail;
import com.RestaurantProject.www.reservation.vo.Reservation;

public interface ReservationMapper {
	
	public int reservation(Reservation reserve);
	
	public ArrayList<Reservation> getAllReservation();
	
	public void reserveCancel(Reservation reserve);
	
	public int receipt(Reservation reserve);
	
	
	public Reservation getOneReserve(int rvnum);
	
	
	public int getTotal(HashMap<String,Object> Rmap);
	
	public ArrayList<Reservation> getAllReserve(HashMap<String,Object> Rmap,RowBounds rb);

	//detail 달기
	public void insertDetail(Detail detail);
	
	//detail 목록
	public ArrayList<Detail> listDetail(int rvnum);
	
	//detail 삭제
	public void deleteDetail(Detail detail);
	
	//detail 수정
	public void updateDetail(Detail detail);
	
}
