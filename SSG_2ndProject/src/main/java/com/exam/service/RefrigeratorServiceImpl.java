package com.exam.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.dto.RefrigeratorDTO;
import com.exam.mapper.RefrigeratorMapper;

@Service
public class RefrigeratorServiceImpl implements RefrigeratorService {
	
	RefrigeratorMapper mapper;
	
	public RefrigeratorServiceImpl(RefrigeratorMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	@Transactional
	public int refrigeratorAdd(RefrigeratorDTO dto) {
		return mapper.refrigeratorAdd(dto);
	}

	@Override
	public List<RefrigeratorDTO> refrigeratorList(String userid) {
		return mapper.refrigeratorList(userid);
	}

	@Override
	public int refrigeratorDelete(int num) {
		return mapper.refrigeratorDelete(num);
	}

}
