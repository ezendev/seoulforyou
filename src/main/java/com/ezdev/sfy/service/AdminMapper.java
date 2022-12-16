package com.ezdev.sfy.service;


import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezdev.sfy.dto.AdminDTO;


@Service
public class AdminMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertAdmin(AdminDTO dto) {
			int res = sqlSession.insert("insertAdmin", dto);
			return res;
	}
	
}
