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
      
      if(region.equals("1")) {
         map.put("region", "강서구");
      }else if(region.equals("2")) {
          map.put("region", "양천구");
       }else if(region.equals("3")) {
           map.put("region", "구로구");
        }else if(region.equals("4")) {
            map.put("region", "영등포구");
        }else if(region.equals("5")) {
            map.put("region", "금천구");
        }else if(region.equals("6")) {
            map.put("region", "동작구");
        }else if(region.equals("7")) {
            map.put("region", "관악구");
        }else if(region.equals("8")) {
            map.put("region", "서초구");
        }else if(region.equals("9")) {
            map.put("region", "강남구");
        }else if(region.equals("10")) {
            map.put("region", "송파구");
        }else if(region.equals("11")) {
            map.put("region", "강동구");
        }else if(region.equals("12")) {
            map.put("region", "마포구");
        }else if(region.equals("13")) {
            map.put("region", "용산구");
        }else if(region.equals("14")) {
            map.put("region", "성동구");
        }else if(region.equals("15")) {
            map.put("region", "광진구");
        }else if(region.equals("16")) {
            map.put("region", "서대문구");
        }else if(region.equals("17")) {
            map.put("region", "종로구");
        }else if(region.equals("18")) {
            map.put("region", "중구");
        }else if(region.equals("19")) {
            map.put("region", "동대문구");
        }else if(region.equals("20")) {
            map.put("region", "은평구");
        }else if(region.equals("21")) {
            map.put("region", "성북구");
        }else if(region.equals("22")) {
            map.put("region", "중랑구");
        }else if(region.equals("23")) {
            map.put("region", "강북구");
        }else if(region.equals("24")) {
            map.put("region", "도봉구");
        }else if(region.equals("25")) {
            map.put("region", "노원구");
        }
      return sqlSession.selectList("listTourByRegion", map);
   }

}
