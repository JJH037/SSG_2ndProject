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
import com.exam.service.OrderService;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Controller
//@SessionAttributes("login")
public class OrderController {

	OrderService orderService;
	
	public OrderController(OrderService orderService) {
		this.orderService = orderService;
	}

	@GetMapping("/orderConfirm")
	public String cartAdd(@RequestParam Integer num, Model m) {
		
CartDTO cartDTO = orderService.orderConfirm(num);
		
//		MemberDTO dto = (MemberDTO)m.getAttribute("login");

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberDTO dto = (MemberDTO)auth.getPrincipal();
		String userid = dto.getUserid();
		
		
MemberDTO memberDTO = orderService.orderConfirmMember(userid);

		m.addAttribute("cDTO", cartDTO);
		m.addAttribute("mDTO", memberDTO);
		
		return "orderConfirm";
	}

	
	
}




