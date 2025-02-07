package com.exam.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.exam.dto.MemberDTO;
import com.exam.mapper.MemberMapper;

@Service
public class AuthenticationServiceImpl implements AuthenticationService{

	MemberMapper mapper;
	
	public AuthenticationServiceImpl(MemberMapper mapper) {
		this.mapper = mapper;
	}


	@Override
	public MemberDTO findByUserid(String userid) {
		return mapper.findByUserid(userid);
	}

//	@Override
//	public MemberDTO authenticate(Map<String, String> map) {
//		// map에 저장된 passwd 인 1234 를 암호화해서 DB와 비교해야 된다. 
	    // 이 파일에서 new BCryptPasswordEncoder() 객체생성해서 사용하기가 부담됨.
//		return null;
//	}
	
	
}
