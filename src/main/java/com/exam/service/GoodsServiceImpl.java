package com.exam.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.exam.dto.GoodsDTO;
import com.exam.mapper.GoodsMapper;

@Service
public class GoodsServiceImpl implements GoodsService {

    private final GoodsMapper mapper;

    public GoodsServiceImpl(GoodsMapper mapper) {
        this.mapper = mapper;
    }

    // 특정 카테고리의 상품 목록 조회
    @Override
    public List<GoodsDTO> goodsList(String gCategory) {
        return mapper.goodsList(gCategory);
    }

    // 상품 상세 조회
    @Override
    public GoodsDTO goodsRetrieve(String gCode) {
        return mapper.goodsRetrieve(gCode);
    }

    // 모든 상품의 재고 정보 조회
    @Override
    public List<GoodsDTO> getAllStock() {
        return mapper.getAllStock();  // 모든 상품의 재고 정보를 가져오는 메서드
    }
}
