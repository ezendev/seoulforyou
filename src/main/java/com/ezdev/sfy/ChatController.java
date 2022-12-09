package com.ezdev.sfy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezdev.sfy.dto.ChatDTO;
import com.ezdev.sfy.dto.MemberDTO;
import com.ezdev.sfy.dto.MyPageDTO;
import com.ezdev.sfy.service.ChatMapper;
import com.ezdev.sfy.service.MypageMapper;


@Controller
public class ChatController {
	@Autowired
	private ChatMapper chatMapper;
	@Autowired
	private MypageMapper mypageMapper;

	//쪽지 페이지 접속 + 대화목록 + 친구목록 불러오기
	@RequestMapping("/chat.do")
	public String chat(HttpServletRequest req, HttpSession session) {

		//세션에서 꺼내온 로그인 된 유저의 member 테이블 no 값
		int no = (int) session.getAttribute("nowUserNo");
		
		ChatDTO dto = new ChatDTO();
		dto.setNo(no);
		
		ArrayList<ChatDTO> chat_list = (ArrayList)chatMapper.listChat(dto);
		
		// 친구 리스트 불러오기
			// 로그인한 유저의 mypageDTO에서 친구 불러오기
		MyPageDTO mdto = mypageMapper.getMyPage(no);
		String friends = mdto.getMypage_friend();

		if(friends != null) {
			//콤마를 기준으로 배열에 넣고 mybatis foreach 처리를 위해 리스트에 넣기
			String[] arr = friends.split(",");
			List list = new ArrayList();
			for(int i=0; i<arr.length; i++) {
				list.add(arr[i]);
			}
			
			//mybatis String 매개변수 처리를 위해 map에 넣기
			Map<String, Object> map = new HashMap<>();
			map.put("friends", list);
			
			List<MemberDTO> friend_list = mypageMapper.listFriend(map);
			req.setAttribute("listFriend", friend_list);
		}
		
		req.setAttribute("chatList", chat_list);
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
	
	//쪽지 전송
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
	
	//새 쪽지 시작
	@RequestMapping("/startChat.do")
	public String startChat(HttpServletRequest req, HttpSession session) {
		System.out.println("야호");
		return null;
	}

	
}
