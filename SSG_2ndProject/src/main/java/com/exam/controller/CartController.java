package com.exam.controller;

import java.util.List;
import java.util.Map;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.exam.dto.CartDTO;
import com.exam.dto.GoodsDTO;
import com.exam.dto.MemberDTO;
import com.exam.service.CartService;
import com.exam.service.GoodsService;
import com.exam.service.MemberService;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Controller
@Validated
//@SessionAttributes("login")
public class CartController {

	
	CartService cartService;
	
	public CartController(CartService cartService) {
		this.cartService = cartService;
	}



	@GetMapping("/cartAdd")
	public String cartAdd( @RequestParam String gCode,
				    
			              
					      // @Size 적용가능한 타입: 문자열, 컬렉션, 배열
			               @RequestParam  String gAmount,
			               
			               Model m
			               ) {
		
		//실패
		// @Validated 로 설정한 유효성체크는 에러발생시 ConstraintViolationException 예외가 발생되고
		// @ControllerAdvice 지정한 GlobalExceptionHandler 생성.
		
		//성공
//		MemberDTO memberDTO = (MemberDTO)m.getAttribute("login");
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        MemberDTO memberDTO = (MemberDTO)auth.getPrincipal();
		
		String userid = memberDTO.getUserid();
		
		CartDTO cartDTO = new CartDTO();
		cartDTO.setUserid(userid);
		cartDTO.setgCode(gCode);
	
		cartDTO.setgAmount( Integer.parseInt(gAmount));
		
		int n = cartService.cartAdd(cartDTO);
		
		return "goods/cartAddSuccess";
	}

	
	@GetMapping("/cartList")  // cartList.jsp
	@ModelAttribute("cartList")
	public List<CartDTO> cartList(Model m) {
		
//		MemberDTO memberDTO = (MemberDTO)m.getAttribute("login");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        MemberDTO memberDTO = (MemberDTO)auth.getPrincipal();
        
        
		String userid = memberDTO.getUserid();
		
		// 데이터
		List<CartDTO> cartList = cartService.cartList(userid);
		return cartList;
	}
	
	@GetMapping("/cartDelete") 
	public String cartDelete(@RequestParam Integer num) {
		
		int n = cartService.cartDelete(num);
		
		return "redirect:cartList";
	}
	
	@GetMapping("/cartDeleteAll")
	public String cartDeleteAll(@RequestParam(name = "check", required = false)  List<String> check) {
		
		System.out.println("check: " + check);
		if(check != null) {
		  int n = cartService.cartDeleteAll(check);
		}
		return "redirect:cartList";
	}
	
}




