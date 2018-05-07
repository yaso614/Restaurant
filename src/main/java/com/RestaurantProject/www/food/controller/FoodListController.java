package com.RestaurantProject.www.food.controller;



import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.RestaurantProject.www.common.util.FileService;
import com.RestaurantProject.www.common.util.PageNavigator;
import com.RestaurantProject.www.food.dao.FoodDAO;
import com.RestaurantProject.www.food.vo.Food;

@Controller
@RequestMapping(value="food")
@SessionAttributes(value="trash")
public class FoodListController {
	
	private static final Logger logger = LoggerFactory.getLogger(FoodListController.class);
	
	@Autowired
	FoodDAO dao;
	
	final String uploadPath = "/foodImages";
	final int countPerPage = 8; //한 화면에 보여줄 게시물수
	final int pagePerGroup = 5; //한 화면에 보여줄 그룹수 
	
	
	@RequestMapping(value="foodList", method=RequestMethod.GET)
	public String foodList(Model model
			,@RequestParam(value="searchText", defaultValue="") String searchText
			,@RequestParam(value="page", defaultValue="1")int page
			,@RequestParam(value="searchChoice", defaultValue="fname") String searchChoice
			,String foodtype){
		logger.info("음식물 리스트로 이동 시작");
		
		HashMap<String,Object> foodmap = new HashMap<String,Object>(); 
		foodmap.put("searchText", searchText);
		foodmap.put("searchChoice", searchChoice);
		foodmap.put("foodtype", foodtype);
		
		//전체 글 개수 조회
		int total  = dao.getTotal(foodmap);
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		
		ArrayList<Food> flist = dao.getAllFood(foodmap,navi.getStartRecord(),navi.getCountPerPage());
		model.addAttribute("flist", flist);
		model.addAttribute("navi", navi);
		model.addAttribute("searchText",searchText);
		
		ArrayList<Food> vovo = null;
		vovo = dao.toto();
		model.addAttribute("soso", vovo);
		
		logger.info("음식물 리스트로 이동 종료");
		return "food/foodList";
	}
	
	@RequestMapping(value="insertFoodForm", method=RequestMethod.GET)
	public String insertFoodForm(Model model){
		Food food = new Food();
		System.out.println(food);
		model.addAttribute("trash", food);
		return "food/insertFoodForm";
	}
	
	
	
	@RequestMapping(value="insertFood", method=RequestMethod.POST)
	public String insertFood(Model model,
			@ModelAttribute("trash") Food food,
			MultipartFile upload){
logger.info("insertFood start");
		if(!(upload.isEmpty())){
			String savedfilename = FileService.saveFile(upload, uploadPath);
			food.setSavedfile(savedfilename);
			food.setOriginalfile(upload.getOriginalFilename());
			
		}
		
		int result = 0;
		result = dao.cooking(food);
		
		if(result != 1){
			model.addAttribute("failMessage", "음식물 등록에 실패하셨소");
			model.addAttribute("trash", food);
			logger.info("insertFood fail");
			return "food/insertFoodForm";
		}
		
logger.info("insertFood end");
		return "redirect:insertComplete";
	}
	
