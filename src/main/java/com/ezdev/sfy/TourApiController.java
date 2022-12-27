package com.ezdev.sfy;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.ezdev.sfy.service.TourApiMapper;


@Controller
public class TourApiController {
	@Autowired
	private TourApiMapper tourApiMapper;

	//임시 db 페이지로 가는 mapping -> bottom.jsp 인스타그램 아이콘
		@RequestMapping("/dbTemp.do")
		public String dbTemp(){
			return "admin/dbTemp";
		}
		
		//db 저장하는 mapping
		@RequestMapping("/dbSave.do")
		public String dbSave(HttpServletRequest req,
								@RequestParam String api) throws IOException {
			StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088"); /*URL*/
			/*			인증키			*/
			urlBuilder.append("/" +  URLEncoder.encode("774e734f54343231313038766d434875","UTF-8") );
			urlBuilder.append("/" +  URLEncoder.encode("json","UTF-8") ); /*요청파일타입 (xml,xmlf,xls,json) */
			urlBuilder.append("/" + URLEncoder.encode(api,"UTF-8")); /*서비스명 (대소문자 구분 필수입니다.)*/
			urlBuilder.append("/" + URLEncoder.encode("1","UTF-8")); /*요청시작위치 (sample인증키 사용시 5이내 숫자)*/
			urlBuilder.append("/" + URLEncoder.encode("300","UTF-8")); /*요청종료위치(sample인증키 사용시 5이상 숫자 선택 안 됨)*/
			// 상위 5개는 필수적으로 순서바꾸지 않고 호출해야 합니다.
			
			// 서비스별 추가 요청 인자이며 자세한 내용은 각 서비스별 '요청인자'부분에 자세히 나와 있습니다.
			if(api.equals("TbVwEntertainment")) {
				urlBuilder.append("/" + URLEncoder.encode("ko","UTF-8")); /* 서울관광 문화 요청시에만 언어인자 추가*/
			}
			
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/xml");
			System.out.println("Response code: " + conn.getResponseCode()); /* 연결 자체에 대한 확인이 필요하므로 추가합니다.*/
			BufferedReader rd;

			// 서비스코드가 정상이면 200~300사이의 숫자가 나옵니다.
			if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
					rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
					rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
					sb.append(line);
			}
			rd.close();
			conn.disconnect();		
			//여기까지 api 불러오기 완료
			
			String jsonData = sb.toString();

			try {
				//String 변환해서 전체 json객체 만들기
				JSONParser jsonParser = new JSONParser();
				JSONObject jsonObj = (JSONObject)jsonParser.parse(jsonData);
				
				//key값이 'api명'인것만 꺼내기
				JSONObject parseKey = (JSONObject)jsonObj.get(api);
				//key값이 row인것만 꺼내기 (배열)
				JSONArray parseRow = (JSONArray)parseKey.get("row");
				
				//관광api 타입
				int type = 0;
				if(api.equals("TbVwEntertainment")) { //문화
					type = 1;
				}else if(api.equals("TbVwAttractions")) { //명소
					type = 2;
				}else if(api.equals("TbVwNature")) { //자연
					type = 3;
				}else if(api.equals("TbVwRestaurants")) { //음식
					type = 4;
				}else if(api.equals("LOCALDATA_031101")) { //숙박
					type = 5;
				}
				
				//데이터 배열 + 타입 적어 클래스 매퍼로 넘기기
				int res;
				if(api.equals("LOCALDATA_031101")) { //숙박인 경우
					res = tourApiMapper.insertDbHotel(parseRow, type);
				}else {
					res = tourApiMapper.insertDb(parseRow, type);
				}
				
				if (res>0) {
					req.setAttribute("msg", api + " db 저장 성공!!");	
				}else {
					req.setAttribute("msg", api + " db 저장 실패!!");
				}
				
				req.setAttribute("url", "dbTemp.do");
				return "message";
				
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			
			return null;						
		}
		
		//db 삭제하는 mapping
		@RequestMapping("/dbDelete.do")
		public String dbDelete(HttpServletRequest req,
								@RequestParam String api) {
			
			//관광api 타입
			int type = 0;
			if(api.equals("TbVwEntertainment")) { //문화
				type = 1;
			}else if(api.equals("TbVwAttractions")) { //명소
				type = 2;
			}else if(api.equals("TbVwNature")) { //자연
				type = 3;
			}else if(api.equals("TbVwRestaurants")) { //음식
				type = 4;
			}else if(api.equals("LOCALDATA_031101")) { //숙박
				type = 5;
			}
			
			int res = tourApiMapper.deleteDb(type);
			if (res>0) {
				req.setAttribute("msg", api + " db 삭제 성공!!");	
			}else {
				req.setAttribute("msg", api + " db 삭제 실패!!");
			}
			
			req.setAttribute("url", "dbTemp.do");
			return "message";
		}
	
}
