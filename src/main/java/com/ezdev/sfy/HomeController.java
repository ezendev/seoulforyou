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

	
	@RequestMapping(value = {"/", "/index.do"}, method = RequestMethod.GET)
	public String home() {
		return "index";
	}
	

	
}