	@RequestMapping(value="insertComplete", method=RequestMethod.GET)
	public String insertComplete(Model model,SessionStatus sessionstatus,
			@ModelAttribute("trash") Food food){
		model.addAttribute("yori", food.getFname());
		sessionstatus.setComplete();
		
		return "food/insertComplete";
	}
	
	
	
	
	@RequestMapping(value="foodInfoForm", method=RequestMethod.GET)
	public String foodInfoForm(Model model,Food food){
		Food box = dao.getOneFood(food);
		model.addAttribute("osara",box);
		return "food/oneFoodInfo";
	}
	
	
	
	
	
	
	@RequestMapping(value="download",method=RequestMethod.GET)
	public void download(HttpServletResponse response,
			Food food){
	
	Food downFood = dao.getOneFood(food);
	
	String originalFileName = downFood.getOriginalfile();
	try{
		response.setHeader("Content-Disposition", "attachment;filename="
				+URLEncoder.encode(originalFileName, "UTF-8"));
	}catch (UnsupportedEncodingException e) {
		e.printStackTrace();
	}
		
	String fullPath = uploadPath+"/"+downFood.getSavedfile();
	System.out.println("전체경로"+fullPath);
	FileInputStream fis = null;
	ServletOutputStream sos = null;
	
	
	try{
		fis = new FileInputStream(fullPath);
		sos = response.getOutputStream();
		
		FileCopyUtils.copy(fis, sos); //인풋에서 읽어서 아웃풋으로 보내줌 , 스프링 기능 , 이부분 없으면 엄청복잡해짐
		
		fis.close();
		sos.close();
	}
		catch (IOException e) {
			e.printStackTrace();
	}
}

	
	
	
	@RequestMapping(value="deleteFood",method=RequestMethod.GET)
	public String deleteFood(Food food){
		logger.info("음식물 삭제 이동 시작");
		
		Food vo = dao.getOneFood(food);	// fileService 삭제 위한 객체 불러오기다..
		
		int result = 0;
		result = dao.deleteFood(food);
		
		if (result != 1){
			//delete fail
		}
		
		boolean flag = FileService.deleteFile(uploadPath+"/"+vo.getSavedfile());
		
		logger.info("음식물 삭제 이동 종료");
		return "redirect:foodList";
	}
	
	
	
	
	@RequestMapping(value="updateFoodForm",method=RequestMethod.GET)
	public String updateFoodForm(Model model,Food food){
		Food box = null;
		box = dao.getOneFood(food);
		model.addAttribute("trash", box);
		return "food/updateFoodForm";
	}
	
	@RequestMapping(value="updateFood",method=RequestMethod.POST)
	public String updateFood(Model model,Food food,MultipartFile upload,
			@ModelAttribute("trash") Food foods, String oldfname,String fname){
		food.setFname(oldfname); // 겟원푸드는 음식이름,음식번호를 받아서 가져오는데 update 해주는 음식이름이 바뀌면서 꼬임..
		//기존 음식 이름을 String oldfname으로 받아서 setFname으로 넣어서 결과를 받아왔다.
		Food dish = dao.getOneFood(food);
		model.addAttribute("oldfname", oldfname); // 모델에 넣은 키값 리다이렉트로 이동후 파라메터로 쓸수 있다.
		//수정 시 새로 첨부한 파일이 있으면 기존 파일을 삭제하고 새로 업로드
				if (!upload.isEmpty()) {
					//기존 글에 첨부된 파일의 실제 저장된 이름
					String savedfile = dish.getSavedfile();
					//기존 파일이 있으면 삭제
					if (savedfile != null) {
						FileService.deleteFile(uploadPath + "/" + savedfile);
					}
					
					//새로 업로드한 파일 저장
					savedfile = FileService.saveFile(upload, uploadPath);
					
					//수정 정보에 새로 저장된 파일명과 원래의 파일명 저장
					food.setOriginalfile(upload.getOriginalFilename());
					food.setSavedfile(savedfile);
				}
				int result = 0;
				food.setFname(fname); // 여기서는 업데이트 해줘야하니까 업데이트 해줄 이름을 넣으준다.
				result = dao.updateFood(food);
				if(result != 1){
					model.addAttribute("failMessage", "음식물 수정 실패");
					model.addAttribute("trash", dish);
					return "food/updateFoodForm";
				}
		
		return "redirect:updateCompleteForm";
	}
	
	
	@RequestMapping(value="updateCompleteForm",method=RequestMethod.GET)
	public String updateCompleteForm(Model model,SessionStatus sessionstatus,
			@ModelAttribute("trash") Food foods, String oldfname){
		model.addAttribute("yori", foods.getFname());
		model.addAttribute("oldfname",oldfname);
		sessionstatus.setComplete();
		return "food/updateComplete";
	}
	
	
	
	@RequestMapping(value="reservationForm",method=RequestMethod.GET)
	public String reservationForm(Model model,Food food,int qy){
		Food box = null;
		box = dao.getOneFood(food);
		model.addAttribute("order", box);
		model.addAttribute("qy", qy);
		return "reservation/reservationForm";
	}
	
	@ResponseBody
	@RequestMapping(value="fnameCheck", method=RequestMethod.GET, produces="application/text; charset=utf8")
	public String fnameCheck(String fname){
		String abc = dao.fnameCheck(fname);
		return abc;
	}
	
	@RequestMapping(value="clearSales", method=RequestMethod.GET)
	public String fnameCheck(){
			dao.clearSales();
		return "redirect:foodList";
	}
	
	
	
}
