package com.RestaurantProject.www.reservation.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.RestaurantProject.www.food.dao.FoodMapper;
import com.RestaurantProject.www.food.vo.Food;
import com.RestaurantProject.www.reservation.vo.Detail;
import com.RestaurantProject.www.reservation.vo.Reservation;


@Repository
public class ReservationDAO {

	private static final Logger logger = LoggerFactory.getLogger(ReservationDAO.class);

	@Autowired
	SqlSession sqlsession;

	
	public int reservation(Reservation reserve){
		logger.info("[DAO]손님이 주문을 시작합니다.");
		ReservationMapper mapper = sqlsession.getMapper(ReservationMapper.class);
		int result = 0;
		try{
			result = mapper.reservation(reserve);
		}catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("[DAO]손님이 주문을 종료합니다.");
		return result;
	}
	
	public ArrayList<Reservation> getAllReservation(){
		logger.info("[DAO]주문리스트 전체 소환 시작");
		ReservationMapper mapper = sqlsession.getMapper(ReservationMapper.class);
		ArrayList<Reservation> Rlist= new ArrayList<>();
		try{
			Rlist = mapper.getAllReservation();
		}catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("[DAO]주문리스트 전체 소환 종료");
		return Rlist;
	}
	
	public void reserveCancel(Reservation reserve){
		logger.info("[DAO 주문취소 - start]");
		ReservationMapper mapper = sqlsession.getMapper(ReservationMapper.class);
		try{
			mapper.reserveCancel(reserve);
		}catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("[DAO 주문취소 - end]");
	}
	
	
	
	public int receipt(Reservation reserve){
		logger.info("[DAO]주문접수 - start");
		int result = 0;
		ReservationMapper mapper = sqlsession.getMapper(ReservationMapper.class);
		try{
			result =mapper.receipt(reserve);
		}catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("[DAO]주문접수 - end");
		return result;
	}
	
	public ArrayList<Reservation> getAllReserve(HashMap<String,Object> Rmap, int startRecord, int countPerPage){
		logger.info("주문 DAO - start");
		ArrayList<Reservation> flist = null;
		ReservationMapper mapper = sqlsession.getMapper(ReservationMapper.class);
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		try{
			flist = mapper.getAllReserve(Rmap, rb);
		}catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("주문 DAO - end");
		return flist;
	}
	
	
	public int getTotal(HashMap<String,Object> Rmap){
		int result = 0;
		ReservationMapper mapper = sqlsession.getMapper(ReservationMapper.class);
		try{
			result = mapper.getTotal(Rmap);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}	

	public Reservation getOneReserve(int rvnum){
		ReservationMapper mapper = sqlsession.getMapper(ReservationMapper.class);
		Reservation rrr = null;
		try{
			rrr = mapper.getOneReserve(rvnum);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return rrr;
	}
	
	
	// 디테일 - 추가 
	public void insertDetail(Detail detail){
		ReservationMapper mapper = sqlsession.getMapper(ReservationMapper.class);
		try{
			mapper.insertDetail(detail);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 디테일 - 목록
	public ArrayList<Detail> listDetail(int rvnum){
		ReservationMapper mapper = sqlsession.getMapper(ReservationMapper.class);
		ArrayList<Detail> Dlist = null;
		try{
			Dlist = mapper.listDetail(rvnum);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return Dlist;
	}
	
	// 디테일 - 삭제
	public void deleteDetail(Detail detail){
		ReservationMapper mapper = sqlsession.getMapper(ReservationMapper.class);
		try{
			mapper.deleteDetail(detail);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 디테일  - 수정
	public void updateDetail(Detail detail){
		logger.info("updateDetail DAO STA");
		ReservationMapper mapper = sqlsession.getMapper(ReservationMapper.class);
		try{
			mapper.updateDetail(detail);
		}catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("updateDetail DAO END");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
