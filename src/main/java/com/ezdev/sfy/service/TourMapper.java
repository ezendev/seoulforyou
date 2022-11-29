package com.ezdev.sfy.service;

import java.util.Hashtable;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezdev.sfy.dto.TourDTO;

@Service
public class TourMapper {
	@Autowired
	private SqlSession sqlSession;
	
	Hashtable<String, List<TourDTO>> ht;
	
	public TourMapper() {
		ht = new Hashtable<>();
	}
	
	public Hashtable<String, List<TourDTO>> getHt(){
		return ht;
	}

	public void selectAllTour(String all) {
		if (ht.containsKey(all)) {
			return;
		}
		List<TourDTO> list = sqlSession.selectList("selectAllTour");
		ht.put(all, list);
		
	}
	
	

}
