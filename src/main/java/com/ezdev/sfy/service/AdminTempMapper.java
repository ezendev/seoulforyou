package com.ezdev.sfy.service;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezdev.sfy.dto.AdminTempDTO;
import com.ezdev.sfy.dto.QnaDTO;

@Service
public class AdminTempMapper {
	
	@Autowired
	SqlSession sqlSession;
	
	public int upsertAdminTemp(AdminTempDTO dto) {
		
		int res = sqlSession.insert("upsertAdminTemp",dto);
		return res;
	}
	

	public AdminTempDTO getContent(int qno) {
		AdminTempDTO dto = sqlSession.selectOne("getContent", qno);
		return dto;
	}


	public int tempOk(QnaDTO dto) {
		int res = sqlSession.insert("tempOk", dto);
		return res;
	}


	public int tempDelete(QnaDTO dto) {
		int res = sqlSession.delete("tempDelete", dto);
		return res;
	}}
