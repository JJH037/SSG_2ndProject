package com.exam.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.exam.dto.CartDTO;
import com.exam.dto.GoodsDTO;
import com.exam.dto.MemberDTO;
import com.exam.service.CartService;

import jakarta.servlet.http.HttpSession;

@Controller
public class DashboardController {

    private final CartService cartService; // 장바구니 서비스 주입

    // 생성자 주입
    public DashboardController(CartService cartService) {
        this.cartService = cartService;
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        // Spring Security에서 인증된 사용자 정보 가져오기
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        System.out.println("All Items: test"); // 모델로 전달되는 데이터 확인

        if (auth != null) {
            MemberDTO member = (MemberDTO) auth.getPrincipal(); // 인증된 사용자의 정보를 가져옴
            String userid = member.getUserid(); // 사용자 ID

            // 장바구니에서 재고 부족 상품을 가져오는 로직 (CartService 사용)
            List<CartDTO> lowStockItems = cartService.getLowStockItems(userid);
            if (lowStockItems != null && !lowStockItems.isEmpty()) {
                session.setAttribute("lowStockItems", lowStockItems); // 세션에 lowStockItems 저장
            } else {
                session.setAttribute("lowStockItems", null); // 재고 부족 상품이 없으면 null 설정
            }

            // 모든 상품 목록을 가져오기 (DB에서)
            List<GoodsDTO> allItems = cartService.getAllStock();
            System.out.println("All Items!: " + allItems); // 모델로 전달되는 데이터 확인

            // allItems가 null이 아니고 비어있지 않으면 모델에 추가
            if (allItems != null && !allItems.isEmpty()) {
                model.addAttribute("allItems", allItems); // 모델에 데이터를 추가하여 JSP로 전달
            } else {
                model.addAttribute("allItems", new ArrayList<GoodsDTO>()); // 비어있는 리스트 전달
            }

            return "dashboard"; // dashboard.jsp 페이지로 이동
        } else {
            return "redirect:/login"; // 로그인되지 않은 경우 로그인 페이지로 리다이렉트
        }
    }
}
