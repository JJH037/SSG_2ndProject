package com.exam.service;

import java.util.List;

import com.exam.dto.RefrigeratorDTO;

public interface RefrigeratorService {
	
	public int refrigeratorAdd(RefrigeratorDTO dto);
	public List<RefrigeratorDTO> refrigeratorList(String userid);
	public int refrigeratorDelete(int num);



}
