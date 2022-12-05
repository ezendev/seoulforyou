package com.ezdev.sfy.service;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezdev.sfy.dto.TourDTO;

@Service
public class TourMapper {
   @Autowired
   private SqlSession sqlSession;

   public List<TourDTO> listTour() {
		Map<String, Integer> map = new HashMap<>();
		
	      return sqlSession.selectList("listTour", map);
	   }
   
   public List<TourDTO> listTour(int startRow, int endRow) {
	   Map<String, Integer> map = new HashMap<>();
	   map.put("start", startRow);
	   map.put("end", endRow);
	   
      return sqlSession.selectList("listTour", map);
   }
   
   public List<TourDTO> listTourByRegion(String region) {
	   Map<String, String> map = new HashMap<>();
	      String [] str=new String[] {"강서구","양천구","구로구","영등포구","금천구","동작구","관악구","서초구","강남구","송파구","강동구","마포구","용산구","성동구","광진구","서대문구","종로구","중구","동대문구","은평구","성북구","중랑구","강북구","도봉구","노원구"};
	      for (int i = 1; i <=str.length; i++) {	
				if(region.equals(Integer.toString(i))) {
					  map.put("region", str[i-1]);
				}
				 
			}		 
	      return sqlSession.selectList("listTourByRegion", map);
   }
   
   public List<TourDTO> listTourByType(String tourType, int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<>();
			map.put("type", Integer.parseInt(tourType));
			map.put("start", startRow);
			map.put("end", endRow);
		
		return sqlSession.selectList("listTourByType", map);
	}
   
   public int getTourCount() {
		return sqlSession.selectOne("getTourCount");
	}
   
   public int getTourCountByType(String tourType) {
		int type = Integer.parseInt(tourType);
		return sqlSession.selectOne("getTourCountByType", type);
	}
   
   public int getTourCountByRegion(String region) {
		 Map<String, String> map = new HashMap<>();
	      String [] str=new String[] {"강서구","양천구","구로구","영등포구","금천구","동작구","관악구","서초구","강남구","송파구","강동구","마포구","용산구","성동구","광진구","서대문구","종로구","중구","동대문구","은평구","성북구","중랑구","강북구","도봉구","노원구"};
	      for (int i = 1; i <=str.length; i++) {	
				if(region.equals(Integer.toString(i))) {
					  map.put("region", str[i-1]);
				}
			}
	      int res = sqlSession.selectOne("getTourCountByRegion", map);
	      return res;
	}
   
   public int getTourCountByRegionType(String tourType, String region) {
		Map<String, Object> map = new HashMap<>();
	    String [] str=new String[] {"강서구","양천구","구로구","영등포구","금천구","동작구","관악구","서초구","강남구","송파구","강동구","마포구","용산구","성동구","광진구","서대문구","종로구","중구","동대문구","은평구","성북구","중랑구","강북구","도봉구","노원구"};
	    for (int i = 1; i <=str.length; i++) {	
				if(region.equals(Integer.toString(i))) {
					  map.put("region", str[i-1]);
				}
			}
	    int type = Integer.parseInt(tourType);
	    map.put("type", type);
	    return sqlSession.selectOne("getTourCountByRegionType", map);
	}
   
   public List<TourDTO> findTour(Map<String, String> sqlMap){
		return sqlSession.selectList("findTour", sqlMap);
	}
   public TourDTO getTour(int tour_no) {
	   return sqlSession.selectOne("getTour", tour_no);
   }
   
}
	   

