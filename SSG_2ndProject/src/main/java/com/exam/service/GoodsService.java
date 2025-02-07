package com.exam.service;

import java.util.List;

import com.exam.dto.GoodsDTO;

public interface GoodsService {

    // 특정 카테고리의 상품 목록 조회
    public List<GoodsDTO> goodsList(String gCategory);

    // 상품 상세 조회
    public GoodsDTO goodsRetrieve(String gCode);

    // 모든 상품의 재고 정보 조회
    public List<GoodsDTO> getAllStock();
}
