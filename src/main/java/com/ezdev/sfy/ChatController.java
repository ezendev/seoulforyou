package com.ezdev.sfy;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezdev.sfy.dto.ChatDTO;
import com.ezdev.sfy.dto.MemberDTO;
import com.ezdev.sfy.service.ChatMapper;


@Controller
public class ChatController {
	@Autowired
	private ChatMapper chatMapper;

	//쪽지 페이지 접속 + 대화목록 불러오기
	@RequestMapping("/chat.do")
	public String chat(HttpServletRequest req, HttpSession session) {

		//세션에서 꺼내온 로그인 된 유저의 member 테이블 no 값
		int no = (int) session.getAttribute("nowUserNo");
		
		ChatDTO dto = new ChatDTO();
		dto.setNo(no);
		
		ArrayList<ChatDTO> list = (ArrayList)chatMapper.listChat(dto);
		
		req.setAttribute("chatList", list);
		return "chat/chat_list";
	}
	
	//대화방 클릭시 room별 메세지 내용을 가져온다
	@RequestMapping("/chatView.do")
	public String chatView(HttpServletRequest req, HttpSession session) {
		
		int no = (int) session.getAttribute("nowUserNo");
		int other_no = Integer.parseInt(req.getParameter("other_no"));
		int chat_room = Integer.parseInt(req.getParameter("chat_room"));
		
		ChatDTO dto = new ChatDTO();
		dto.setNo(no);
		dto.setOther_no(other_no);
		dto.setChat_room(chat_room);
		
		//메세지 내용을 가져온다.
		ArrayList<ChatDTO> list = chatMapper.listMsg(dto);
		
		req.setAttribute("msgList", list);
		req.setAttribute("nowUserNo", no); // 유저 no 세션에 저장 -> 로그인C에서 처리하면 좋겠다.. mdto만 넣기엔 값 꺼내오기가
		
		return "chat/chat_ajax_list";
	}
	
	@RequestMapping("/chatSubmit.do")
	public String chatSubmit(HttpServletRequest req, HttpSession session) {
		int other_no = Integer.parseInt(req.getParameter("other_no"));
		int chat_room = Integer.parseInt(req.getParameter("chat_room"));
		String chatContent = req.getParameter("content");
		
		int no = (int) session.getAttribute("nowUserNo");
		
		ChatDTO dto = new ChatDTO();
		dto.setChat_content(chatContent);
		dto.setChat_room(chat_room);
		dto.setChat_recv_no(other_no);
		dto.setChat_send_no(no);

		int res = chatMapper.sendChat(dto);
		if(res > 0) {
			return "chat/chat_list";
		}else {
			req.setAttribute("msg", "채팅 보내기 실패!");
			req.setAttribute("url", "/chat.do");
			return "message.jsp";
		}
		
		
	}

	
}
