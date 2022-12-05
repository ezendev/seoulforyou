package com.ezdev.sfy;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezdev.sfy.dto.ChatDTO;
import com.ezdev.sfy.service.ChatMapper;


@Controller
public class ChatController {
	@Autowired
	private ChatMapper chatMapper;

	//채팅 페이지
	@RequestMapping("/chat.do")
	public String chat(HttpServletRequest req, HttpSession session) {
		//세션에서 꺼내온 로그인 된 유저의 member 테이블 no 값
		//int no = (int) session.getAttribute("mem_no");
		int no = 1; //임시
		
		ChatDTO dto = new ChatDTO();
		dto.setNo(no);
		
		ArrayList<ChatDTO> list = (ArrayList)chatMapper.listChat(dto);
		
		req.setAttribute("list", list);
		return "chat/chat_list";
	}
	
	@RequestMapping("/chatSubmit.do")
	public String chatSubmit(HttpServletRequest req, @RequestParam String chatContent) {
		int res = chatMapper.sendChat(chatContent);
		if(res > 0) {
			return "chat/chat_list";
		}else {
			req.setAttribute("msg", "채팅 보내기 실패!");
			req.setAttribute("url", "/chat.do");
			return "message.jsp";
		}
		
	}

	
}
