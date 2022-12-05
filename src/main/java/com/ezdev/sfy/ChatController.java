package com.ezdev.sfy;

import javax.servlet.http.HttpServletRequest;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class ChatController {

	//채팅 페이지
	@RequestMapping("/chat.do")
	public String chatting() {
		return "chat/chat_list";
	}
	

	
}
