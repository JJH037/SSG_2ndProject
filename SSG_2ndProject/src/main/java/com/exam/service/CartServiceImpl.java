package com.exam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.dto.CartDTO;
import com.exam.dto.GoodsDTO;
import com.exam.mapper.CartMapper;

@Service
@Transactional
public class CartServiceImpl implements CartService {

    private final CartMapper mapper;

    @Autowired
    public CartServiceImpl(CartMapper mapper) {
        this.mapper = mapper;
    }

    @Override
    public int cartAdd(CartDTO dto) {
        return mapper.cartAdd(dto);
    }

    @Override
    public List<CartDTO> cartList(String userid) {
        return mapper.cartList(userid);
    }

    @Override
    public int cartDelete(int num) {
        return mapper.cartDelete(num);
    }

    @Override
    public int cartDeleteAll(List<String> list) {
        return mapper.cartDeleteAll(list);
    }

    // 장바구니에 담겨 있는 상품 중에서 재고가 10개 이하인 상품을 확인하는 메서드
    @Override
    public List<CartDTO> getLowStockItems(String userid) {
        // mapper에서 이미 재고 부족 상품을 가져오는 쿼리 처리
        return mapper.getLowStockItems(userid);
    }

    @Override
    public List<GoodsDTO> getAllStock() {
        return mapper.getAllStock();
    }
}