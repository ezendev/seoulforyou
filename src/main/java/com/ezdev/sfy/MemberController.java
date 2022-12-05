package com.ezdev.sfy;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezdev.sfy.dto.MemberDTO;
import com.ezdev.sfy.service.MemberMapper;

@Controller
public class MemberController {
	@Autowired
	MemberMapper memberMapper;

	//로그인
	@RequestMapping("/login.do")
	public String login() {
		return "login";
    }

	//회원가입
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String member_input() {
		return "pages/join";
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String member_input_ok(HttpServletRequest req, @ModelAttribute MemberDTO dto) {
		int res = memberMapper.insertMember(dto);
		if (res>0) {
			req.setAttribute("msg", "회원 등록 성공!! 로그인을 해 주세요");
			req.setAttribute("url", "index.do");
			return "message";
		}else {
			req.setAttribute("msg", "회원 등록 실패!! 회원등록페이지로 이동합니다.");
			req.setAttribute("url", "join.do");
			return "message";
		}
	}
}