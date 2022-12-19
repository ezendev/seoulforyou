package com.ezdev.sfy.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

@Service
public class KakaoMapper {

	
	public String getToken(String code){
		String host = "https://kauth.kakao.com/oauth/token";
		String token ="";
		try {
			URL url = new URL(host);
			HttpURLConnection urlCon = (HttpURLConnection)url.openConnection();
			//post 요청을 위한 기본값이 false인 setDoOutPut을 true로 설정
			urlCon.setRequestMethod("POST");
            urlCon.setDoOutput(true); // 데이터 기록 알려주기

            //post 요청에 필요로 요구하는 파라미터를 스트림을 통해 전송	
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(urlCon.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=4433f36e8b4d7a77d2fdd1a85312d7fe");
            sb.append("&redirect_uri=http://localhost:8081/sfyy/kakaoLogin.do");
            sb.append("&code=" + code);
            
            bw.write(sb.toString());
            bw.flush();
            
            //결과 코드가 200이면 성공
            int responseCode = urlCon.getResponseCode();
            System.out.println("respCode: "+ responseCode);
            
            //요청을 통해 얻은 json타입의 response메세지 읽기
            BufferedReader br = new BufferedReader(new InputStreamReader(urlCon.getInputStream()));
            String line = "";
            String result = "";
            while ((line = br.readLine()) != null) {
                result += line;
            }
            //System.out.println("response Body = " + result);
            
            
            //json parsing
            JSONParser parser = new JSONParser();
            JSONObject elem = (JSONObject)parser.parse(result);
            
            String access_token = elem.get("access_token").toString();
            String refresh_token = elem.get("refresh_token").toString();
            //System.out.println("refresh_token :"+ refresh_token);
            //System.out.println("access_token :"+ access_token);
		
            token = access_token;
            
            br.close();
            bw.close();
		}catch(IOException e) {
			e.printStackTrace();
		} catch (org.json.simple.parser.ParseException e) {
			e.printStackTrace();
		}
		return token;
	}
	
	public Map<String, String> getUserInfo(String access_token)throws IOException{
		String host = "https://kapi.kakao.com/v2/user/me";
        Map<String, String> userInfo = new HashMap<>();
        try {
            URL url = new URL(host);

            HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            urlConnection.setRequestMethod("POST");
            urlConnection.setRequestProperty("Authorization", "Bearer " + access_token);

            int responseCode = urlConnection.getResponseCode();
            System.out.println("responseCode = " + responseCode);


            BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
            String line = "";
            String res = "";
            while((line=br.readLine())!=null)
            {
                res+=line;
            }

           // System.out.println("res = " + res);


            JSONParser parser = new JSONParser();
            JSONObject obj = (JSONObject) parser.parse(res);
            JSONObject kakao_account = (JSONObject) obj.get("kakao_account");
            JSONObject profile = (JSONObject) kakao_account.get("profile");


            String id = obj.get("id").toString();
            String nickname = profile.get("nickname").toString();
            String email = kakao_account.get("email").toString();

            userInfo.put("member_id", id);
            userInfo.put("member_name", nickname);
            userInfo.put("member_email", email);
            

            br.close();


        } catch (IOException |org.json.simple.parser.ParseException e) {
            e.printStackTrace();
        
		}
        	return userInfo;
    }
	
	public void kakaoLogout(String access_Token) {
	    String reqURL = "https://kapi.kakao.com/v1/user/logout";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println(result);
	        System.out.println("로그아웃 완료");
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}

	}
