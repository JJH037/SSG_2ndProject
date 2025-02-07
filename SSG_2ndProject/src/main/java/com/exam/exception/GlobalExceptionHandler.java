package com.exam.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.validation.ConstraintViolationException;


@ControllerAdvice
public class GlobalExceptionHandler {
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	   //전역 예외처리
		@ExceptionHandler(value = { IllegalArgumentException.class,
				ConstraintViolationException.class } )
		public String errorPage(Exception e, RedirectAttributes m, Model m2) {
			
			
			logger.info("LOGGER:{}", e.getMessage());
			
			m.addFlashAttribute("errorMessage", e.getMessage());
			
			if(e.getMessage().contains("cartAdd")) {
				return "redirect:goodsRetrieve";  
			}else {
				return "redirect:signup";  // /signup
			}
		}
		
}
