package com.ezdev.sfy.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezdev.sfy.dto.TourDTO;

@Service
public class TourMapper {
	@Autowired
	private SqlSession sqlSession;

	public List<TourDTO> listTour() {
		return sqlSession.selectList("listTour");
	}
	
	
	

}
