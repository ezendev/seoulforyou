package com.ezdev.sfy.service;

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
      return sqlSession.selectList("listTour");
   }

   public List<TourDTO> listTourByRegion(String region) {
	   Map<String, String> map = new Hashtable<>();
	      String [] str=new String[] {"강서구","양천구","구로구","영등포구","금천구","동작구","관악구","서초구","강남구","송파구","강동구","마포구","용산구","성동구","광진구","서대문구","종로구","중구","동대문구","은평구","성북구","중랑구","강북구","도봉구","노원구"};
	      for (int i = 1; i <=str.length; i++) {	
				if(region.equals(Integer.toString(i))) {
					  map.put("region", str[i-1]);
				}
				 
			}		 
	      return sqlSession.selectList("listTourByRegion", map);
   }
   
   public List<TourDTO> findTour(String keyword){
		Map<String, String> map = new Hashtable<>();
		map.put("keyword", keyword);
		return sqlSession.selectList("findTour", map);
	}
   
}
	   

