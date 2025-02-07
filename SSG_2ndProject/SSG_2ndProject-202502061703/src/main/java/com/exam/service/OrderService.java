package com.exam.service;

import java.util.List;

import com.exam.dto.CartDTO;
import com.exam.dto.MemberDTO;



public interface OrderService {

	public CartDTO orderConfirm(int num);
	
	public MemberDTO orderConfirmMember(String userid);
	
}
