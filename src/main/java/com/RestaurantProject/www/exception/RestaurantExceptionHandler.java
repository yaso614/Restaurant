package com.RestaurantProject.www.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;


@ControllerAdvice
public class RestaurantExceptionHandler {

	private static final Logger logger = LoggerFactory.getLogger(RestaurantExceptionHandler.class);
	
	@ExceptionHandler (Exception.class)
	public String errorHandler(Exception e){
		logger.info(""+e);
		return "/error";
	}
}
