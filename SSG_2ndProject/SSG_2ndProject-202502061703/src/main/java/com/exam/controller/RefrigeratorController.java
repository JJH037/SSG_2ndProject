package com.exam.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.exam.dto.MemberDTO;
import com.exam.dto.RefrigeratorDTO;
import com.exam.service.RefrigeratorService;

import jakarta.validation.constraints.Size;

@Controller
@Validated
public class RefrigeratorController {
    
    RefrigeratorService refrigeratorService;

    public RefrigeratorController(RefrigeratorService refrigeratorService) {
		this.refrigeratorService = refrigeratorService;
	}
    
    
    // 전체 냉장고 목록 보기 (임시)
    @GetMapping("/refrigerator") //main.jsp
	public String main() {
		return "refrigerator";
	}

    // 식재료 추가
    @GetMapping("refrigeratorAdd")
    public String refrigeratorAdd(@RequestParam String gCode,
    							  @RequestParam String gCategory,
    							  @RequestParam String gName,
    						  	
    				              @Size(min = 1, max = 2)
    							  @RequestParam String rStock,
    							
    							  Model m
    							  ) {
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	MemberDTO memberDTO = (MemberDTO)auth.getPrincipal();
    	
    	String userid = memberDTO.getUserid();
    	
    	RefrigeratorDTO refrigeratorDTO = new RefrigeratorDTO();
    	refrigeratorDTO.setUserid(userid);
    	refrigeratorDTO.setgCode(gCode);
    	refrigeratorDTO.setgCategory(gCategory);
    	refrigeratorDTO.setgName(gName);
    	refrigeratorDTO.setrStock(Integer.parseInt(rStock));
    	
    	int n = refrigeratorService.refrigeratorAdd(refrigeratorDTO);
    	
    	return "/refrigeratorAddSuccess";
    }
    
    

}
