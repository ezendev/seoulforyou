package com.ezdev.sfy.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezdev.sfy.dto.TourDTO;

@Service
public class TourApiMapper {
	@Autowired
	private SqlSession sqlSession;
	private TourDTO tdto;
	
	// 문자열이 숫자("1")변환 가능한지 확인하는 메소드
	public static boolean isNumeric(String s) {
		  try {
		      Double.parseDouble(s);
		      return true;
		  } catch(NumberFormatException e) {
		      return false;
		  }
		}
	
	public int insertDb(JSONArray parseRow, int type) {
		List<TourDTO> tlist = new ArrayList<>();
		
		for(int i=0; i<parseRow.size(); i++) { //row갯수만큼 for문을 돌며
			JSONObject objectRow = (JSONObject)parseRow.get(i); // i번째 배열요소에 대하여
			
			//언어
			String lang = (String)objectRow.get("LANG_CODE_ID");
			//주소
			String addr = (String)objectRow.get("NEW_ADDRESS");
			//우편번호
			String postal = "";
			//상호명
			String name = (String)objectRow.get("POST_SJ");			
			//전화번호
			String hp = (String)objectRow.get("CMMN_TELNO");
			//운영시간
			String open_time = (String)objectRow.get("CMMN_USE_TIME");
			//운영요일
			String open_day = (String)objectRow.get("CMMN_BSNDE");
			//휴무일
			String close_day = (String)objectRow.get("CMMN_RSTDE");
			//교통정보
			String traffic = (String)objectRow.get("CMMN_RSTDE");
			
			if(lang.trim().equals("ko")) { //언어가 한글이면
				if(!addr.replace(" ","").equals("")) { //주소가 존재 하면
					if(addr.substring(3,4).equals("-")){ // 우편번호가 000-000형식이면
						//우편번호만 잘라낸 후
						postal = addr.substring(0,7);
						//주소에서 우편번호 제거 -> 앞뒤 공백제거
						addr = addr.replace(postal, "");
						addr = addr.trim();
						//우편번호에서 - , 공백 제거
						postal = postal.replace("-", "");
						postal = postal.trim();
						
					}else if(isNumeric(addr.substring(0,6)) == true) { // 우편번호가 000000 형식이면
						postal = addr.substring(0,6);
						addr = addr.replace(postal, "");
						addr = addr.trim();
						
					}else if(isNumeric(addr.substring(0,5)) == true){ // 우편번호가 00000 형식이면
						postal = addr.substring(0,5);
						postal = postal.trim();
						addr = addr.replace(postal, "");
						addr = addr.trim();
						
					}else if(isNumeric(addr.substring(0,1)) == false){ //우편번호가 없으면(첫글자가 숫자가 아니면)
						addr = addr.trim();
						postal = " ";
					}else {
						addr = addr.trim();
						postal = " ";
					}
					
					//if(addr.replace(" ","").equals("")) { //주소가 null이면 db에 공백으로 저장
					//	addr = " ";
					//}
					
				}
				
				// tdto 객체 만들기
				TourDTO tdto = new TourDTO();
				tdto.setTour_type(type);
				tdto.setTour_name(name);
				tdto.setTour_postal(postal);
				tdto.setTour_addr(addr);
				tdto.setTour_hp(hp);
				tdto.setTour_open_time(open_time);
				tdto.setTour_open_day(open_day);
				tdto.setTour_close_day(close_day);
				tdto.setTour_traffic(traffic);
				
				// tlist에 tdto 넣기
				tlist.add(tdto);
			}
			
		}
		
		// 매퍼xml에 tlist 넘겨서 쿼리문 실행하기
		int res = sqlSession.insert("insertDb", tlist);
		return res;
	}
	
	public int insertDbHotel(JSONArray parseRow, int type) {
		List<TourDTO> tlist = new ArrayList<>();
		
		for(int i=0; i<parseRow.size(); i++) { //row갯수만큼 for문을 돌며
			JSONObject objectRow = (JSONObject)parseRow.get(i); // i번째 배열요소에 대하여

			//주소
			String addr = (String)objectRow.get("RDNWHLADDR");
			//우편번호
			String postal = (String)objectRow.get("RDNPOSTNO");
			//상호명
			String name = (String)objectRow.get("BPLCNM");			
			//전화번호
			String hp = (String)objectRow.get("SITETEL");
			//운영시간
			String open_time = "";
			//운영요일
			String open_day = "";
			//휴무일
			String close_day = "";
			//교통정보
			String traffic = "";
			
			// tdto 객체 만들기
			TourDTO tdto = new TourDTO();
			tdto.setTour_type(type);
			tdto.setTour_name(name);
			tdto.setTour_postal(postal);
			tdto.setTour_addr(addr);
			tdto.setTour_hp(hp);
			tdto.setTour_open_time(open_time);
			tdto.setTour_open_day(open_day);
			tdto.setTour_close_day(close_day);
			tdto.setTour_traffic(traffic);
			
			// tlist에 tdto 넣기
			tlist.add(tdto);
		}
		
		// 매퍼xml에 tlist 넘겨서 쿼리문 실행하기
		int res = sqlSession.insert("insertDb", tlist);
		return res;
	}

	public int deleteDb(int type) {
		int res = sqlSession.delete("deleteDb", type);
		return res;
	}
}
