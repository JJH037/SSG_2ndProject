package com.exam.service;

import java.util.Map;

import com.exam.dto.MemberDTO;

public interface AuthenticationService {
	
	//public MemberDTO authenticate(Map<String, String> map);
	
	public MemberDTO findByUserid(String userid);
}
