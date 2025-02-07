package com.exam.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.exam.dto.MemberDTO;
import com.exam.service.MemberService;
import com.exam.service.StockService;

import jakarta.servlet.http.HttpSession;
@Controller
public class LoginController {

    private final MemberService memberService;
    private final StockService stockService; // 재고 서비스 추가

    public LoginController(MemberService memberService, StockService stockService) {
        this.memberService = memberService;
        this.stockService = stockService;
    }

    // 로그인 폼 이동
    @GetMapping("/login")
    public String loginForm() {
        return "loginForm";
    }

    // 로그인 처리
    @PostMapping("/login")
    public String login(@RequestParam String username, 
                        @RequestParam String password, 
                        HttpSession session, Model model) {

        // 로그인 정보를 Map에 담아서 전달
        Map<String, String> loginMap = new HashMap<>();
        loginMap.put("userid", username);
        loginMap.put("passwd", password);

        MemberDTO member = memberService.login(loginMap); // 수정된 부분

        if (member != null) {
            session.setAttribute("loginUser", member);

            // 냉장고 재고 부족 상품 조회
            List<String> lowStockItems = stockService.getLowStockItems();
            session.setAttribute("lowStockItems", lowStockItems);

            // 대시보드로 리다이렉션
            return "redirect:/shop/dashboard"; // 대시보드로 리다이렉트
        } else {
            model.addAttribute("error", "아이디 또는 비밀번호가 잘못되었습니다.");
            return "loginForm";
        }
    }
}