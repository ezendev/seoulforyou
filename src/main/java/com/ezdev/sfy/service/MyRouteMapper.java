package com.ezdev.sfy.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezdev.sfy.dto.TourDTO;
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
	
	public MyRouteDTO getRoute(int route_no) {
		return sqlSession.selectOne("getRoute", route_no);
	}
	
	public int updateRoute(MyRouteDTO dto)throws Exception{
		return sqlSession.update("updateRoute", dto);
	}
	public int delMyroute(int route_no) {
		return sqlSession.delete("delMyroute", route_no);
	}
	
	public List<TourDTO> findTour(Map<String, String> sqlMap){
		return sqlSession.selectList("findTour", sqlMap);
	}
}
