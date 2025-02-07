package com.exam.service;

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

}
