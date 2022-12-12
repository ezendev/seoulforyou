package com.ezdev.sfy.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezdev.sfy.dto.ChatDTO;
import com.ezdev.sfy.dto.MemberDTO;

@Service
public class ChatMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private MemberMapper memberMapper;

	public List<ChatDTO> listChat(ChatDTO dto) {
		int no = dto.getNo();
		
		//로그인한 유저가 보내거나 받은 모든 쪽지 리스트를 모두 가져와
		//chat_room별로 집계한다.
		List<ChatDTO> list = sqlSession.selectList("listChat", dto);

		for (ChatDTO to : list) {
			to.setNo(no);
			
			// 현재 사용자가 (현재) room에서 안읽은 메세지의 갯수를 가져온다.
			int unread = sqlSession.selectOne("countUnread", to);
			to.setUnread(unread);
			
			//String profile = sqlSession.selectOne("get_other_profile", to);
			//to.setProfile(profile);
			
			if(no == to.getChat_send_no()) { //로그인한 유저가 보냈다면
				// 받은 사람의 no로 other_no과 other_name 세팅
				int other_no = to.getChat_recv_no();
				MemberDTO mdto = memberMapper.getMemberNo(other_no);
				String other_name = mdto.getMember_name();
				to.setOther_no(other_no);
				to.setOther_name(other_name);
				
			}else { // 로그인한 유저가 받았다면
				// 보낸 사람의 no로 other_no과 other_name 세팅
				int other_no = to.getChat_send_no();
				MemberDTO mdto = memberMapper.getMemberNo(other_no);
				String other_name = mdto.getMember_name();
				to.setOther_no(other_no);
				to.setOther_name(other_name);
			}
		}
		
		return list;
	}

	public int sendChat(ChatDTO dto) {
		if(dto.getChat_room()==0) { //방이 없다면(메시지 처음 보낸다면)
			int max_room;
			
			if(sqlSession.selectOne("sizeRoom") == null) {
				max_room = 0;
			}else {
				max_room = sqlSession.selectOne("sizeRoom");
			}
			dto.setChat_room(max_room+1);
		}
		
		return sqlSession.insert("sendChat", dto);
	}

	public ArrayList<ChatDTO> listMsg(ChatDTO dto) {
		// 대화상대의 no로 other_name 가져오고
		int other_no = dto.getOther_no();
		MemberDTO mdto = memberMapper.getMemberNo(other_no);
		String other_name = mdto.getMember_name();
		
		//메세지 내역을 가져온다
		ArrayList<ChatDTO> list = (ArrayList)sqlSession.selectList("listMsg", dto);

		// 각 메세지에 other_name과 other_no 세팅
		for(ChatDTO to : list) {
			to.setOther_name(other_name);
			to.setOther_no(other_no);
		}
		
		//해당 방의 메세지들 중 받는 사람이 현재사용자의 nick인 메세지를 모두 읽음 처리한다
		sqlSession.update("chkRead", dto);
		
		return list;
	}
	
	public int deleteChat(Map<String, Integer> map) {
		return sqlSession.delete("deleteChat", map);
	}

}
