package com.ezdev.sfy.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezdev.sfy.dto.ChatDTO;

@Service
public class ChatMapper {
	
	@Autowired
	private SqlSession sqlSession;

	public List<ChatDTO> listChat(ChatDTO dto) {
		int no = dto.getNo();
		
		//로그인한 유저가 보내거나 받은 모든 쪽지 리스트를 모두 가져와
		//chat_room별로 집계한다.
		List<ChatDTO> list = sqlSession.selectList("listChat", dto);

		for (ChatDTO to : list) {
			to.setNo(no);
			//int unread = sqlSession.selectOne("count_unread", to);
			//String profile = sqlSession.selectOne("get_other_profile", to);
			//to.setUnread(unread);
			//to.setProfile(profile);
			if(no == to.getChat_send_no()) { //로그인한 유저가 보냈다면
				to.setOther_no(to.getChat_recv_no());
			}else { // 로그인한 유저가 받았다면
				to.setOther_no(to.getChat_send_no());
			}
		}
		
		return list;
	}

	public int sendChat(ChatDTO dto) {
		return sqlSession.insert("sendChat", dto);
	}

	public ArrayList<ChatDTO> listMsg(ChatDTO dto) {		
		//메세지 내역을 가져온다
		ArrayList<ChatDTO> list = (ArrayList)sqlSession.selectList("listMsg", dto);
		
		//해당 방의 메세지들 중 받는 사람이 현재사용자의 nick인 메세지를 모두 읽음 처리한다
		//sqlSession.update("message_read_chk", dto);
		
		return list;
	}

}
