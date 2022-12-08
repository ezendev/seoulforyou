package com.ezdev.sfy.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezdev.sfy.dto.MemberDTO;
import com.ezdev.sfy.dto.MyRouteDTO;

@Service
public class MyRouteMapper {
	@Autowired
	private SqlSession sqlSession;
	
	public List<MyRouteDTO> listRoute(){
		return sqlSession.selectList("listMyRoute");
	}
	
	public int insertRoute(MyRouteDTO dto) throws Exception{
		return sqlSession.insert("insertRoute", dto);
		
	}
}
