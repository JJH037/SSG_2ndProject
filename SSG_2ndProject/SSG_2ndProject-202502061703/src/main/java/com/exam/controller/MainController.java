package com.exam.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.exam.dto.GoodsDTO;
import com.exam.service.GoodsService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MainController {

    private final GoodsService goodsService;

    public MainController(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "Dairy") String gCategory,
                       HttpServletRequest request) {

        // 특정 카테고리의 상품 목록 조회
        List<GoodsDTO> goodsList = goodsService.goodsList(gCategory);

        // 모든 상품의 재고 정보 조회
        List<GoodsDTO> allStock = goodsService.getAllStock();

        // request에 allStock 속성 설정
        request.setAttribute("goodsList", goodsList);
        request.setAttribute("allStock", allStock); // allStock을 설정

        return "main"; // main.jsp로 반환
    }
}
