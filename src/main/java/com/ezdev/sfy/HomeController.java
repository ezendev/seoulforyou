package com.ezdev.sfy;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezdev.sfy.dto.MemberDTO;
import com.ezdev.sfy.service.MemberMapper;


@Controller
public class HomeController {
	@Autowired
	private MemberMapper memberMapper;
	
	@RequestMapping(value = {"/", "/index.do"}, method = RequestMethod.GET)
	public String home() {
		return "index";
	}
	
	//로그인
	@RequestMapping("/login.do")
	public String login() {
		return "login";
	}
	
	
	//채팅 페이지
	@RequestMapping("/chat.do")
	public String chatting() {
		return "chat/chat";
	}
	
	//회원가입
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String sign_up() {
		return "pages/join";
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String sign_up(HttpServletRequest req, @ModelAttribute MemberDTO dto) {
		int res = memberMapper.insertMember(dto);
		if (res>0) {
			req.setAttribute("msg", "회원가입 성공!! 로그인을 해 주세요");
			return "forward:closeWindow.jsp";
		}else {
			req.setAttribute("msg", "회원가입 실패!! 회원가입로 이동합니다.");
			req.setAttribute("url", "sign_up.do");
			return "message";
		}
	}
	
}
