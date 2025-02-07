package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface StockDAO {
    // 재고 부족 상품 목록을 가져오는 메서드
    List<String> getLowStockItems();
}