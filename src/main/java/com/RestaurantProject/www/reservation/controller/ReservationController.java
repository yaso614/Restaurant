package com.RestaurantProject.www.reservation.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.RestaurantProject.www.common.util.PageNavigator;
import com.RestaurantProject.www.food.dao.FoodDAO;
import com.RestaurantProject.www.food.vo.Food;
import com.RestaurantProject.www.reservation.dao.ReservationDAO;
import com.RestaurantProject.www.reservation.vo.Detail;
import com.RestaurantProject.www.reservation.vo.Reservation;
import com.RestaurantProject.www.user.dao.UserDAO;




@Controller
@RequestMapping(value="reservation")
public class ReservationController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	@Autowired
	ReservationDAO rdao;
	@Autowired
	UserDAO udao;
	@Autowired
	FoodDAO fdao;
	
	final int countPerPage = 10; //한 화면에 보여줄 게시물수
	final int pagePerGroup = 5; //한 화면에 보여줄 그룹수 
	
	
	@RequestMapping(value="reserveListForm" , method=RequestMethod.GET)
	public String reserveListForm(Model model
			,@RequestParam(value="searchText", defaultValue="") String searchText
			,@RequestParam(value="page", defaultValue="1")int page
			,@RequestParam(value="searchChoice", defaultValue="subid") String searchChoice){
		
		HashMap<String,Object> Rmap = new HashMap<String,Object>(); 
		Rmap.put("searchText", searchText);
		Rmap.put("searchChoice", searchChoice);
		
		//전체 글 개수 조회
		int total  = rdao.getTotal(Rmap);
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		
		ArrayList<Reservation> flist = rdao.getAllReserve(Rmap,navi.getStartRecord(),navi.getCountPerPage());
		model.addAttribute("orderList", flist);
		model.addAttribute("navi", navi);
		model.addAttribute("searchText",searchText);
		
		
		/*ArrayList<Reservation> Rlist = null;
		Rlist = rdao.getAllReservation();
		model.addAttribute("orderList", Rlist);*/
		return "reservation/reserveList";
	}
	
	
	@RequestMapping(value="order",method=RequestMethod.POST)
	public String order(Reservation reserve,HttpSession session){
		logger.info("[Cont]손님이 주문을 시작합니다.");

		String orderUserId = (String)session.getAttribute("loginUserId");
		String orderUserName = (String)session.getAttribute("loginUserName");
		
		reserve.setSubid(orderUserId);  //세션에서 가져온 Id 를 주문자 id로 셋해줌
		reserve.setSubname(orderUserName); // 마찬가지로 이름 셋해줌
		
		//아마 이 시점에서 loyalty를 +1 해주는게 좋을듯 싶은데..
		System.out.println("주문자"+orderUserId);
		udao.loyaltyPlus(orderUserId);
		
		int result = rdao.reservation(reserve);
		
		
		logger.info("[Cont]손님이 주문을 종료합니다.");
		return "redirect:reserveListForm";
	}
	
	
	@RequestMapping(value="reserveCancel", method=RequestMethod.GET)
	public String reserveCancel(Reservation reserve){
		rdao.reserveCancel(reserve);
		String id = reserve.getSubid();
		udao.loyaltyMinus(id);
		return "redirect:reserveListForm";
	}
	
	
	@RequestMapping(value="receipt", method=RequestMethod.GET)
	public String receipt(Reservation reserve){
		
		String selectFood = reserve.getSelectfood();
		int quantity = reserve.getQuantity();
		
		System.out.println("아이디"+reserve.getSubid());
		System.out.println("주문번호"+reserve.getRvnum());
		
		System.out.println("선택된음식"+reserve.getSelectfood());
		System.out.println("수량"+reserve.getQuantity());
		
		int result = rdao.receipt(reserve); //사장님 주문 접수 기능
		System.out.println("여기 지금 돌고있는건가?");
		
		if(result == 1){
			//주문접수가 성공했으니 음식물의 판매량을 +1해주자
			Food food = new Food(); //푸드 객체 생성 salse랑 fname이 필요하다
			food.setFname(selectFood);
			food.setFoodsales(quantity);
			
			fdao.foodsalesUpdate(food);
		}
		
		
		
		return "redirect:reserveListForm";
	}
	
	@RequestMapping(value="detailOrder", method=RequestMethod.GET)
	public String detailOrder(Model model , int rvnum){
		Reservation reserve = null;
		reserve = rdao.getOneReserve(rvnum);
		
		//해당 글에 달린 요구목록 읽기
		ArrayList<Detail> Dlist = rdao.listDetail(rvnum);
		
		//본문글정보와 리플목록을 모델에 저장
		model.addAttribute("detailOrder", reserve);
		model.addAttribute("detailList", Dlist);
		
		return "reservation/detailForm";
	}
	
	
	@RequestMapping (value="detailWrite", method=RequestMethod.POST)
	public String replyWrite(
			Detail detail, 
			HttpSession session, 
			Model model) {
		
		//세션에서 로그인한 사용자의 아이디를 읽어서 Reply객체의 작성자 정보에 세팅
		String id = (String) session.getAttribute("loginUserId");
		detail.setId(id);
		
		//리플 정보를 DB에 저장
		rdao.insertDetail(detail);
		
		//읽던 게시글로 되돌아 감
		return "redirect:detailOrder?rvnum=" + detail.getrvnum();
	}
	
	@RequestMapping (value="detailDelete", method=RequestMethod.GET)
	public String detailDelete(Detail detail, HttpSession session) {
		String id = (String) session.getAttribute("loginUserId");
		
		//삭제할 글 번호와 본인 글인지 확인할 로그인아이디
		detail.setId(id);
			
		rdao.deleteDetail(detail);
		
		return "redirect:detailOrder?rvnum=" + detail.getrvnum();
	}
	
	
	
	@RequestMapping (value="detailEdit", method=RequestMethod.POST)
	public String detailEdit(Detail detail, HttpSession session) {
		logger.info("detailEdit CONT STA");
		String id = (String) session.getAttribute("loginUserId");
		
		//삭제할 글 번호와 본인 글인지 확인할 로그인아이디
		detail.setId(id);
		
		rdao.updateDetail(detail);
		
		logger.info("detailEdit CONT END");
		return "redirect:detailOrder?rvnum=" + detail.getrvnum();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
