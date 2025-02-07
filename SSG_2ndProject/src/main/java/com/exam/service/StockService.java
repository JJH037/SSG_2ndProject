package com.exam.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dao.StockDAO;

@Service
public class StockService {

    private final StockDAO stockDAO;

    // ✅ 생성자 주입
    public StockService(StockDAO stockDAO) {
        this.stockDAO = stockDAO;
    }

    // 재고 부족 상품 목록 가져오기
    public List<String> getLowStockItems() {
        return stockDAO.getLowStockItems();  // DAO에서 불러오는 메서드를 호출
    }
}
