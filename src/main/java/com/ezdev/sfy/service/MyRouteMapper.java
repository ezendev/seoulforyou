package com.ezdev.sfy.service;

import java.util.HashMap;
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

	public List<MyRouteDTO> listRouteIncludeTour(int no) {
		String tour_no = String.valueOf(no);
		Map<String, String> map = new HashMap<>();
		map.put("tour_no", tour_no);
		return sqlSession.selectList("listRouteIncludeTour", map);
	}
	
	  public TourDTO getTour(int tour_no) {
		   return sqlSession.selectOne("getTour", tour_no);
	  }
		  public int plusReadcount(int route_no) {
			  return sqlSession.update("plusRouteReadcount",route_no);
		  }

		public int getRouteCountByType(String routeType) {
			Map<String, String> map = new HashMap<>();
			String type="";
			if(routeType.equals("1")) {
				type="힐링";
			}else if(routeType.equals("2")) {
				type="미식";
			}else if(routeType.equals("3")) {
				type="한류";
			}else if(routeType.equals("4")) {
				type="명소";
			}else if(routeType.equals("5")) {
				type="쇼핑";
			}
			map.put("routeType", type);
			return sqlSession.selectOne("getRouteCountByType", map);
		}

		public int getRouteCount() {
			return sqlSession.selectOne("getRouteCount");
		}

		public List<MyRouteDTO> listRouteByType(String routeType, int startRow, int endRow) {
			Map<String, Object> map = new HashMap<>();
			String type="";
			if(routeType.equals("1")) {
				type="힐링";
			}else if(routeType.equals("2")) {
				type="미식";
			}else if(routeType.equals("3")) {
				type="한류";
			}else if(routeType.equals("4")) {
				type="명소";
			}else if(routeType.equals("5")) {
				type="쇼핑";
			}
			map.put("type", type);
			map.put("start", startRow);
			map.put("end", endRow);
		return sqlSession.selectList("listRouteByType", map);
		}

		public List<MyRouteDTO> listRoutePart(int startRow, int endRow) {
			Map<String, Object> map = new HashMap<>();
			map.put("start", startRow);
			map.put("end", endRow);
		
		return sqlSession.selectList("listRoutePart", map);
		}
}
