package com.exam.service;

import java.util.List;

import com.exam.dto.CartDTO;
import com.exam.dto.GoodsDTO;



public interface CartService {

	public int cartAdd(CartDTO dto);
	public List<CartDTO> cartList(String userid);
	public int cartDelete(int num);
	public int cartDeleteAll(List<String> list);
	public List<CartDTO> getLowStockItems(String userid);
	public List<GoodsDTO> getAllStock();
}
