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
import com.ezdev.sfy.dto.EmailDTO;


@Service
public class AdminMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertAdmin(AdminDTO dto) {
			int res = sqlSession.insert("insertAdmin", dto);
			return res;
	}
	
	
	// 통계자료 -> 회원가입 추이
	public int[] countMemberByWeek() {
		String sql;
		Map<String, String> map = new HashMap<>(); // 쿼리문에 넘겨줄 맵
		List<Object> result = new ArrayList<>(); // 쿼리문 결과 넣을 list
		Map<String, Object> resultMap = new HashMap<>(); // list안의 맵 꺼내올 곳
		int[] unionList = new int[14]; // 모든 값 합칠 곳
		
		// 지난주 ~ 이번주
		for(int i=14; i>0; --i) {
			sql = "select count(*) as \"" + i +"\" from member" + 
				 	" where date_format(date_sub(now(), interval (weekday(now()) + \"" + (i-7) + "\")day), '%y-%m-%d') = date_format(member_regdate, '%y-%m-%d')";	
		
			map.put("sql", sql);
			
			// sql 쿼리 날려서 결과값인 맵 꺼내오기
			result = sqlSession.selectList("countMemberByWeek", map);
			resultMap = (Map<String, Object>) result.get(0); //{7=0, 5=1, ... -5=1, -6=0}
			
			// 값만 배열에 저장하기
			unionList[i-1] = ((Long) resultMap.get(String.valueOf(i))).intValue(); // [0, 1, ... 1, 0]			
			
		}
		
		return unionList;
	}
	
	
	
	// 통계자료 -> 리뷰 집계
	public int[] countReviewByWeek() {
		String sql;
		Map<String, String> map = new HashMap<>(); // 쿼리문에 넘겨줄 맵
		List<Object> result = new ArrayList<>(); // 쿼리문 결과 넣을 list
		Map<String, Object> resultMap = new HashMap<>(); // list안의 맵 꺼내올 곳
		int[] unionList = new int[7]; // 모든 값 합칠 곳
		
		// 이번주
		for(int i=0; i>-7; --i) {
			sql = "select count(*) as \"" + i +"\" from review" + 
				 	" where date_format(date_sub(now(), interval (weekday(now()) + \"" + i + "\")day), '%y-%m-%d') = date_format(review_regdate, '%y-%m-%d')";
			
			map.put("sql", sql);
			
			// sql 쿼리 날려서 결과값인 맵 꺼내오기
			result = sqlSession.selectList("countReviewByWeek", map);
			resultMap = (Map<String, Object>) result.get(0); //{7=0, 5=1, ... -5=1, -6=0}
			
			// 값만 배열에 저장하기
			unionList[i+6] = ((Long) resultMap.get(String.valueOf(i))).intValue(); // [0, 1, ... 1, 0]			
		}

		return unionList;
	}
	
	
	
	// 통계자료 -> 루트테마별 집계
	public int countRouteByHash(Map<String, String> hashtag) {
		return sqlSession.selectOne("countRouteByHash", hashtag);
	}


	public AdminDTO getAdminId(String admin_id) {
		Map<String,String> map = new HashMap<>();
		map.put("admin_id", admin_id);
		return sqlSession.selectOne("getAdminId", map);
		
	}


	public int adminUpdate(AdminDTO dto) {
		int res = sqlSession.update("adminUpdate", dto);
		return res;
	}


	public int adminDelete(AdminDTO dto) {
		int res = sqlSession.delete("adminDelete", dto);
		return res;
	}


	public int adminEmail(EmailDTO dto) {
		int res = sqlSession.insert("adminEmail", dto);
		return res;
	}


	

}
